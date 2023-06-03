CREATE DATABASE seminar4;
USE seminar4;


-- ЗАДАЧИ СОБЕСОДОВАНИЯ --
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);


CREATE TABLE  CITY 
(	
    CITYCODE INT PRIMARY KEY,
	CITYNAME VARCHAR(50), 
	PEOPLES INT 
);


CREATE TABLE  MAN 
(	
	PHONENUM VARCHAR(15) PRIMARY KEY , 
	FIRSTNAME VARCHAR(50),
	LASTNAME VARCHAR(50),  
	CITYCODE INT, 
	YEAROLD INT	 
);


 -- AUTO
INSERT INTO  (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);


 -- CITY
INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES
(1,'Москва', 10000000),
(2,'Владимир', 500000),
(3, 'Орел', 300000),
(4,'Курск', 200000),
(5, 'Казань', 2000000),
(7, 'Котлас', 110000),
(8, 'Мурманск', 400000),
(9, 'Ярославль', 500000);

-- MAN
INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES
('9152222221','Андрей','Николаев', 1, 22),
('9152222222','Максим','Москитов', 1, 31),
('9153333333','Олег','Денисов', 3, 34),
('9173333334','Алиса','Никина', 4, 31),
('9173333335','Таня','Иванова', 4, 31),
('9213333336','Алексей','Иванов', 7, 25),
('9213333331','Андрей','Некрасов', 2, 27),
('9214444444','Алексей','Галкин', 1, 38);



/*
3.	Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, 
которые живут в городе с населением больше 1 млн человек.
*/

/*
select * from MAN;
select * from AUTO;
-- по номеру телефона соединяю машину и владельца
select* from AUTO a
join MAN m
on a.PHONENUM = m.PHONENUM;

-- по коду города соединяю владельца и город (+условие население > 1 млн)
select * from MAN m
join CITY c on m.CITYCODE = c.CITYCODE 
WHERE PEOPLES > 1000000;
*/

-- в одном запросе
select* from AUTO a
join MAN m
on a.PHONENUM = m.PHONENUM
join CITY c on m.CITYCODE = c.CITYCODE 
WHERE PEOPLES > 1000000;



/*
 4.	Вывести на экран людей которые живут в городах с населением больше 1000000 ,
 если людей с таким же именем нет в таблице MAN
*/

/*
select * from MAN order by FIRSTNAME;
select * from CITY ;

-- люди, которые живут в городах  населением > 1млн 
select * from MAN m
join CITY c
on m.CITYCODE = c.CITYCODE WHERE PEOPLES > 1000000;

-- люди, которые живут в городах  населением < 1млн 
select * from MAN m
join CITY c
on m.CITYCODE = c.CITYCODE WHERE PEOPLES < 1000000;
*/

select * from MAN m
join CITY c
on m.CITYCODE = c.CITYCODE WHERE PEOPLES > 1000000 AND m.FIRSTNAME not in (
select FIRSTNAME from MAN m
join CITY c
on m.CITYCODE = c.CITYCODE WHERE PEOPLES < 1000000);



-- Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
-- select* from AUTO;
select MARK, count(MARK) total from AUTO group by MARK having MARK in ('BMW', 'LADA') ;


/*Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
*/

select MARK, count(MARK) this_mark, ((SELECT count(*) from AUTO) - count(MARK)) other_marks from AUTO group by MARK ;




-- Задание №3.

-- Даны 2 таблицы, созданные следующим образом:
create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
-- select * from test_a  a where a.id not in (select * from test_b);


select * from test_a 
left join test_b 
on test_a.id  = test_b.id where test_b.id is null;



