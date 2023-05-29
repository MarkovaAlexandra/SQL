
create table salespeople(
snum int,
sname varchar(45),
city varchar(45),
comm varchar(45));
insert into salespeople (snum, sname, city,comm)
values
(1001,'Peel','London','.12'),
(1002,'Serres','San Jose','.13'),
(1004,'Motika','London','.11'),
(1007,'Rifkin','Barcelona','.15'),
(1003,'Axelrod','New York','.10');

create table customers (
cnum int,
cname varchar (45),
city varchar(45),
rating int,
snum int);
insert into customers (cnum, cname, city,rating,snum)
values
(2001,'Hoffman','London',100,1001),
(2002,'Giovanni','Rome',200,1003),
(2003,'Liu','SanJose',200,1002),
(2004,'Grass','Berlin',300, 1002),
(2006,'Clemens','London',100,1001),
(2008,'Cisneros','SanJose',300,1007),
(2007,'Pereira','Rome',100,1004);

create table orders (
onum int,
amt float,
odate date,
cnum int,
snum int);
insert into orders (onum, amt, odate, cnum, snum)
values
(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3008,4723.00,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-05',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);

select*from orders;
select * from customers;
select* from salespeople;


/*
1.   Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
*/
select city, sname,snum,comm from salespeople;

-- 2.	Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
select rating, cname from customers where city = 'SanJose';

/* 
3.	Напишите запрос, который вывел бы значения snum всех продавцов из таблицы 
заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
*/
select distinct snum from orders;

/* 
4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
 Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
 */
 select * from customers  where cname like 'G%';
 
-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
select * from orders where amt > 1000;

/*
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
 */
 select min(amt) from orders;
 
/* 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
у которых рейтинг больше 100 и они находятся не в Риме.
*/
select * from customers where rating > 100 and city != 'Rome';


CREATE TABLE zadanie2 (
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR (45),
surname VARCHAR (45),
speciality VARCHAR(45),
seniority INT,
salary INT,
age INT);
INSERT INTO zadanie2 (firstname, surname, speciality, seniority, salary, age)
VALUES
('Вася','Васькин','начальник',45,50000,60),
('Петя','Петькин','начальник',40,60000,60),
('Михаил','Михаилин','начальник',6,150000,60),
('Иван','Иванов','рабочий',9,30000,60),
('Петр','Петров','рабочий',2,30000,60),
('Олег','Какашкин','уборщик',10,2000,60),
('Денис','Денисов','начальник',40,250000,60),
('Борис','Борисов','начальник',30,250000,60),
('Федор','Дядин','рабочий',12,50000,60),
('Алексей','Бубликин','рабочий',5,50000,60);

-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
select* from zadanie2 order by salary desc;
select * from zadanie2 order by salary;
-- ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select * from zadanie2 order by salary desc limit 5;
-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
select speciality, sum(salary) from zadanie2 group by speciality having sum(salary) > 100000;








