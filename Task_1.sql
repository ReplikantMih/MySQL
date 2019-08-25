-- ����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.

-- Creating DB for the task.
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS tasks;
USE tasks;
CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	created_at DATETIME,
	updated_at DATETIME
);
DESC users;

INSERT INTO users (name) VALUES ('Ivan'), ('Petr'), ('Semen'), ('Irina'), ('Kirill');
UPDATE users SET created_at = '2019.11.01 00:00:00' WHERE name = 'Ivan';
UPDATE users SET updated_at = '2018.12.07 00:00:00' WHERE name = 'Irina';

SELECT * FROM users;

-- The task itself.
UPDATE users SET created_at = NOW() WHERE created_at IS NULL;
SELECT * FROM users;
UPDATE users SET updated_at = NOW() WHERE updated_at IS NULL;
SELECT * FROM users;
