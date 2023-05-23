USE homework_1;
SELECT * FROM phones;
INSERT INTO phones (ProductName, Manufacturer, ProductCount, Price) 
VALUES ('Samsung Galaxy 8001', 'Samsung', 5, 50000);
SELECT * FROM phones;
INSERT INTO phones (ProductName, Manufacturer, ProductCount, Price)
VALUES
('Samsung 92', 'Samsung', 8, 75000),
('Apple iPhone 10', 'Apple', 1, 100000),
('iPhone some', 'Apple', 15, 85000),
('Xiaomi mi 85', 'Xiaomi', 10, 25000);
SELECT * FROM phones;
# Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price FROM phones
WHERE ProductCount > 2;
# Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM phones
WHERE Manufacturer = 'Samsung';
# Товары, в наименовании которых есть упоминание "Iphone"
SELECT * FROM phones
WHERE ProductName LIKE '%iPhone%';
# Товары, в наименовании которых есть упоминание "Samsung"
SELECT * FROM phones
WHERE ProductName LIKE '%Samsung%';
# Товары, в наименовании которых есть ЦИФРЫ
SELECT * FROM phones
WHERE ProductName RLIKE '[0-9]';
# Товары, в наименовании которых есть ЦИФРА "8"
SELECT * FROM phones
WHERE ProductName LIKE '%8%';