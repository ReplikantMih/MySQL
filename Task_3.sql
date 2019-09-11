-- 1. ѕусть задан некоторый пользователь.
-- »з всех друзей этого пользовател€ найдите человека, который больше всех общалс€ с нашим пользоваетелем.

-- id=17

SELECT to_user_id, COUNT(*) 
FROM
	(SELECT from_user_id, to_user_id FROM messages
	UNION ALL
	SELECT to_user_id, from_user_id FROM messages) AS msgs
		RIGHT JOIN
		(SELECT user_id, friend_id FROM friendship
		UNION ALL
		SELECT friend_id, user_id FROM friendship
		WHERE user_id = 17) AS user_friends
			ON msgs.from_user_id = user_friends.user_id
GROUP BY to_user_id
LIMIT 1; 
		
		


-- 2. ѕодсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT SUM(likes) FROM
	(SELECT item_id AS liked_user_id, (NOW() - birthday) AS age, COUNT(*) AS likes 
	FROM (likes JOIN profiles ON likes.item_id = profiles.user_id) 
	WHERE likes_type_id = 4
	GROUP BY liked_user_id
	ORDER BY age
	LIMIT 10) AS liked_users_grouped_likes_count;





-- 3. ќпределить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT profiles.sex, COUNT(likes.user_id) AS likes 
FROM likes JOIN profiles 
WHERE likes.user_id = profiles.user_id 
GROUP BY sex;




-- 4. Ќайти 10 пользователей, которые про€вл€ют наименьшую активность в использовании социальной сети.

-- INFO: Ќе придумал, куда здесь JOIN можно прикрутить.
SELECT user_id, SUM(actions_count) AS total_actions_count
	FROM
		(SELECT user_id, COUNT(*) AS actions_count FROM likes GROUP BY user_id
		UNION ALL
		SELECT from_user_id, COUNT(*) FROM messages GROUP BY from_user_id
		UNION ALL
		SELECT user_id, COUNT(*) FROM media GROUP BY user_id) AS actions
	GROUP BY user_id
	ORDER BY total_actions_count DESC
	LIMIT 10;

