/* 1. �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� ��
�������� ������� �����. � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", �
12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", � 18:00 �� 00:00 � "������
�����", � 00:00 �� 6:00 � "������ ����". */


DELIMITER //
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
BEGIN
	IF (HOUR(NOW()) >= 0 AND HOUR(NOW()) < 6) THEN
	RETURN "������ ����";
	ELSEIF (HOUR(NOW()) >= 6 AND HOUR(NOW()) < 12) THEN
	RETURN "������ ����";
    ELSEIF (HOUR(NOW()) >= 12 AND HOUR(NOW()) < 18) THEN
	RETURN "������ ����";
	ELSEIF (HOUR(NOW()) >= 18 AND HOUR(NOW()) < 23) THEN
	RETURN "������ �����";
	END IF;
END//

SELECT hello()//