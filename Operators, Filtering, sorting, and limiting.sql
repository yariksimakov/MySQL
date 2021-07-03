

use vk;

select created_at, updated_at from  media_types;

-- ------------------------------- 1 ----------------------------------------- 
alter table users add column created_at datetime default now();
alter table users add column updated_at datetime default now();


select firstname, date_format(created_at, '%d.%m.%y %H:%i') as created_at from users;
select firstname, substring(created_at, 1, 16) as created_at from users;

-- alter table users change created_at created_at date as date(created_at);

-- -------------------------------- 2 ------------------------------------------

select date_format(created_at, '%H:%i %d.%m.%Y ') from users;

alter table users add column created_at_new varchar(30),
add column updated_at_new varchar(30);

update users set created_at_new = date_format(created_at, '%H:%i %d-%m-%Y '), updated_at_new = date_format(updated_at, '%H:%i %d-%m-%Y ');


alter table users drop created_at, drop updated_at, rename column created_at_new to created_at, 
rename column updated_at_new to updated_at;



-- -------------------------------- 3 ------------------------------------------

create table  storehouses_products (
	product_id bigint unsigned not null unique,
	product int unsigned
);

INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('0', 965314);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('1', 336974564);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('2', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('3', 942);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('4', 232989);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('5', 5);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('7', 49452023);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('20', 718499377);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('23', 680535410);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('24', 12);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('25', 64737);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('27', 62);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('34', 6008);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('38', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('51', 466);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('52', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('56', 9);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('68', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('70', 58);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('71', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('114', 0);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('12', 389312623);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('15', 59);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('18', 908680235);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('19', 7735);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('29', 88292);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('31', 6290788);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('42', 128949866);
INSERT INTO `storehouses_products` (`product_id`, `product`) VALUES ('50', 0);





select product_id, product as p from storehouses_products 
order by if(p = 0, 1, 0), p;


-- ---------------------------------------- 4 ------------------------------

/*select user_id, birthday from profiles 
where date_format(birthday, '%m') = 5 or date_format(birthday, '%m') = 8;
*/



select firstname, lastname from users where id in (select user_id from profiles 
where date_format(birthday, '%m') = 5 or date_format(birthday, '%m') = 8);


-- ----------------------------------------- 5 ---------------------------------

select * from users order by case 
					when id = 102 then 1
					else 0
					end,
id desc; 


