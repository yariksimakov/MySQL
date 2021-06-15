

update friend_requests set initiator_user_id = (select id from users 
where id != target_user_id order by rand() limit 1);

update messages set to_user_id = (select id from users where id  != from_user_id 
order by rand() limit 1) where to_user_id = from_user_id;

update likes set user_id = (select id from users where id  != user_id
order by rand() limit 1);
-- ----------------------------- 2 ---------------------------------

/*
select initiator_user_id, target_user_id from friend_requests fr 
where status = 'approved';

select from_user_id, to_user_id from messages m where from_user_id = 177;
*/
select to_user_id from messages m where 'approved' = (select status from friend_requests fr 
where  initiator_user_id = from_user_id and target_user_id = to_user_id limit 1) and from_user_id = 141 group by to_user_id
order by to_user_id desc limit 1;

-- ------------------------------- 3 ---------------------------------

-- select group_concat(user_id), count(media_id) as c from likes group by media_id order by c desc;


select user_id, timestampdiff(year, birthday, now()) from profiles p 
order by timestampdiff(year, birthday, now()) limit 10;

/*select count(media_id) from likes where user_id in (select user_id from profiles
order by timestampdiff(year, birthday, now()) limit 10 );
------ unfortunately the LIMIT is not supported in this case and will give an error
*/

select media_id, count(media_id) from likes where media_id in (select id from media  where user_id in (select user_id from profiles 
where timestampdiff(year, birthday, now()) <= 8)
)group by media_id  with rollup order by media_id;

/*it does not work correctly to output to 10 users and all those who are younger than 8 years old, 
 due to the fact that the LIMIT gives an error
*/


-- ------------------------------------------ 4 -------------------------------

select user_id , gender from profiles p where gender = 'f';
select count(user_id), gender from profiles p where gender = 'm';
select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'f');



select if((select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'm')) <
(select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'f')), 'female', 'male') 
as who_bigger;

-- --- or

select case 
		when (select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'm')) <
(select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'f')) then 'female'
		when (select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'm')) =
(select count(media_id) from likes where user_id in (select user_id from profiles p where gender = 'f')) then 'female = male'
		else 'male'
	end as who_bigger;


-- ------------------------------------------- 5 --------------------------------


select count(user_id) from media m group by user_id ;


select count(initiator_user_id), initiator_user_id 
from friend_requests fr group by initiator_user_id  order by count(initiator_user_id);
select count(user_id)as coun, user_id  from likes group by user_id order by coun; 

select count(from_user_id) as coun, from_user_id from messages m group by from_user_id order by coun;



select  user_id from likes where user_id in (select from_user_id from messages where from_user_id 
in (select initiator_user_id from friend_requests fr group by initiator_user_id  order by count(initiator_user_id))
group by from_user_id order by count(from_user_id)) group by user_id order by count(user_id) limit 10;



