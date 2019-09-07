-- 1.	��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

USE shop;
SHOW TABLES;
DESC users;
DESC orders;


SELECT users.id AS user_id, users.name AS user_name FROM 
	(SELECT user_id FROM orders 
		GROUP BY user_id) as users_ids
		JOIN
			users 
				ON users_ids.user_id = users.id;
			
