-- For `freelancers` table:
-- ALTER TABLE freelancers DROP FOREIGN KEY freelancers_country_id_fk, DROP FOREIGN KEY freelancers_membership_plan_id_fk, DROP FOREIGN KEY freelancers_account_id_fk;

ALTER TABLE freelancers 
ADD CONSTRAINT freelancers_country_id_fk
	FOREIGN KEY (country_id)
	REFERENCES countries(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE freelancers 
ADD CONSTRAINT freelancers_membership_plan_id_fk
	FOREIGN KEY (membership_plan_id)
	REFERENCES membership_plans(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;
        
ALTER TABLE freelancers 
ADD CONSTRAINT freelancers_account_id_fk
	FOREIGN KEY (account_id)
	REFERENCES accounts(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `profiles` table:
-- ALTER TABLE profiles DROP FOREIGN KEY profiles_freelancer_id_fk;

ALTER TABLE `profiles` 
ADD CONSTRAINT profiles_freelancer_id_fk
	FOREIGN KEY (freelancer_id)
	REFERENCES freelancers(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;


-- For `freelancers_skills` table:
-- ALTER TABLE freelancers_skills DROP FOREIGN KEY freelancers_skills_profile_id_fk, DROP FOREIGN KEY freelancers_skills_skill_type_id_fk;

ALTER TABLE `freelancers_skills` 
ADD CONSTRAINT freelancers_skills_profile_id_fk
	FOREIGN KEY (profile_id)
	REFERENCES profiles(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `freelancers_skills` 
ADD CONSTRAINT freelancers_skills_skill_type_id_fk
	FOREIGN KEY (skill_type_id)
	REFERENCES freelancers_skill_types(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;


-- For `clients` table:
-- ALTER TABLE clients DROP FOREIGN KEY clients_country_id_fk, DROP FOREIGN KEY clients_account_id_fk;

ALTER TABLE `clients` 
ADD CONSTRAINT clients_country_id_fk
	FOREIGN KEY (country_id)
	REFERENCES countries(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE `clients` 
ADD CONSTRAINT clients_account_id_fk
	FOREIGN KEY (account_id)
	REFERENCES accounts(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `projects` table:
/* ALTER TABLE projects 
DROP FOREIGN KEY projects_category_id_fk,
DROP FOREIGN KEY projects_client_created_id_fk,
DROP FOREIGN KEY projects_status_id_fk,
DROP FOREIGN KEY projects_pricing_type_id_fk,
DROP FOREIGN KEY projects_freelancer_id_fk; */

ALTER TABLE `projects` 
ADD CONSTRAINT projects_category_id_fk
	FOREIGN KEY (category_id)
	REFERENCES categories(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE `projects` 
ADD CONSTRAINT projects_client_created_id_fk
	FOREIGN KEY (client_created_id)
	REFERENCES clients(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `projects` 
ADD CONSTRAINT projects_status_id_fk
	FOREIGN KEY (status_id)
	REFERENCES project_statuses(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE `projects` 
ADD CONSTRAINT projects_pricing_type_id_fk
	FOREIGN KEY (pricing_type_id)
	REFERENCES project_pricing_types(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE `projects` 
ADD CONSTRAINT projects_freelancer_id_fk
	FOREIGN KEY (freelancer_id)
	REFERENCES freelancers(id)
		ON DELETE SET NULL
		ON UPDATE RESTRICT;


-- For `media` table:
-- ALTER TABLE media DROP FOREIGN KEY media_media_type_id_fk;

ALTER TABLE `media` 
ADD CONSTRAINT media_media_type_id_fk
	FOREIGN KEY (media_type_id)
	REFERENCES media_types(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `messages` table:
/* ALTER TABLE messages 
DROP FOREIGN KEY messages_project_id_fk,
DROP FOREIGN KEY messages_freelancer_id_fk,
DROP FOREIGN KEY messages_client_id_fk,
DROP FOREIGN KEY messages_media_id_fk; */

ALTER TABLE `messages` 
ADD CONSTRAINT messages_project_id_fk
	FOREIGN KEY (project_id)
	REFERENCES projects(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `messages` 
ADD CONSTRAINT messages_freelancer_id_fk
	FOREIGN KEY (freelancer_id)
	REFERENCES freelancers(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `messages` 
ADD CONSTRAINT messages_client_id_fk
	FOREIGN KEY (client_id)
	REFERENCES clients(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `messages` 
ADD CONSTRAINT messages_media_id_fk
	FOREIGN KEY (media_id)
	REFERENCES media(id)
		ON DELETE SET NULL
		ON UPDATE RESTRICT;


-- For `milestones` table:
-- ALTER TABLE milestones DROP FOREIGN KEY milestones_project_id_fk, DROP FOREIGN KEY milestones_milestone_status_id_fk;

ALTER TABLE `milestones` 
ADD CONSTRAINT milestones_project_id_fk
	FOREIGN KEY (project_id)
	REFERENCES projects(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `milestones` 
ADD CONSTRAINT milestones_milestone_status_id_fk
	FOREIGN KEY (milestone_status_id)
	REFERENCES milestone_statuses(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `proposals` table:
-- ALTER TABLE proposals DROP FOREIGN KEY proposals_project_id_fk, DROP FOREIGN KEY proposals_freelancer_id_fk, DROP FOREIGN KEY proposals_proposal_status_id_fk;

ALTER TABLE `proposals` 
ADD CONSTRAINT proposals_project_id_fk
	FOREIGN KEY (project_id)
	REFERENCES projects(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `proposals` 
ADD CONSTRAINT proposals_freelancer_id_fk
	FOREIGN KEY (freelancer_id)
	REFERENCES freelancers(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `proposals` 
ADD CONSTRAINT proposals_proposal_status_id_fk
	FOREIGN KEY (proposal_status_id)
	REFERENCES proposal_statuses(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `invites` table:
-- ALTER TABLE invites DROP FOREIGN KEY invites_project_id_fk, DROP FOREIGN KEY invites_freelancer_id_fk, DROP FOREIGN KEY invites_invite_status_id_fk;

ALTER TABLE `invites` 
ADD CONSTRAINT invites_project_id_fk
	FOREIGN KEY (project_id)
	REFERENCES projects(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `invites` 
ADD CONSTRAINT invites_freelancer_id_fk
	FOREIGN KEY (freelancer_id)
	REFERENCES freelancers(id)
		ON DELETE CASCADE
		ON UPDATE RESTRICT;

ALTER TABLE `invites` 
ADD CONSTRAINT invites_invite_status_id_fk
	FOREIGN KEY (invite_status_id)
	REFERENCES invite_statuses(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;


-- For `payments` table:
-- ALTER TABLE payments DROP FOREIGN KEY payments_payment_type_id_fk;

ALTER TABLE `payments` 
ADD CONSTRAINT payments_payment_type_id_fk
	FOREIGN KEY (payment_type_id)
	REFERENCES payment_types(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;
        
ALTER TABLE `payments` 
ADD CONSTRAINT payments_account_from_fk
	FOREIGN KEY (account_from)
	REFERENCES accounts(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;

ALTER TABLE `payments` 
ADD CONSTRAINT payments_account_to_fk
	FOREIGN KEY (account_to)
	REFERENCES accounts(id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT;
