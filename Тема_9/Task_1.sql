-- 1. �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, catalogs � products � ������� logs
--  ���������� ����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � ���������� ���� name.

USE shop;

-- ������� ������� ����� �� ������ Archive.
CREATE TABLE logs (
	created_at DATETIME DEFAULT NOW() NOT NULL,
	table_name VARCHAR(10) NOT NULL,
	item_id INT NOT NULL,
	item_name VARCHAR(155)
) ENGINE=Archive;


-- ��������� �������� ����� ��� ������� ������� � ��������������� ������� ������ � ������� �����.
DELIMITER //

CREATE TRIGGER products_insert_to_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs(table_name, item_id, item_name) VALUES ('products', NEW.id, NEW.name); 
END//


CREATE TRIGGER catalogs_insert_to_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs(table_name, item_id, item_name) VALUES ('catalogs', NEW.id, NEW.name); 
END//


CREATE TRIGGER users_insert_to_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs(table_name, item_id, item_name) VALUES ('users', NEW.id, NEW.name); 
END//

DELIMITER ;
