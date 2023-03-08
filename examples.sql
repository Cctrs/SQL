1. Вывести модель, производительность и жесткий диск для ПК дешевле 500$:
SELECT model, speed, hd FROM PC
Where price < 500;

2. Вывести уникальные бренды производителей принтеров:
SELECT DISTINCT maker FROM Product
WHERE type = 'Printer';

3. Вывести модель, оперативку и размер экрана для ноутбуков дороже 1000$:
SELECT model, ram, screen FROM Laptop
WHERE price > 1000

4. Вывести все записи из таблицы для цветных принтеров:
SELECT * FROM Printer
WHERE color = 'y';

5. Вывести модели, оперативку и размер жесткого диска для ПК с приводом 12х или 24х и ценой менее 600$;
SELECT model, speed, hd FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600

6. Вывести производителя и оперативку ноутбуков для каждого производителя, выпускающего ноутбуки c объёмом жесткого диска не менее 10 Гбайт:
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product
INNER JOIN 
Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 10

7.Вывести номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT uniq.model, price FROM 
(SELECT model, price FROM PC UNION SELECT model, price FROM Laptop UNION SELECT model, price FROM Printer) as uniq 
INNER JOIN Product ON uniq.model = Product.model 
WHERE Product.maker = 'B'
