/*задание1.
Создайте таблицу sales, заполните ее данными, разделите
значение поля bucket на 3 сегмента
*/


CREATE TABLE sales (
id INT,
order_date DATE,
bucket VARCHAR (45)
);
INSERT INTO sales (id, order_date, bucket)
VALUES
(1, '2021-01-01', '101 to 300'),
(1, '2021-01-02', '101 to 300'),
(1, '2021-01-03', 'less then equal to 100'),
(1, '2021-01-04', '101 to 300'),
(1, '2021-01-05', 'greater then 300');
SELECT * FROM sales;
ALTER TABLE sales ADD COLUMN order_size VARCHAR(45);
UPDATE sales SET order_size = 
CASE WHEN bucket = '101 to 300' THEN 'Средний заказ'
WHEN bucket = 'less then equal to 100' THEN 'Большой заказ'
WHEN bucket = 'greater then 300' THEN 'Маленький заказ'
END;


/*Задание2.
Создайте таблицу orders, заполните ее значениями. Покажите "полный статус заказа", используя оператор CASE
*/

CREATE TABLE orders(
orderid INT PRIMARY KEY AUTO_INCREMENT,
emploeeid VARCHAR(45),
amount FLOAT,
orderstatus VARCHAR(45));

INSERT INTO orders (emploeeid, amount,orderstatus)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.00, 'CANCELLED'),
('e05', 35.00, 'CLOSED'),
('e02', 45.00, 'CLOSED'),
('e04', 15.50, 'OPEN'),
('e04', 15.80, 'CANCELLED');

SELECT orderid, orderstatus,
CASE 
WHEN orderstatus = 'OPEN' THEN 'Order is in open state'
WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled'
WHEN orderstatus = 'CLOSED' THEN 'Order is closed'
END as order_summary
FROM orders;

# 0 - это значение, равное нулю, а NULL - это не значение, это пустота