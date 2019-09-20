-- 2. (�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.

DESC users;


-- ����� ���-�� ���. �� ���� ������ ������ INNER JOIN ������ ����� �����, ����� ������������ ������ ������.
INSERT INTO users(name, birthday_at)
SELECT t1.name, birthday_at FROM 
	(SELECT 'Ivan' AS name, '2019-10-10' AS birthday_at UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t1
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t2
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t3
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t4
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t5
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t6
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t7
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t8
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t9
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t10
		JOIN
	(SELECT 'Ivan', '2019-10-10' UNION ALL SELECT 'Andrey', '2018-09-09' UNION ALL SELECT 'Sergey', '2017-09-09' UNION ALL SELECT 'Sergey', '2017-09-09') AS t11
	LIMIT 1000000
	;

-- ��� ����� ����� ��������� 1� ������� ���� �� ������ ������� � ������� �� ����� 10 �������, ������ ����� ���������, �������� ���-�� �������
-- ���� � ������ SELECT ������� LIMIT.
INSERT INTO users(name, birthday_at) 
SELECT t1.name, t1.birthday_at FROM 
(SELECT name, birthday_at FROM users LIMIT 10) AS t1
JOIN
(SELECT name, birthday_at FROM users LIMIT 10) AS t2
JOIN
(SELECT name, birthday_at FROM users LIMIT 10) AS t3
JOIN
(SELECT name, birthday_at FROM users LIMIT 10) AS t4
JOIN
(SELECT name, birthday_at FROM users LIMIT 10) AS t5
JOIN
(SELECT name, birthday_at FROM users LIMIT 10) AS t6
LIMIT 1000000;

-- ��� ����� ����� �������� ��������� ��� �������, ����� ����� ������������� �����. ������ ������� ����, ��������� � ����, ������������ ������.

