USE upwork;

-- Запрещать вставку проектов с due_date, который уже истек.
DELIMITER //

DROP TRIGGER IF EXISTS due_date_projects_check//
CREATE TRIGGER due_date_projects_check BEFORE INSERT ON projects
FOR EACH ROW 
BEGIN
 IF NEW.due_date < NOW()
   THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Запрещено добавление проектов с датой due_date раньше текущего момента.';
 END IF;
END//

DELIMITER ;


-- Если у проекта поменялся статус на устаревший - менять статусы на устаревший майлстноунов этого проекта.
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


-- Запрещать добавлять более 5-ти профайлов на одного фрилансера.
DELIMITER //

DROP TRIGGER IF EXISTS no_more_5_projects_per_freelancer//
CREATE TRIGGER no_more_5_projects_per_freelancer BEFORE INSERT ON projects
FOR EACH ROW 
BEGIN
 IF (SELECT COUNT(*) FROM projects WHERE NEW.freelancer_id = freelancer_id) >= 5
   THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Запрещено добавлять более 5 проектов одному фрилансеру.';
 END IF;
END//

DELIMITER ;
