USE vk;

SHOW TABLES;

DESCRIBE users;

SELECT id, email, phone FROM users LIMIT 10;
INSERT INTO users VALUES (DEFAULT, 'Ivan', 'Petrov', 'test@mail.ru', '+7(915)22-33-457', DEFAULT, DEFAULT);
SELECT * FROM users WHERE firstname='Ivan' AND lastname='Petrov';

INSERT INTO like_types (name) VALUES ('media');
SELECT * FROM like_types;

SHOW WARNINGS;

DESC likes;
INSERT INTO likes SET item_id=117, likes_type_id=2, user_id=10;
SELECT * FROM likes WHERE item_id=117;

SELECT * FROM like_types LIMIT 2;
SELECT DISTINCT email, phone FROM users LIMIT 125;

SELECT * FROM users WHERE email='marty88@example.net';
UPDATE users SET email='marty99@mail.ru' WHERE email='marty88@example.net';
SELECT * FROM users WHERE email='marty88@example.net' OR email='marty99@mail.ru';

UPDATE IGNORE like_types SET id=7;
SELECT * FROM like_types;
SHOW WARNINGS;

SELECT COUNT(id) FROM users;
DELETE FROM users WHERE id = 117;
SELECT COUNT(id) FROM users;
DELETE FROM users WHERE id > 2000 LIMIT 10;
SELECT COUNT(*) FROM users;




