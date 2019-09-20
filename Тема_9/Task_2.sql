-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DESC users;


-- Можно как-то так. За счет логики работы INNER JOIN множим число строк, потом ограничиваем нужным числом.
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

-- Эта штука будет вставлять 1М записей если на момент запроса в таблице не менее 10 записей, запрос можно укоротить, уменьшив кол-во джойнов
-- если в каждом SELECT поднять LIMIT.
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

-- Ещё можно через хранимую процедуру или функцию, тогда можно задействовать циклы. Внутри запроса цикл, насколько я знаю, использовать нельзя.

