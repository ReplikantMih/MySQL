USE upwork;



-- Таблица freelancers где значения всех внешних ключей заменены на информативные описания/названия соответствующих сущностей.
DROP VIEW IF EXISTS freelancers_no_foreign_keys;

CREATE VIEW freelancers_no_foreign_keys
AS 
SELECT freelancers.id AS freelancer_id,
	   first_name,
	   last_name,
	   birthday,
	   email,
	   countries.country,
	   membership_plans.name AS membership_plan_name,
	   accounts.balance AS account_balance
	FROM freelancers 
		LEFT JOIN countries ON countries.id = country_id
		LEFT JOIN membership_plans ON membership_plans.id = membership_plan_id
		LEFT JOIN accounts ON accounts.id = account_id;

SELECT * FROM freelancers_no_foreign_keys ORDER BY RAND() LIMIT 100;



-- Отсортированные по цене проекты (ограниченное число столбцов), не дешевле 100000.
DROP VIEW IF EXISTS sorted_projects;

CREATE VIEW sorted_projects
AS 
SELECT id, title, price, due_date, job_paid, created_at FROM projects WHERE price > 10000000 ORDER BY price DESC;

SELECT * FROM sorted_projects LIMIT 25;



-- Список стран с указанием кол-ва фрилансеров из каждой.
DROP VIEW IF EXISTS freelancers_per_countries;

CREATE VIEW freelancers_per_countries
AS 
SELECT countries.country, COUNT(*) AS freelancers_count
	FROM 
		freelancers JOIN countries ON countries.id = country_id
	GROUP BY country_id
	ORDER BY freelancers_count DESC;


SELECT * FROM freelancers_per_countries;

