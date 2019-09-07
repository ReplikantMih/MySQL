-- 2.	�������� ������ ������� products � �������� catalogs, ������� ������������� ������.

SHOW TABLES;

SELECT * FROM catalogs LIMIT 10;
SELECT * FROM products LIMIT 5;

SELECT products.id, products.name, description, price, catalogs.name AS catalog
	FROM products JOIN catalogs  
		ON products.catalog_id = catalogs.id;