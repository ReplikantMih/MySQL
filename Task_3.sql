-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи
-- таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны
-- выводиться в конце, после всех записей.

-- Creating the table for the task.
CREATE TABLE storehouse_products (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(250) NOT NULL,
	value INT
);

DESC storehouse_products;

INSERT INTO storehouse_products (name, value) VALUES ('кирпичи', RAND() * 100), ('стулья', RAND() * 100), ('компьютеры', 0), ('диваны', RAND() * 100), ('отвертки', 0), ('книги', RAND() * 100); 
SELECT * FROM storehouse_products;


-- The task itself.
SELECT name, value, IF(value = 0, 0, 1) AS has_products FROM storehouse_products ORDER BY has_products DESC, value;