SHOW DATABASES;
USE vk;

SHOW TABLES;


/* Наверно, я погорячился в эти таблицы id лайков ставить, вряд ли лайк как самостоятельная сущность так
 интересен, наверно, можно было просто PRIMARY KEY (user_id, community_id) и на остальных двух таблицах
 аналогично. */

CREATE TABLE communities_likes (
	Id INT UNSIGNED NOT NULL PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	community_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()	
);

CREATE TABLE media_likes (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	media_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

-- TODO: add Id to 'messages' table.
CREATE TABLE messages_likes (
	id INT UNSIGNED NOT NULL PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	message_id INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

SHOW TABLES;

