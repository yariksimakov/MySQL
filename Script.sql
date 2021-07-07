
CREATE TABLE vk.like_profiles(
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	profile_id BIGINT UNSIGNED NOT NULL UNIQUE,
	PRIMARY KEY (user_id, profile_id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE vk.like_profiles ADD CONSTRAINT like_fk_10 
FOREIGN KEY (user_id) REFERENCES vk.users(id);

ALTER TABLE vk.like_profiles ADD CONSTRAINT like_fk_20
FOREIGN KEY (profile_id) REFERENCES vk.profiles(user_id);



select * from like_photos;

SELECT *
FROM users
WHERE id IN (7,42,20,14);



insert into like_photos values ('1', '101', '2', '1976-12-31 15:13:54');
insert into like_photos values (2, 102, 3, '1976-12-31 15:13:54');
INSERT INTO like_photos VALUES (3, 103, 4, '1984-04-06 13:36:44');
insert into like_photos (id, user_id, photos_id) values (4, 104, 10);

update like_photos 
set created_at = now()
where id = 3;

delete from like_photos where id = 2;

