-- 1. � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������.
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. �����������
-- ����������.

SHOW DATABASES;

START TRANSACTION;
DELETE FROM sample.users WHERE id=1;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id=1;
DELETE FROM shop.users WHERE id=1;
COMMIT;
