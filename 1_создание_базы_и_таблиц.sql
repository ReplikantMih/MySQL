DROP DATABASE IF EXISTS upwork;

CREATE DATABASE upwork;
USE upwork;

-- Таблица для фрилансеров, фрилансер может иметь несколько профилей с разным
-- описанием, списком навыков и т.д., в таблице freelancers хранятся данные,
-- не зависящие от профиля.
DROP TABLE IF EXISTS freelancers;
CREATE TABLE IF NOT EXISTS freelancers (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    country_id SMALLINT UNSIGNED NOT NULL,
    membership_plan_id SMALLINT UNSIGNED NOT NULL,
    account_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Профили фрилансеров. Фрилансер может настраивать для себя несколько профилей,
-- затачивая каждый под конкретную специализацию, профиль в т.ч. содержит
-- список скиллов, описание о себе и т.д.
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    freelancer_id INT NOT NULL,
    about VARCHAR(5000),
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Список возможных для выбора скиллов, которые может указать фрилансер.
-- Список предуставновленный, добавляя себе скилл, фрилансер выбирает его из
-- предустановленного этого списка.
DROP TABLE IF EXISTS freelancers_skill_types;
CREATE TABLE IF NOT EXISTS freelancers_skill_types (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    skill_type_name VARCHAR(100) NOT NULL
);

-- Конкретные настроенные скиллы с привязкой к конкретным профилям.
DROP TABLE IF EXISTS freelancers_skills;
CREATE TABLE IF NOT EXISTS freelancers_skills (
	profile_id INT NOT NULL,
    skill_type_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Таблица заказчиков.
DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    country_id SMALLINT UNSIGNED NOT NULL,
    account_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Список статусов проекта (в работе / устарел / выполнен и т.д.).
DROP TABLE IF EXISTS project_statuses;
CREATE TABLE IF NOT EXISTS project_statuses (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `status` VARCHAR(100) NOT NULL 
);

-- Категории - предметные области, к которым может относиться проект -
-- маркетинг, разработка, аналитика, дизайн и т.д.
DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(100) NOT NULL 
);

-- Проекты.
DROP TABLE IF EXISTS projects;
CREATE TABLE IF NOT EXISTS projects (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	title VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    client_created_id INT NOT NULL,
    status_id INT NOT NULL,
    pricing_type_id INT NOT NULL,
    price DECIMAL NOT NULL,
    due_date DATETIME NOT NULL,
    freelancer_id INT,
    job_paid BOOL DEFAULT FALSE NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()    
);

-- Возможные варианты ценообразования по проектам (фиксированная цена /
-- почасовая оплата и т.д.).
DROP TABLE IF EXISTS project_pricing_types;
CREATE TABLE IF NOT EXISTS project_pricing_types (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pricing_type VARCHAR(100) NOT NULL
);

-- Список стран, при указании страны для фрилансера или заказчика идет отсылка
-- к данной таблице.
DROP TABLE IF EXISTS countries;
CREATE TABLE IF NOT EXISTS countries (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    country VARCHAR(100)
);


-- Типы медиа контента.
DROP TABLE IF EXISTS media_types;
CREATE TABLE IF NOT EXISTS media_types (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `type` VARCHAR(100)
);

-- Список медиа файлов.
DROP TABLE IF EXISTS media;
CREATE TABLE IF NOT EXISTS media (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    media_type_id INT NOT NULL,
    size INT NOT NULL,
    link VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Сообщения между заказчиками и фрилансерами. from_freelancer - флаг направления
-- сообщения, media_id - отсылка к конкретному файлу, если таковой приложен
-- в сообщении.
DROP TABLE IF EXISTS messages;
CREATE TABLE IF NOT EXISTS messages (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    client_id INT NOT NULL,
    from_freelancer BOOL NOT NULL,
    body VARCHAR(2500) NOT NULL,
    media_id INT,
    delivered BOOL DEFAULT FALSE NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Список тарифов для фрилансеров, тариф имеет свою цену, а так же инкапсулирует
-- условия для фрилансера, список доступных функциональных возможностей и т.д.
DROP TABLE IF EXISTS membership_plans;
CREATE TABLE IF NOT EXISTS membership_plans (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL,
    `description` VARCHAR(1250) NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Промежуточные оплачиваемые точки по проекту.
DROP TABLE IF EXISTS milestones;
CREATE TABLE IF NOT EXISTS milestones (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    project_id INT NOT NULL,
    price DECIMAL NOT NULL,
    due_date DATETIME NOT NULL,
    milestone_status_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Варианты статуса для поля статус, которым характеризуются объекты класса
-- milestone.
DROP TABLE IF EXISTS milestone_statuses;
CREATE TABLE IF NOT EXISTS milestone_statuses (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `status` VARCHAR(100) NOT NULL
);

-- Предложения фрилансеров участвовать в проектах.
DROP TABLE IF EXISTS proposals;
CREATE TABLE IF NOT EXISTS proposals (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    freelancer_price DECIMAL,
    freelancer_due_date DATETIME,
    proposal_status_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Варианты статусов предложений фрилансеров.
DROP TABLE IF EXISTS proposal_statuses;
CREATE TABLE IF NOT EXISTS proposal_statuses (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `status` VARCHAR(100)
);

-- Приглашения от заказчиков фрилансерам стать исполнителем по проекту.
DROP TABLE IF EXISTS invites;
CREATE TABLE IF NOT EXISTS invites (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    invite_status_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Варианты статусов по приглашениям от заказчиков.
DROP TABLE IF EXISTS invite_statuses;
CREATE TABLE IF NOT EXISTS invite_statuses(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `status` VARCHAR(100) NOT NULL
);

-- Внутренние денежные счета для денежных операций внутри системы и вовне.
DROP TABLE IF EXISTS accounts;
CREATE TABLE IF NOT EXISTS accounts(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    balance DECIMAL NOT NULL,
    operations_allowed BOOL,
    created_at DATETIME DEFAULT NOW() NOT NULL,
    updated_at DATETIME DEFAULT NOW() NOT NULL ON UPDATE NOW()
);

-- Типы операций по счетам.
DROP TABLE IF EXISTS payment_types;
CREATE TABLE IF NOT EXISTS payment_types (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    type VARCHAR(100) NOT NULL
);

-- Платежи - операции по счетам.
DROP TABLE IF EXISTS payments;
CREATE TABLE IF NOT EXISTS payments (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    payment_type_id INT NOT NULL,
    account_from INT,
    account_to INT,
    ammount DECIMAL NOT NULL,
    created_at DATETIME DEFAULT NOW() NOT NULL
);