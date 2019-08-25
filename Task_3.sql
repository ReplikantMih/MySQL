-- (по желанию) Подсчитайте произведение чисел в столбце таблицы

SHOW DATABASES;
USE tasks;

SHOW TABLES;
SELECT * FROM catalogs;

SELECT EXP(SUM(LN(id))) FROM catalogs;