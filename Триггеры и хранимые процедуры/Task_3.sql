/* 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
Числами Фибоначчи называется последовательность в которой число равно сумме двух
предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55. */


DELIMITER //
DROP FUNCTION IF EXISTS fibo//

CREATE FUNCTION fibo (value INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE sum_ INT DEFAULT 0;
	DECLARE fib1 INT DEFAULT 0;
	DECLARE fib2 INT DEFAULT 0;
	cycle : WHILE i < value - 2 DO
	SET sum_ = fib1 + fib2;
	SET fib1 = fib2;
	SET fib2 = sum_;
	SET i = i + 1;
	END WHILE cycle;
	RETURN fib2;
END//

SELECT fibo(7)//