SHOW DATABASES;
USE vk;
SHOW TABLES;

DESC communities;
DESC communities_users;
DESC friendship;
DESC like_types;
DESC likes;
DESC media;
DESC media_types;
DESC messages;
DESC profiles;
DESC users;


-- INFO: ограничения добавлял по одному, даже если в одной таблице несколько ограничений потому что из-за несостыковки
-- данных в таблицах ограничения не вставали, а так легче было выявлять нестыковки и править данные.

ALTER TABLE communities_users 
ADD CONSTRAINT communities_users_fk_community_id
	FOREIGN KEY (community_id)
	REFERENCES communities(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE communities_users
ADD CONSTRAINT communities_users_fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE friendship
	ADD CONSTRAINT friendship_fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
	
	
ALTER TABLE friendship
	ADD CONSTRAINT friendship_fk_friend_id
	FOREIGN KEY (friend_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE likes
	ADD CONSTRAINT likes_fk_likes_type_id
	FOREIGN KEY (likes_type_id)
	REFERENCES like_types(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE likes
	ADD CONSTRAINT likes_fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE media
	ADD CONSTRAINT media_fk_media_type_id
	FOREIGN KEY (media_type_id)
	REFERENCES media_types(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE media
	ADD CONSTRAINT media_fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE messages
	ADD CONSTRAINT mesages_fk_from_user_id
	FOREIGN KEY (from_user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE messages
	ADD CONSTRAINT messages_fk_to_user_id
	FOREIGN KEY (to_user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
ALTER TABLE profiles
	ADD CONSTRAINT profiles_fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE profiles
	ADD CONSTRAINT profiles_fk_photo_id
	FOREIGN KEY (photo_id)
	REFERENCES media(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	
USE vk;
SHOW CREATE TABLE messages;

