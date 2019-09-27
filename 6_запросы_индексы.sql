USE upwork;

-- ����� ���������������� ������� �������� �������, ��������� ����������� �������� ���������� �������.
-- � ���� ������� ��������� ������� �� ����� �������, ��������, �� ������� � ��������� ������ �������� ���� ������������� �������������
-- ����������� ���� ������� ��� ��������� ��� ������� ������ - � ����� ������� ������� �� ��������.

-- 1. ��� 10 ��������� ����������� + ��� 10 ��������� ���������� (�� �������� �������).
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
	
-- 2. ��� 25 ����������� �� ���������� �������� ��������.
SELECT freelancers.id AS freelancer_id, COUNT(*) AS count 
	FROM projects 
		JOIN freelancers ON freelancer_id = freelancers.id 
		JOIN project_statuses ON project_statuses.id = projects.status_id AND status = '��������' 
			GROUP BY freelancers.id 
			ORDER BY count DESC 
			LIMIT 25;


CREATE INDEX projects_freelancer_id_idx ON projects(freelancer_id);
		
		
-- 3. 5 ����� �������� �������������� ���������.
SELECT categories.name AS category, COUNT(*) AS count
	FROM projects 
		JOIN categories ON category_id = categories.id
	GROUP BY category
	ORDER BY count
	LIMIT 5;


-- 4. �������� ������� �� ������� ��� � ������� �������.
SELECT MONTH(created_At) AS month, SUM(ammount) AS sum, COUNT(ammount) AS count 
	FROM payments 
	WHERE YEAR(created_at) = YEAR(NOW()) - 1 
	GROUP BY month 
	ORDER BY month;


-- 5. �������� ������ ��������, ������� �� ������� � �������� ���� ���������� ������� ������ ����� ���� �����.
UPDATE projects SET status_id = 4 
	WHERE projects.id IN  
		(SELECT projects.id	
			FROM (SELECT * FROM projects) AS copy -- MySQL �� ������������ ����������� ��� UPDATE ������������ ��� ��������,
				JOIN project_statuses -- ������� ���������� �������� � ������� WHERE, ������� ����� �������������� ��������� ������.
					ON project_statuses.id = status_id AND status != '��������'
			WHERE DATEDIFF(NOW(),due_date) > 365);

		
-- � �������� ������� ���� �������� - �� ����� ����� �������, ���� ��� ������������� ����������� ���� ��������� ��� ������� ����.
-- projects.id - ��������� ����, ������� �� �����.	
	

-- 6. ������� ���������� milestones �� ���� ������ �� ������� �����.
SELECT COUNT(DISTINCT id) / COUNT(DISTINCT project_id) FROM milestones WHERE MONTH(created_at) = MONTH(NOW()) - 1;
		

-- 7. ������������� ����� ����������� � ����������, �� ������� �� ���� ���������� ������ ����.
UPDATE accounts SET operations_allowed = 0 
	WHERE id NOT IN 
		(SELECT account_from FROM payments WHERE DATEDIFF(NOW(),created_at) < 365 AND account_from != 0
		UNION
		SELECT account_to FROM payments WHERE DATEDIFF(NOW(),created_at) < 365 AND account_to != 0);


CREATE INDEX payments_account_from_idx ON payments(account_from);
CREATE INDEX payments_account_to_idx ON payments(account_to);
CREATE INDEX payments_account_from_account_to_idx ON payments(account_from, account_to); 
-- � ������ ������� ������ payments_account_from_account_to_idx �� �������,
-- �� � ����� �������� ��� �������� ��� �������� ��� ����� ���������� ������� ����� ����� ����������.


-- �������������� ������� ��� �������� � ���������� ��������, �� � ������������� �� ��������� ������� (��� �������� ����������� �������):

CREATE INDEX freelancers_first_name_last_name_idx ON freelancers(first_name, last_name);
CREATE INDEX messages_freelancer_id_client_id_idx ON messages(freelancer_id, client_id);
CREATE INDEX proposals_freelancer_price_idx ON proposals(freelancer_price);

-- ������� ���� �������� ������� ���������� ������ ���������-������� ����, ��� ���� ������� ��������� ���� ������������� ��� �� ���������,
-- ��� � �� ������� ����, ������� ������������� ������������ ��������� ����������� ������������ ����� ��������� ��������. ��������� �������,
-- � �.�. ������� �� ���������� ��������, ���������� ����������� ��� ���������� ���������� ��������.