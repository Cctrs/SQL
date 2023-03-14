1. Посчитать количество автомобилей в каждой компании из таблицы cabs. 
Отсортировать значения по убыванию.
Вывести те компании, в которых меньше 100 автомобилей. Поле с числом автомобилей назвать cnt, поле с названием компании — company_name.

SELECT COUNT(cabs.vehicle_id) AS cnt, cabs.company_name AS company_name FROM cabs GROUP BY cabs.company_name HAVING COUNT(cabs.vehicle_id) < 100 ORDER BY COUNT(cabs.vehicle_id) DESC;

2. Получить описание погодных условий из таблицы weather_records для каждого часа. 
Разделить все часы на две группы оператором CASE: Bad, если поле description содержит слова rain или storm; Good для всех остальных.
Полученное поле назвать weather_conditions.
В результирующей таблице должно быть два поля — дата и час (ts) и weather_conditions.
Сделать выборку за период с 2017-11-05 00:00 по 2017-11-06 00:00.

SELECT weather_records.ts AS ts, CASE WHEN weather_records.description LIKE '%storm%' THEN 'Bad' WHEN weather_records.description LIKE '%rain%' THEN 'Bad' ELSE 'GOOD' END AS weather_conditions FROM weather_records WHERE CAST(weather_records.ts AS timestamp) BETWEEN '2017-11-05 00:00:00' AND '2017-11-06 00:00:00';

3. Нужно получить выборку с количеством поездок каждого таксопарка за 15 и 16 ноября 2017 года. 
Вывести поле company_name. Поле с числом поездок назвать trips_amount и вывести его.
Результаты, полученные в поле trips_amount, отсортировать по убыванию.

SELECT cabs.company_name AS company_name, COUNT(trips.trip_id) AS trips_amount FROM cabs INNER JOIN trips ON trips.cab_id = cabs.cab_id WHERE CAST(trips.start_ts AS date) BETWEEN '2017-11-15 00:00' AND '2017-11-16 23:59' GROUP BY cabs.company_name ORDER BY trips_amount DESC;
