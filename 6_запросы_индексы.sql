USE upwork;

-- После соответствующего запроса добавляю индексы, способные значительно ускорить выполнение запроса.
-- В ряде случаев ожидаемый прирост не очень большой, например, на таблицы с небольшим числом значений либо задействуются автоматически
-- добавляемые СУБД индексы для первичных или внешних ключей - в таких случаях индексы не добавляю.

-- 1. ТОП 10 аккаунтов фрилансеров + ТОП 10 аккаунтов заказчиков (по величине баланса).
(SELECT freelancers.id AS id, balance 
	FROM accounts 
	JOIN freelancers ON accounts.id = freelancers.account_id 
	ORDER BY balance DESC 
	LIMIT 10)
		UNION ALL
(SELECT clients.id, balance 
	FROM accounts 
	JOIN clients ON accounts.id = clients.account_id 
	ORDER BY balance DESC 
	LIMIT 10) 
		ORDER BY balance DESC;
	

CREATE INDEX freelancers_account_id_idx ON freelancers(account_id);
CREATE INDEX accounts_balance_idx ON accounts(balance);
	
-- 2. ТОП 25 фрилансеров по количеству закрытых проектов.
SELECT freelancers.id AS freelancer_id, COUNT(*) AS count 
	FROM projects 
		JOIN freelancers ON freelancer_id = freelancers.id 
		JOIN project_statuses ON project_statuses.id = projects.status_id AND status = 'Выполнен' 
			GROUP BY freelancers.id 
			ORDER BY count DESC 
			LIMIT 25;


CREATE INDEX projects_freelancer_id_idx ON projects(freelancer_id);
		
		
-- 3. 5 самых наименее востребованных категорий.
SELECT categories.name AS category, COUNT(*) AS count
	FROM projects 
		JOIN categories ON category_id = categories.id
	GROUP BY category
	ORDER BY count
	LIMIT 5;


-- 4. Динамика оборота за прошлый год в разрезе месяцев.
SELECT MONTH(created_At) AS month, SUM(ammount) AS sum, COUNT(ammount) AS count 
	FROM payments 
	WHERE YEAR(created_at) = YEAR(NOW()) - 1 
	GROUP BY month 
	ORDER BY month;


-- 5. Поменять статус проектов, которые не закрыты и плановый срок завершения которых прошел более года назад.
UPDATE projects SET status_id = 4 
	WHERE projects.id IN  
		(SELECT projects.id	
			FROM (SELECT * FROM projects) AS copy -- MySQL не поддерживает конструкции где UPDATE производится над таблицей,
				JOIN project_statuses -- которая фигурирует напрямую в условии WHERE, поэтому такой дополнительный вложенный запрос.
					ON project_statuses.id = status_id AND status != 'Выполнен'
			WHERE DATEDIFF(NOW(),due_date) > 365);

		
-- У статусов слишком мало значений - не особо нужны индексы, хотя они автоматически добавляются СУБД поскольку это внешний ключ.
-- projects.id - первичный ключ, индексы не нужны.	
	

-- 6. Среднее количество milestones на один проект за прошлый месяц.
SELECT COUNT(DISTINCT id) / COUNT(DISTINCT project_id) FROM milestones WHERE MONTH(created_at) = MONTH(NOW()) - 1;
		

-- 7. Заблокировать счета фрилансеров и заказчиков, по которым не было активности больше года.
UPDATE accounts SET operations_allowed = 0 
	WHERE id NOT IN 
		(SELECT account_from FROM payments WHERE DATEDIFF(NOW(),created_at) < 365 AND account_from != 0
		UNION
		SELECT account_to FROM payments WHERE DATEDIFF(NOW(),created_at) < 365 AND account_to != 0);


CREATE INDEX payments_account_from_idx ON payments(account_from);
CREATE INDEX payments_account_to_idx ON payments(account_to);
CREATE INDEX payments_account_from_account_to_idx ON payments(account_from, account_to); 
-- В данном запросе индекс payments_account_from_account_to_idx не поможет,
-- но в целом выглядит как полезный для запросов где нужно посмотреть платежи между двумя аккаунтами.


-- Дополнительные индексы без привязки к конкретным запросам, но с ориентировкой на возможные запросы (без указания конкретного запроса):

CREATE INDEX freelancers_first_name_last_name_idx ON freelancers(first_name, last_name);
CREATE INDEX messages_freelancer_id_client_id_idx ON messages(freelancer_id, client_id);
CREATE INDEX proposals_freelancer_price_idx ON proposals(freelancer_price);

-- Таблицы базы содержат большое количество связок первичный-внешний ключ, при этом индексы создаются СУБД автоматически как на первичный,
-- так и на внешний ключ, поэтому автоматически создаваемыми индексами покрывается значительная часть возможных запросов. Остальные индексы,
-- в т.ч. индексы по нескольким столбцам, необходимо настраивать под конкретную статистику запросов.