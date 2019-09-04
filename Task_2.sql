SHOW DATABASES;
USE vk;
SHOW TABLES;

-- 2.	����� ����� ��������� ������������. 
-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� ��������������.

		
SELECT user_id, total_messages FROM
(
	SELECT user_id, SUM(messages_count) AS total_messages  
		FROM 
		(
			-- ��������� �� ������������ ����� ����-���� ��� ��� user_from_id ��� user_to_id - ������� ����.
			SELECT to_user_id AS user_id, messages_count 
				FROM (SELECT from_user_id, to_user_id, COUNT(*) AS messages_count FROM messages GROUP BY from_user_id, to_user_id) AS directional_users_pairs_messages_1 
					WHERE from_user_id = 17
			UNION ALL
			SELECT from_user_id AS user_id, messages_count 
				FROM (SELECT from_user_id, to_user_id, COUNT(*) AS messages_count FROM messages GROUP BY from_user_id, to_user_id) AS directional_users_pairs_messages_2 
					WHERE to_user_id = 17
		) AS users_pairs
		GROUP BY user_id 
		ORDER BY total_messages DESC
) AS this_user_other_user_total_messages -- ��������� � ������ ������� ��� ��� ����������� �� ����������� ������, ������� user_id ���������� �����, � �������� � �������� ���� ������, � total_messages ����� ���-�� ��������� � ���������� ���������.
WHERE user_id IN 
	(
		SELECT user_id FROM friendship WHERE friend_id = 17
		UNION
		SELECT friend_id FROM friendship WHERE user_id = 17
	) -- ������ ������������.
LIMIT 1;

