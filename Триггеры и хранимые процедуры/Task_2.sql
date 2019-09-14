/* 2. � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ���
���������. ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ����
��������� �������������� �������� NULL �����������. ��������� ��������, ���������
����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. ��� ������� ��������� �����
NULL-�������� ���������� �������� ��������. */

DELIMITER //

DROP TRIGGER IF EXISTS products_not_null_update//
CREATE TRIGGER products_not_null_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF (NEW.description = NULL AND NEW.name = NULL) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: � name=NULL � description=NULL ����� UPDATE - �����������.';
	END IF;
END//


DROP TRIGGER IF EXISTS products_not_null_insert//
CREATE TRIGGER products_not_null_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF (NEW.description = NULL AND NEW.name = NULL) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: � name=NULL � description=NULL ����� UPDATE - �����������.';
	END IF;
END//
