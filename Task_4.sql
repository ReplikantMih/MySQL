-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских
-- названий ('may', 'august')
SHOW TABLES;

DESC users;
SELECT * FROM users;

SELECT name, birth_date,
MONTH(birth_date),
(CASE 
	WHEN MONTH(birth_date) = 1
		THEN "jan"
	WHEN MONTH(birth_date) = 2
		THEN "feb"
	WHEN MONTH(birth_date) = 3
		THEN "mar"
	WHEN MONTH(birth_date) = 4
		THEN "apr"
	WHEN MONTH(birth_date) = 5
		THEN "may"
	WHEN MONTH(birth_date) = 6
		THEN "june"
	WHEN MONTH(birth_date) = 7
		THEN "july"
	WHEN MONTH(birth_date) = 8
		THEN "august"
	WHEN MONTH(birth_date) = 9
		THEN "sept"
	WHEN MONTH(birth_date) = 10
		THEN "oct"
	WHEN MONTH(birth_date) = 11
		THEN "nov"
	WHEN MONTH(birth_date) = 12
		THEN "dec"
	ELSE "unknown"
END) AS b_month
FROM users
HAVING b_month IN ('may', 'august');

