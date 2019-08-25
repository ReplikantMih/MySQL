-- Подсчитайте средний возраст пользователей в таблице users

-- Creating the table for the task.
USE tasks;
SHOW TABLES;
DESC users6
SELECT * FROM users;

ALTER TABLE users ADD (birth_date DATETIME);

UPDATE users SET birth_date = '1985.01.15' WHERE name = 'Ivan';
UPDATE users SET birth_date = '1991.02.11' WHERE name = 'Petr';
UPDATE users SET birth_date = '1970.03.09' WHERE name = 'Semen';
UPDATE users SET birth_date = '1955.07.07' WHERE name = 'Irina';
UPDATE users SET birth_date = '2001.04.29' WHERE name = 'Kirill';
SELECT * FROM users;

-- The task itself.
SELECT ROUND(AVG(DATEDIFF(NOW(), birth_date) / 365.25)) FROM users;