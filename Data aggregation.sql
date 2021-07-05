-- ------------------- 1 ---------------------

select user_id, timestampdiff(year, birthday, now()) as age from profiles;

select count(user_id) as number_people ,avg(timestampdiff(year, birthday, now())) 
as avg_age from profiles; 


-- ------------------ 2 -----------------------

select timestampdiff(year, birthday, now()) as age, 
count(birthday) as count_person from profiles group by age order by age;


/*
select user_id, timestampdiff(year,created_at, now()) as age from profiles
order by age;

select user_id, birthday from profiles p where  timestampdiff(year, birthday, now()) = 0;

update profiles set birthday = date(created_at)
where  timestampdiff(year, birthday, now()) = 0;

update profiles set created_at = birthday
where timestampdiff(year, created_at, now()) = 0;


----- I was correcting incorrect data 
*/

select week(birthday) as week_year, count(birthday), group_concat(user_id) as user_id
from profiles p group by week_year;   



-- --------------------- 3 ---------------------



select exp(ln(5) + ln(4) + ln(3) + ln(2)) as sum;







