-- ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, ��� ����������
-- ��� ������ �������� ����, � �� ���� ��������.

USE tasks;
SHOW TABLES;
SELECT * FROM users;

SELECT WEEKDAY(DATE_ADD(birth_date, INTERVAL (YEAR(NOW()) - YEAR(birth_date)) YEAR)) AS day_, COUNT(*)  FROM users GROUP BY day_;