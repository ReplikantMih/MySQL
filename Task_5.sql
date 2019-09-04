-- 5.	Ќайти 10 пользователей, которые про€вл€ют наименьшую активность в использовании социальной сети.

USE vk;

SHOW TABLES;

SELECT user_id, SUM(actions_count) AS total_actions_count
	FROM
		(SELECT user_id, COUNT(*) as actions_count FROM likes GROUP BY user_id
			UNION ALL
				SELECT from_user_id, COUNT(*) FROM messages GROUP BY from_user_id
					UNION ALL
						SELECT user_id, COUNT(*) FROM media GROUP BY user_id) AS actions
	GROUP BY user_id
	ORDER BY total_actions_count DESC
	LIMIT 10;