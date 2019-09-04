-- 4.	Определить кто больше поставил лайков (всего) - мужчины или женщины?

USE vk;


SELECT COUNT(*) as likes_count, 
	(SELECT sex
		FROM profiles 
			WHERE likes.user_id = profiles.user_id) AS sex
		FROM likes GROUP BY sex ORDER BY likes_count DESC LIMIT 1;
		

