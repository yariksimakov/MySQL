

-- --------------------------------------------- 1 ---------------------------------------------
use shop;

create table logs (
	primary_key bigint unsigned,
	name_content char(250),
	name_table char(50),
	created_at datetime
);


delimiter //

create trigger push_users after insert on users
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'users', now());
end // 


create trigger push_catalogs after insert on catalogs
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'catalogs', now());
end // 


create trigger push_products after insert on products
for each row
begin 
	insert into logs (primary_key, name_content, name_table, created_at) 
	values (new.id, new.name, 'products', now());
end // 



insert into users  values (2, 'Richard')//
insert into catalogs (id, name) values (4, '����������� ������')//
insert into products (id, name, catalog_id) values (7, 'ASRock H110 PRO BTC', 2)//



-- ------------------------------------------------ 2 -------------------------------------------


create procedure million_row ()
begin
	select (max(id) + 1) into @i from users;
	while @i < (@i + 1000000) do
		insert into users (id, name) values (@i, concat('user_', @i));
		set @i = @i + 1;
	end while;
end// 


call million_row()//

delimiter ;

-- ----------------------------------------------- NoSQL ------------------------------------


/*
 � ���� ������ Redis ��������� ��������� ��� �������� ��������� � ������������ IP-�������.
 */

sadd ip '150.0.0.1' '155.0.2.1' '160.0.0.2'


scard ip

-- --------------------------------------------------- 2 ----------------------------------------




/*
 * ��� ������ ���� ������ Redis ������ ������ ������ ����� ������������ �� ������������ 
 * ������ � ��������, ����� ������������ ������ ������������ �� ��� �����.
 */

mset alex alex@mail.ru alex@mail.ru alex

get alex
get alex@mail.ru



-- --------------------------------------------------- 3 ---------------------------------------------------



/*
 * ����������� �������� ��������� � �������� ������� ������� ���� ������ shop � ���� MongoDB.
 */

use shop

db.shop.insert ({catalogs: {1: '����������', 2: '���. �����', 3: '����������', 4: '����������� ������'}})

db.shop.insert ({products: {2: ['AMD FX-8320E', null, 7700, 1]},{3: ['AMD FX-9000', null, 9780, 1]},
{4: ['ASUS ROG MAXIMUS X HERO', 'this is a great motherboard', 29500, 2]}})


db.shop.find(catalogs)

db.shop.find(products.3: 'AMD FX-9000')


