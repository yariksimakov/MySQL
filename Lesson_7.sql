-- ---------------------------------------------- 1 --------------------------------------------

use shop;


alter table orders add constraint fk_user_id 
foreign key (user_id) references users (id);


insert into users (name) values ('Reuben'), 
('Frederik'), ('Unique'), ('Norene');

insert into orders (user_id) values (5), (6), (7), (8); 

alter table orders add column product_id bigint unsigned;
create index index_of_product_id on orders (product_id);



-- ------------------------------------------- 2 ----------------------------------------


INSERT IGNORE INTO catalogs (id, name) VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты');

 
 insert into products (name, catalog_id) values ('AMD FX-8320E', 9);

insert into products (name, catalog_id) values ('AMD FX-8320', 9),
('intel core i3-8100', 9), ('MSI B250M GAMING PRO', 10), ('ASUS ROG MAXIMUS X HERO', 10);


select p.id, p.name, c.name from products p join catalogs c on p.catalog_id = c.id;



-- ----------------------------------------------- 3 -----------------------------------------

create table flight (
	id int unsigned,
	from_citie varchar(200),
	to_citie varchar(200),
	key index_of_cities(id)
);

create table cities (
	label varchar(200),
	name varchar(200)
);


insert into flight values (1, 'moscow', 'omsk'),
	(2, 'novgorod', 'kazan'),
	(3, 'irkutsk', 'moscow'),
	(4, 'omsk', 'irkutsk'),
	(5, 'moscow', 'kazan');

insert into cities values ('moscow', 'Москва'),
	('novgorod', 'Новгород'),
	('irkutsk', 'Иркутск'),
	('omsk', 'Омск'),
	('kazan', 'Казань');

select (select name from cities where from_citie = label) as from_citie, 
(select name from cities where to_citie = label) as to_citie from flight f; 

-- -------------- OR

select name as from_citie, (select name from cities where to_citie = label) as to_citie 
from flight f join cities c on from_citie = label order by id;

