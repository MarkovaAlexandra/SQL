/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds */

delimiter //
create function formattime (n int)
returns varchar(100)
deterministic
begin
declare res varchar(100);
declare days int;
declare hours int;
declare minutes int;
declare sec int;
set days = n div 86400;
set hours = n % 86400 div 3600;
set minutes = n % 86400 % 3600 div 60;
set sec = n % 86400 % 3600 % 60;

set res = concat(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', sec, ' sec');
return res;
end //
delimiter ;

select formattime (123456);
select formattime (2557446);

/*
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/
drop function chetnie;
delimiter //
create function chetnie (n int)
returns varchar(100)
deterministic
begin
declare res varchar (100);
declare i int default 2;
set res = '2';
while i <= n do
set i = i + 2;
set res = concat(res,', ', i);
end while;
return res;
end //
delimiter ;

select chetnie (10);
select chetnie (20);