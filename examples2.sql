1) ¬ывести список компаний с числом автомобилей меньше 100, отсортировать по убыванию.


SELECT COUNT(cabs.vehicle_id) AS cnt, cabs.company_name AS company_name FROM cabs GROUP BY cabs.company_name HAVING COUNT(cabs.vehicle_id) < 100 ORDER BY COUNT(cabs.vehicle_id) DESC;

2) ѕолучить описание погодных условий из таблицы weather_records дл€ каждого часа. –азделить все часы на две группы оператором CASE: Bad, если поле description содержит слова rain или storm; Good дл€ всех остальных.
ѕолученное поле назвать weather_conditions.
¬ результирующей таблице должно быть два пол€ Ч дата и час (ts) и weather_conditions.
—делать выборку за период с 2017-11-05 00:00 по 2017-11-06 00:00.

SELECT weather_records.ts AS ts, CASE WHEN weather_records.description LIKE '%storm%' THEN 'Bad' WHEN weather_records.description LIKE '%rain%' THEN 'Bad' ELSE 'GOOD' END AS weather_conditions FROM weather_records WHERE CAST(weather_records.ts AS timestamp) BETWEEN '2017-11-05 00:00:00' AND '2017-11-06 00:00:00';


3) Ќужно получить выборку с количеством поездок каждого таксопарка за 15 и 16 но€бр€ 2017 года. ¬ывести поле company_name. ѕоле с числом поездок назвать trips_amount и вывести его.
–езультаты, полученные в поле trips_amount, отсортировать по убыванию.


SELECT cabs.company_name AS company_name, COUNT(trips.trip_id) AS trips_amount FROM cabs INNER JOIN trips ON trips.cab_id = cabs.cab_id WHERE CAST(trips.start_ts AS date) BETWEEN '2017-11-15 00:00' AND '2017-11-16 23:59' GROUP BY cabs.company_name ORDER BY trips_amount DESC;