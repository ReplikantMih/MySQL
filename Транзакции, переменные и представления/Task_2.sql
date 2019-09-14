-- 2. �������� �������������, ������� ������� �������� name �������� ������� �� �������
-- products � ��������������� �������� �������� name �� ������� catalogs.

USE shop;

DROP VIEW IF EXISTS prod;
CREATE VIEW prod 
AS SELECT products.name AS product_name, catalogs.name AS catalog_name 
FROM products JOIN catalogs ON products.catalog_id=catalogs.id;

SELECT * FROM prod;

