-- 3.	(�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name).
-- ���� from, to � label �������� ���������� �������� �������, ���� name � �������.
-- �������� ������ ������ flights � �������� ���������� �������.


-- �������� ������ � ���������� ������. ��� ������ �����.
CREATE DATABASE flights;
USE flights;

CREATE TABLE flights (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`from` VARCHAR(50),
	`to` VARCHAR(50)
);

CREATE TABLE cities (
	label VARCHAR(50) PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO flights (`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');


INSERT INTO cities VALUES
('moscow', '������'),
('irkutsk', '�������'),
('novgorod', '��������'),
('kazan', '������'),
('omsk', '����');



-- ������.

SELECT id, c1.name AS `from`, c2.name AS `to` 
	FROM flights JOIN cities AS c1 JOIN cities AS c2
		ON flights.from = c1.label AND flights.to = c2.label;





