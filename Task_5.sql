-- (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
-- ������������ ������ � �������, �������� � ������ IN.

SHOW TABLES;

SELECT *, (IF(id = 5, 0, IF(id = 1, 1, 2))) AS id_group FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id_group;
