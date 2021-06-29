

-- ------------------------------ lesson_7 work 3 -------------------------

select id, c1.name as from_citie , c2.name as to_citie from flight f join
cities c1 on from_citie = c1.label join 
cities c2 on to_citie = c2.label order by id desc;





-- -----------------------------------------------Lesson_8-9 1 ------------------------------------------------

start transaction;

select * from sample.users u;

select * from shop.users;

delete from sample.users where id = 1;

insert into sample.users select * from shop.users where id = 1;

commit;


-- ----------------------------------------------- 2 ---------------------------------------------------

select p.name, c.name from products p join
catalogs c on catalog_id = c.id;

create view v1 (name_products, name_catalogs) as select p.name, c.name from products p join
catalogs c on catalog_id = c.id with check option;

select * from v1;

show tables;


-- ----------------------------------------------- 3 -----------------------------------------------------




create table calendars (
	created_at date
);

insert into calendars values ('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17');
update calendars set created_at = date('2018-08-04') where created_at = date('2016-08-04');


create table calendars2 ( created_at date);
insert into calendars2 values ('2018-08-01'),('2018-08-02'), ('2018-08-03'), ('2018-08-04'), ('2018-08-05'),
('2018-08-06'), ('2018-08-07'), ('2018-08-07'), ('2018-08-08'), ('2018-08-09'), ('2018-08-010'),
('2018-08-11'), ('2018-08-12'), ('2018-08-13'), ('2018-08-14'), ('2018-08-15'), ('2018-08-16'), ('2018-08-17'),
('2018-08-18'), ('2018-08-19'), ('2018-08-20'), ('2018-08-21'), ('2018-08-22'), ('2018-08-23'), ('2018-08-24'),
('2018-08-25'), ('2018-08-26'), ('2018-08-27'), ('2018-08-28'), ('2018-08-29'), ('2018-08-30'), ('2018-08-31');




select c2.created_at, if(c2.created_at in (select created_at from calendars c), 1, 0) as zero_one from calendars2 c2;



-- ---------------------------------------------- 4 ----------------------------------------------------



select c.created_at from calendars2 c where created_at <= 
(select * from calendars2 c2 order by created_at desc limit 5, 1);



delete calendars2 from calendars2 c join
(select created_at from calendars2 c2 order by c2.created_at desc limit 5, 1) as calendar
on c.created_at <= calendar.created_at commit ' this is not work';



start transaction;

create temporary table limited (id date);

show tables;

insert into limited (id) select created_at from calendars2 order by created_at desc limit 5;

delete from calendars2 where created_at not in (select id from limited);

drop temporary table limited;

commit; -- This is working 



-- ------------------------------------------------- MySQL Administration ------------------------

use mysql;

grant select on shop.* to `us1`@`localhost` IDENTIFIED with sha256_password by '123';

create user us2 IDENTIFIED with sha256_password by '456';

grant all on shop.* to us2;


-- ----------------------------------------------------- 2 -------------------------

create or replace view  accounts_read as select * from accounts;

grant useage, select(id, name) on shop.accounts_read to `user_read`@`localhost` IDENTIFIED with sha256_password by '123';




-- -------------------------------------- Stored procedures and functions, triggers -----------------------


use shop;

delimiter //

CREATE FUNCTION shop.hello()
RETURNS varchar(50) deterministic
begin
	declare param time default time(now())
	case
	when ('06:00:00' <= param) and (param < '12:00:00') then 
	return 'Good morning';
	when ('12' <= param) and (param < '18') then 
	return 'Good afternoon';
	when ('18' <= param) and (param < '23:59:59') then 
	return 'Dood evening';
	else 
	return 'Good night';
	end case;
end//


select hello()//


-- ----------------------------------------------- 2 --------------------------------

select * from products p //
describe products //



create trigger check_products_update before update on products
for each row
begin
	if (name = null  or description = null) then 
	signal sqlstate '23000' set message_text = 'error in the inserted value';
	end if;
end//


update products set name = 'AMD FX-9000', description = null where id = 3//



create trigger check_products_inert before insert on products
for each row
begin
	if (name = null  or description = null) then 
	signal sqlstate '23000' set message_text = 'error in the inserted value';
	end if;
end//


insert into products (name, description) values (null, 'process')//


-- ------------------------------------------ 3 -----------------------------------------


    
CREATE DEFINER=`root`@`localhost` function `shop`.`fibonacci`(param int unsigned)
returns int unsigned deterministic
begin
	declare brushes int unsigned default 1;
	declare brushes_1 int unsigned default 0;
	declare brushes_2 int unsigned default 1;
	
	while (brushes <= (param / 2)) do
		set brushes = brushes + 1;
		set brushes_1 = brushes_2 + brushes_1;
		set brushes_2 = brushes_1 + brushes_2;
	end while;
	if ((param % 2) = 1) then
		return brushes_1;
	else
		return brushes_2;
	end if;
end//

select fibonacci(3)//




