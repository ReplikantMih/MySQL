INSERT INTO skill_types VALUES 
(DEFAULT, 'SQL'),
(DEFAULT, ' MySQL'), 
(DEFAULT, 'Python'), 
(DEFAULT, 'Excel'), 
(DEFAULT, 'Linux'), 
(DEFAULT, 'C#'), 
(DEFAULT, 'AWS');

INSERT INTO project_statuses VALUES
(DEFAULT, 'Активен'),
(DEFAULT, 'Выполнен'),
(DEFAULT, 'Отменен'),
(DEFAULT, 'Устарел');

INSERT INTO categories VALUES
(DEFAULT, 'Мобильная разработка'),
(DEFAULT, 'Веб разработка'),
(DEFAULT, 'Бэкенд разработка'),
(DEFAULT, 'Дизайн'),
(DEFAULT, 'Аналитика'),
(DEFAULT, 'Переводы'),
(DEFAULT, 'Копирайтинг'),
(DEFAULT, 'Маркетинг'),
(DEFAULT, 'Продвижение'),
(DEFAULT, 'Реклама'),
(DEFAULT, 'Машинное обучение');

INSERT INTO project_pricing_types VALUES
(DEFAULT, 'FIX_PRICE'),
(DEFAULT, 'HOURLY_PRICE');

INSERT INTO countries VALUES
(DEFAULT, 'Россия'),
(DEFAULT, 'Китай'),
(DEFAULT, 'США'),
(DEFAULT, 'Великобритания'),
(DEFAULT, 'Нидерланды'),
(DEFAULT, 'Италия'),
(DEFAULT, 'Новая Зеландия'),
(DEFAULT, 'Австралия'),
(DEFAULT, 'Япония'),
(DEFAULT, 'Польша'),
(DEFAULT, 'Чехия'),
(DEFAULT, 'Испания'),
(DEFAULT, 'Греция'),
(DEFAULT, 'Турция'),
(DEFAULT, 'Египет'),
(DEFAULT, 'Швеция'),
(DEFAULT, 'Швейцария');

INSERT INTO media_types VALUES
(DEFAULT, 'video'),
(DEFAULT, 'audio'),
(DEFAULT, 'picture'),
(DEFAULT, 'GIF');

INSERT INTO membership_plans VALUES
(DEFAULT, 'DEFAULT', 0, 'FREE тариф по умолчанию', DEFAULT, DEFAULT),
(DEFAULT, 'PROFESSIONAL', 100, 'Тариф профессиональный', DEFAULT, DEFAULT),
(DEFAULT, 'PROFESSIONAL_PLUS', 150, 'Тариф профессиональный+', DEFAULT, DEFAULT);

INSERT INTO milestone_statuses VALUES
(DEFAULT, 'SUCCESSFUL'),
(DEFAULT, 'NOT_SUCCESSFUL'),
(DEFAULT, 'IN_PROGRESS'),
(DEFAULT, 'DEADLINES_FAILED');

INSERT INTO proposal_statuses VALUES
(DEFAULT, 'ACCEPTED'),
(DEFAULT, 'WAITING'),
(DEFAULT, 'DECLINED'),
(DEFAULT, 'EXPIRED');

INSERT INTO invitation_statuses VALUES
(DEFAULT, 'ACCEPTED'),
(DEFAULT, 'WAITING'),
(DEFAULT, 'DECLINED'),
(DEFAULT, 'EXPIRED');

INSERT INTO payment_types VALUES
(DEFAULT, 'INNER_PAYMENT'),
(DEFAULT, 'WITHDRAWAL'),
(DEFAULT, 'REFILL');