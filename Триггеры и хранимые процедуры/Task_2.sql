/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его
описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля
принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь
того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям
NULL-значение необходимо отменить операцию. */

DELIMITER //

DROP TRIGGER IF EXISTS products_not_null_update//
CREATE TRIGGER products_not_null_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF (NEW.description = NULL AND NEW.name = NULL) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: И name=NULL и description=NULL после UPDATE - недопустимо.';
	END IF;
END//


DROP TRIGGER IF EXISTS products_not_null_insert//
CREATE TRIGGER products_not_null_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF (NEW.description = NULL AND NEW.name = NULL) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: И name=NULL и description=NULL после UPDATE - недопустимо.';
	END IF;
END//
