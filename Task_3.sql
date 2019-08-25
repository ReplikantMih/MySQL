-- � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����:
-- 0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������
-- ����� �������, ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������
-- ���������� � �����, ����� ���� �������.

-- Creating the table for the task.
CREATE TABLE storehouse_products (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	value INT
);

DESC storehouse_products;

INSERT INTO storehouse_products (name, value) VALUES ('�������', RAND() * 100), ('������', RAND() * 100), ('����������', 0), ('������', RAND() * 100), ('��������', 0), ('�����', RAND() * 100); 
SELECT * FROM storehouse_products;


-- The task itself.
SELECT name, value, IF(value = 0, 0, 1) AS has_products FROM storehouse_products ORDER BY has_products DESC, value;