/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с
12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый
вечер", с 00:00 до 6:00 — "Доброй ночи". */


DELIMITER //
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
BEGIN
	IF (HOUR(NOW()) >= 0 AND HOUR(NOW()) < 6) THEN
	RETURN "Доброй ночи";
	ELSEIF (HOUR(NOW()) >= 6 AND HOUR(NOW()) < 12) THEN
	RETURN "Доброе утро";
    ELSEIF (HOUR(NOW()) >= 12 AND HOUR(NOW()) < 18) THEN
	RETURN "Добрый день";
	ELSEIF (HOUR(NOW()) >= 18 AND HOUR(NOW()) < 23) THEN
	RETURN "Добрый вечер";
	END IF;
END//

SELECT hello()//