-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы
-- дни недели текущего года, а не года рождения.

USE tasks;
SHOW TABLES;
SELECT * FROM users;

SELECT WEEKDAY(DATE_ADD(birth_date, INTERVAL (YEAR(NOW()) - YEAR(birth_date)) YEAR)) AS day_, COUNT(*)  FROM users GROUP BY day_;