SHOW DATABASES;
USE vk;
SHOW TABLES;

-- 2.	Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользоваетелем.

		
SELECT user_id, total_messages FROM
(
	SELECT user_id, SUM(messages_count) AS total_messages  
		FROM 
		(
			-- Группирую по направленным парам юзер-юзер где или user_from_id или user_to_id - искомый юзер.
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
) AS this_user_other_user_total_messages -- Объединяю в единую выборку где вне зависимости от направления дружбы, столбце user_id уникальные юзеры, с которыми у искомого есть дружба, в total_messages общее кол-во сообщений с конкретным челвоеком.
WHERE user_id IN 
	(
		SELECT user_id FROM friendship WHERE friend_id = 17
		UNION
		SELECT friend_id FROM friendship WHERE user_id = 17
	) -- Друзья пользователя.
LIMIT 1;

