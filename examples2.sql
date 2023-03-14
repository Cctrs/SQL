1) ������� ������ �������� � ������ ����������� ������ 100, ������������� �� ��������.


SELECT COUNT(cabs.vehicle_id) AS cnt, cabs.company_name AS company_name FROM cabs GROUP BY cabs.company_name HAVING COUNT(cabs.vehicle_id) < 100 ORDER BY COUNT(cabs.vehicle_id) DESC;

2) �������� �������� �������� ������� �� ������� weather_records ��� ������� ����. ��������� ��� ���� �� ��� ������ ���������� CASE: Bad, ���� ���� description �������� ����� rain ��� storm; Good ��� ���� ���������.
���������� ���� ������� weather_conditions.
� �������������� ������� ������ ���� ��� ���� � ���� � ��� (ts) � weather_conditions.
������� ������� �� ������ � 2017-11-05 00:00 �� 2017-11-06 00:00.

SELECT weather_records.ts AS ts, CASE WHEN weather_records.description LIKE '%storm%' THEN 'Bad' WHEN weather_records.description LIKE '%rain%' THEN 'Bad' ELSE 'GOOD' END AS weather_conditions FROM weather_records WHERE CAST(weather_records.ts AS timestamp) BETWEEN '2017-11-05 00:00:00' AND '2017-11-06 00:00:00';


3) ����� �������� ������� � ����������� ������� ������� ���������� �� 15 � 16 ������ 2017 ����. ������� ���� company_name. ���� � ������ ������� ������� trips_amount � ������� ���.
����������, ���������� � ���� trips_amount, ������������� �� ��������.


SELECT cabs.company_name AS company_name, COUNT(trips.trip_id) AS trips_amount FROM cabs INNER JOIN trips ON trips.cab_id = cabs.cab_id WHERE CAST(trips.start_ts AS date) BETWEEN '2017-11-15 00:00' AND '2017-11-16 23:59' GROUP BY cabs.company_name ORDER BY trips_amount DESC;