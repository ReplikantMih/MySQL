USE upwork;

-- ��������� ������� �������� � due_date, ������� ��� �����.
DELIMITER //

DROP TRIGGER IF EXISTS due_date_projects_check//
CREATE TRIGGER due_date_projects_check BEFORE INSERT ON projects
FOR EACH ROW 
BEGIN
 IF NEW.due_date < NOW()
   THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '��������� ���������� �������� � ����� due_date ������ �������� �������.';
 END IF;
END//

DELIMITER ;


-- ���� � ������� ��������� ������ �� ���������� - ������ ������� �� ���������� ������������ ����� �������.
DELIMITER //

DROP TRIGGER IF EXISTS set_milestones_expired//
CREATE TRIGGER set_milestones_expired AFTER UPDATE ON projects
FOR EACH ROW 
BEGIN
 IF NEW.status_id = 4 AND NEW.status_id != OLD.status_id
   THEN
     UPDATE milestones SET milestones.milestone_status_id = 4 WHERE project_id = NEW.id;
 END IF;
END//

DELIMITER ;


-- ��������� ��������� ����� 5-�� ��������� �� ������ ����������.
DELIMITER //

DROP TRIGGER IF EXISTS no_more_5_projects_per_freelancer//
CREATE TRIGGER no_more_5_projects_per_freelancer BEFORE INSERT ON projects
FOR EACH ROW 
BEGIN
 IF (SELECT COUNT(*) FROM projects WHERE NEW.freelancer_id = freelancer_id) >= 5
   THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '��������� ��������� ����� 5 �������� ������ ����������.';
 END IF;
END//

DELIMITER ;
