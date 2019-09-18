-- ���������������� ����� ������� ����� ����������� �������� ����� � �������� ������ ���������� � �������� ����������� �������.
USE vk;
SHOW TABLES;

-- �������:

-- 1. �������� ������ ������������� � �������� ��������� ��������� ��������� ����.
DESC profiles;
EXPLAIN SELECT user_id FROM profiles WHERE sex='f' AND birthday > '2015-01-01' AND birthday < '2019-10-10';

CREATE INDEX profiles_sex_profiles_birthday_idx ON profiles(sex, birthday);

-- 2. �������� ������ ������������� �� ��������� ������.
DESC profiles;
EXPLAIN SELECT user_id FROM profiles WHERE hometown = 'Moscow';

CREATE INDEX profiles_hometown_idx ON profiles(hometown);

-- 3. �������� ������ ��������� ����� ����� �������������� �� �������� �������� �������, ��������������� �� ������� ��������.
DESC messages;
EXPLAIN 
(SELECT id FROM messages WHERE from_user_id=1 AND to_user_id=2 AND created_at > '2019-01-01')
UNION ALL
(SELECT id FROM messages WHERE from_user_id=2 AND to_user_id=1 AND created_at > '2019-01-01')

CREATE INDEX messages_from_user_id_messages_to_user_id_created_at_idx ON messages(from_user_id, to_user_id, created_At);

-- 4. �������� ������ media ����������� ������������.
CREATE INDEX media_user_id_idx ON media(user_id);


-- 5. �������� ���������� ������ �� ���������� ������� ��������.
DESC likes;
EXPLAIN SELECT id FROM likes WHERE item_id=1 AND likes_type_id=1;

CREATE INDEX likes_item_id_idx ON likes(item_id);  # ������� � ��������� ������� �������� ���� � ��������� ���-��� ���������� �������� 
-- �� ����� ����� �����, ���� � ������� ��� �� ��������� ���� likes_type_id.

-- 6. �������� ������ ������ ������������.
DESC friendship;
EXPLAIN
SELECT friend_id FROM friendship WHERE user_id=1
UNION ALL
SELECT user_id FROM friendship WHERE friend_id=1; 

CREATE INDEX friendship_friend_id_idx ON friendship(friend_id); -- �� ���� user_id ������ ��� ����, ������ ��� ��� ����.

-- 7. �������� ������ ������������� ����������� ����������.
DESC communities_users;
EXPLAIN SELECT user_id FROM communities_users WHERE community_id=1; -- ���� �����, ��� community_id ��� ����, �� ������ �� ����� ����� ������.

CREATE INDEX communities_users_community_id_idx ON communities_users(community_id);
