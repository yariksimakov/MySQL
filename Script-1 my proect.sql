create database public_services;

use public_services;

create table users (
	id SERIAL primary key,
	surname varchar(50),
	name varchar(50),
	patronymic varchar(50) comment 'for residents of russia',
	email varchar(50) unique,
	password_hash varchar(100),
	telephone BIGINT unsigned unique,
	
	index users_surname_name_idx(surname, name)
);


create table profiles (
	user_id bigint unsigned not null unique auto_increment,
	gender char(1),
	birthday date,
	passport_id bigint unsigned,
	snils bigint(11) unsigned unique,
	tin bigint(12) unsigned unique,
	photo_id bigint unsigned unique,
	created_at datetime default now(),
	
	foreign key (user_id) references users(id)
);

create table passport (
	id SERIAL primary key,
	series int unsigned unique,
	numb int unsigned unique,
	issued_by_whom varchar(100),
	
	foreign key (id) references profiles(user_id),
	foreign key (id) references users(id)
);

create table photo (
	profile_id SERIAL primary key,
	service_id bigint unsigned default null,
	
	foreign key (profile_id) references profiles(user_id)
)comment 'for the service when a photo is required';

create table order_services (
	id SERIAL primary key,
	transport_value_id bigint unsigned,
	health_care_id bigint unsigned,
	tax_finances_id bigint unsigned,
	passport_viz_id bigint unsigned,
	education_id bigint unsigned,
	family_id bigint unsigned,
	
	foreign key (id) references users(id)
)comment 'next, I will write tables for each link';
