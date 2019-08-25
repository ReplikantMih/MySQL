/* ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������
 ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� ��������
 ����� ��������. */

-- Createing table for the task.
SHOW TABLES;

ALTER TABLE users MODIFY created_at VARCHAR(100), MODIFY updated_at VARCHAR(100);
DESC users;
SELECT * FROM users;

-- The task itself.
ALTER TABLE users ADD (created_at_d DATETIME), ADD (updated_at_d DATETIME);
SELECT * FROM users;
DESC users;

UPDATE users SET created_at_d = STR_TO_DATE(created_at, "%Y-%m-%d %H:%i:%s");
UPDATE users SET updated_at_d = STR_TO_DATE(updated_at, "%Y-%m-%d %H:%i:%s");

ALTER TABLE users DROP COLUMN created_at, DROP COLUMN updated_at;
ALTER TABLE users RENAME COLUMN created_at_d TO created_at, RENAME COLUMN updated_at_d TO updated_at; 
DESC users;
SELECT * FROM users;