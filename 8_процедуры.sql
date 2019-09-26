USE upwork;


-- Перевести неактивные аккаунты в заблокировано.
DELIMITER //

DROP PROCEDURE IF EXISTS block_1_year_inactive_accounts;

CREATE PROCEDURE block_1_year_inactive_accounts()
BEGIN
	UPDATE accounts SET operations_allowed = 1 WHERE DATEDIFF(NOW(), updated_at) > 365.25;
END//

DELIMITER ;

CALL block_1_year_inactive_accounts();



-- Пополнить все счета бонусными n долларами.
DELIMITER //

DROP PROCEDURE IF EXISTS add_dollars_to_all_accounts;

CREATE PROCEDURE add_dollars_to_all_accounts(IN dollars DECIMAL)
BEGIN
	UPDATE accounts SET balance = balance + dollars;
END//

DELIMITER ;

CALL add_dollars_to_all_accounts(10);

