create table cars (id int primary key auto_increment,
c_name varchar(15),
cost int);

insert into cars (c_name, cost)
values
('Audi',52642),
('Mercedes',57127),
('Skoda',9000),
('Volvo',29000),
('Bentley',350000),
('Citroen',21000),
('Hummer',41400),
('Volkswagen',21600);

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
create view cars_view as (
select * from cars
where cost < 25000);
select * from cars_view;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
alter view cars_view as (
select * from cars
where cost < 30000);
select * from cars_view;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create view cars_sckoda_audi as (
select* from cars
where c_name in ('Skoda', 'Audi'));
select * from cars_sckoda_audi;

/*
4.Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; 
an_price — розничная цена анализа; an_group — группа анализов. Есть таблица групп анализов Groups: 
gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.
*/
create table Analysis (an_id int, an_name varchar(45), an_cost int, an_price int, an_group varchar(45));
create table Groups_analysis (gr_id int, gr_name varchar(45), gr_temp varchar(45));
create table Orders (ord_id int, ord_datetime datetime, ord_an int);

insert into Analysis(an_id, an_name, an_cost, an_price, an_group)
values
(10, 'd3', 3000, 4000, 'vit'),
(11, 'ferritin', 2000,2500,'vit'),
(12, 'coe',200,300,'smth'),
(13, 'trombozit',200,300,'smth');
insert into Orders (ord_id, ord_datetime, ord_an)
values
(1001,'2023-06-05 10-10-00', 10);
insert into Orders (ord_id, ord_datetime, ord_an)
values
(1002,'2023:06:05 10:40:00', 11);
insert into Orders (ord_id, ord_datetime, ord_an)
values
(999,'2023:01:01 10:40:00', 13),
(1000,'2023:01:05 10:40:00', 12),
(1001,'2023:01:15 10:40:00', 11),
(1002,'2023:02:05 10:40:00', 13),
(1003,'2023:02:05 10:40:00', 11),
(1004,'2023:02:09 10:40:00', 12),
(1005,'2023:02:14 10:40:00', 12),
(1006,'2023:02:20 10:40:00', 13),
(1007,'2023:03:05 10:40:00', 11),
(1008,'2023:03:06 10:40:00', 11),
(1009,'2023:03:07 10:40:00', 11);
select*from orders order by ord_datetime;

select an_name, an_price, ord_datetime from orders o
join  Analysis a on o.ord_an=a.an_id 
where ord_datetime between '2023-02-05 00-00-00' and '2023-02-12 00-00-00';


with cte as (
select an_name, an_price, ord_datetime from Analysis a
join  Orders 
on ord_an = an_id )
select an_name, an_price 
from cte
where ord_datetime between '2023-02-05 00-00-00' and '2023-02-12 00-00-00';

/*
5.Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

drop table train_shedule;
create table train_shedule (id_train int, station varchar(45), stationtime time);
insert into train_shedule
values
(110, 'San-Francisco','10:00'),
(110, 'Redwood City','10:54'),
(110, 'PAlo Alto','11:02'),
(110, 'San Jose','12:35'),
(120, 'San-Francisco','11:00'),
(120, 'Palo Alto','12:49'),
(120, 'San Jose','13:30');

select*from train_shedule order by id_train, stationtime;
select id_train, station, stationtime,
subtime((lead (stationtime) over (partition by id_train)), stationtime ) as nextstation
from train_shedule;



