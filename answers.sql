-- -- CREATE DATABASE hospital_db;
-- -- USE hospital_db;
-- -- QUIZ 1.1 Table Name: patients
-- CREATE TABLE patients(
-- 	patient_id INT PRIMARY KEY AUTO_INCREMENT,
-- 	first_name VARCHAR(50) NOT NULL,
-- 	last_name VARCHAR(50) NOT NULL,
-- 	date_of_birth DATE NOT NULL,
-- 	gender VARCHAR(20) NOT NULL,
-- 	language VARCHAR(50) NOT NULL
-- );
-- -- QUIZ 1.2 Table Name: providers
-- CREATE TABLE providers(
-- 	provider_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
-- 	provider_speciality VARCHAR(50) NOT NULL,
--     email_address VARCHAR(200),
--     phone_number VARCHAR(20),
--     date_joined DATE NOT NULL
-- );
-- -- QUIZ 1.3 Table Name: visits
-- CREATE TABLE visits(
-- 	visit_id INT PRIMARY KEY AUTO_INCREMENT,
-- 	patient_id INT,
-- 	FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
-- 	provider_id INT,
-- 	FOREIGN KEY (provider_id) REFERENCES providers(provider_id),
-- 	date_of_visit DATE NOT NULL,
-- 	date_scheduled DATE NOT NULL,
-- 	visit_department_id INT NOT NULL,
-- 	Visit_type VARCHAR(255) NOT NULL,
-- 	blood_pressure_systollic INT,
-- 	blood_pressure_diastollic DECIMAL,
-- 	pulse DECIMAL,
-- 	isit_status VARCHAR(255) NOT NULL
-- );
-- -- QUIZ 1.4 Table Name: ed_visits
-- CREATE TABLE ed_visits(
-- 	ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
-- 	visit_id INT,
-- 	FOREIGN KEY(visit_id) REFERENCES visits(visit_id),
-- 	patient_id INT,
-- 	FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
-- 	acquiy INT NOT NULL,
--     reason_for_visit VARCHAR(255) NOT NULL,
--    disposition VARCHAR(255) NOT NULL
-- );
--   -- QUIZ 1.5 Table Name: admissions  
-- CREATE TABLE admissions(
-- 	admission_id INT PRIMARY KEY AUTO_INCREMENT,
-- 	patient_id INT,
--     FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
-- 	admission_date DATE NOT NULL,
--     discharge_date DATE NOT NULL,
--     service VARCHAR(255) NOT NULL,
--     discharge_disposition VARCHAR(255) NOT NULL,
--     primary_diagnosis VARCHAR(255) NOT NULL
-- );
-- -- QUIZ 1.6 Table Name: discharges
-- CREATE TABLE discharges(
-- 	discharge_id INT PRIMARY KEY AUTO_INCREMENT,
-- 	admission_id INT,
--     FOREIGN KEY(admission_id) REFERENCES admissions(admission_id),
-- 	patient_id INT,
--     FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
-- 	discharge_date DATE NOT NULL,
--     discharge_disposition	VARCHAR(255) NOT NULL
-- );


-- -- USE hospital_db;

-- -- Quiz 1.1 retrieve the first_name, last_name and date_of_birth of all patients.
-- -- SELECT first_name, last_name, date_of_birth
-- -- FROM patients;

-- -- Quiz 1.2 retrieve the provider_id, first_name and provider_specialty from the providers table.
-- -- SELECT provider_id , first_name , provider_specialty
-- -- FROM providers;

-- -- Quiz 2.1 retrieve all patients whose first names start with "Ab"(wildcard).
-- -- SELECT *
-- -- FROM patients
-- -- WHERE first_name LIKE 'Ab%';

-- -- Quiz 2.2 retrieve all providers whose specialties end with the letter "y".
-- -- SELECT *
-- -- FROM providers
-- -- WHERE provider_specialty LIKE '%y';

-- -- Quiz 3.1 all patients born after 1st January 1980.
-- -- SELECT *
-- -- FROM patients
-- -- WHERE date_of_birth > '1980-01-01';

-- -- Quiz 3.2 retrieve visits where the acuity level is 2 or higher.
-- -- SELECT *
-- -- FROM ed_visits
-- -- WHERE acuity >= '2';

-- -- Quiz 4.1 find patients who speak Spanish.
-- -- SELECT first_name, last_name
-- -- FROM patients
-- -- WHERE language LIKE 'spanish'

-- -- Quiz 4.2 retrieve visits where the reason is "Migraine" and the disposition is "Admitted".
-- -- SELECT *
-- -- FROM ed_visits
-- -- WHERE reason_for_visit like 'migraine' 
-- 	-- AND ed_disposition LIKE 'admited';

-- -- Quiz 4.3 find patients born between 1975 and 1980.
-- -- SELECT *
-- -- FROM patients
-- -- WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-01-01';

-- -- Quiz 5.1 retrieve patient names and sort them in alphabetical order by last name.
-- -- SELECT last_name, first_name
-- -- FROM patients
-- -- ORDER BY last_name ASC;

-- -- Quiz 5.2  list all visits sorted by the date of the visit, starting from the most recent.
-- -- SELECT *
-- -- FROM visits
-- -- ORDER BY date_of_visit DESC;

-- -- Quiz 6.1 retrieve all admissions where the primary diagnosis is "Stroke" and the discharge disposition is "Home".
-- -- SELECT *
-- -- FROM admissions, discharges
-- -- WHERE primary_diagnosis LIKE 'stroke'
-- 	-- AND discharge_disposition LIKE 'home';
    
-- -- Quiz 6.2 find providers who joined after 1995 and specialize in either Pediatrics or Cardiology.
-- -- SELECT*
-- -- FROM providers
-- -- WHERE date_joined > '1995-01-01' 
-- 	-- AND provider_specialty IN ('cardiology' , 'pediatrics');

-- -- Quiz Bonus Challenge (optional)
-- -- lists all discharges where the patient was discharged home and the discharge date is within the first week of March 2018.
-- SELECT *
-- FROM discharges
-- WHERE discharge_disposition like 'home'
-- 	 AND discharge_date BETWEEN '2018-03-01' AND '2018-03-07';

	 

-- 	 -- USE hospital_db;
-- -- Quiz 1.1 total number of patient admissions in the admissions table
-- -- SELECT COUNT(admission_id) AS number_of_patient_admissions
-- -- FROM admissions;

-- -- Quiz 1.2 calculate the average length of stay (difference between discharge date and admission date) for all patients.
-- -- SELECT AVG(discharge_date - admission_date) AS average_length_of_stay
-- -- FROM discharges , admissions;

-- -- Quiz 2.1 group admissions by primary_diagnosis and calculate the total number of admissions for each diagnosis.

-- -- SELECT primary_diagnosis, COUNT(admission_id) AS total_number_of_admissions
-- -- FROM admissions
-- -- GROUP BY primary_diagnosis;

-- -- Quiz 2.2 group admissions by service and calculate the average length of stay for each service (e.g., Cardiology, Neurology)
-- -- SELECT service, AVG(discharge_date - admission_date) AS average_length_of_stay
-- -- FROM admissions, discharges
-- -- GROUP BY service;

-- -- Quiz 2.3 group discharges by discharge_disposition and count the number of discharges in each category (e.g., Home, Expired, Transfer).
-- -- SELECT discharge_disposition, COUNT(discharges_id) AS number_of_discharges
-- -- FROM discharges
-- -- GROUP BY discharge_disposition;

-- -- Quiz 3.1  group admissions by service and show the services where the total number of admissions is greater than 5.
-- -- SELECT service, SUM( admission_id >5) AS total_number_of_admissions
-- -- FROM admissions
-- -- GROUP BY service;

-- -- Quiz 3.2 find the average length of stay for patients admitted with a primary diagnosis of "Stroke" in the admissions table.
-- -- SELECT  AVG(discharge_date - admission_date) AS stroke_average_length_of_stay
-- -- FROM admissions, discharges
-- -- WHERE primary_diagnosis = 'stroke';

-- -- Quiz 4.1 group emergency department visits (ed_visits) by acuity and calculate the total number of visits for each acuity level. 
-- -- SELECT acuity, COUNT(ed_visit_id) AS  total_number_of_visits
-- -- FROM ed_visits
-- -- GROUP BY acuity;

-- -- Quiz 4.2  group admissions by primary_diagnosis and service, showing the total number of admissions for each combination.
-- -- SELECT primary_diagnosis, service, COUNT(primary_diagnosis and service)
-- -- FROM admissions
-- -- GROUP BY primary_diagnosis , service;

-- -- Quiz 5.1 group admissions by month (using the admission_date) and calculate the total number of admissions per month.
-- -- SELECT DATE_FORMAT(admission_date, '%y-%m') AS month,
-- 		-- COUNT(*) AS total_number_of_admissions
-- -- GROUP BY month
-- -- ORDER BY month;

-- -- Quiz 5.2 find the maximum length of stay for each primary_diagnosis in the admissions table.
-- -- SELECT primary_diagnosis, MAX(discharge_date - admission_date) AS maximum_length_of_stay
-- -- FROM admissions, discharges
-- -- GROUP BY primary_diagnosis;

-- -- Quiz Bonus Challenge- group admissions by service and calculate both the total and average length of stay for each service, ordered by the highest average length of stay.
-- -- SELECT service, SUM(discharge_date - admission_date) AS total_length_of_stay,
-- 	-- AVG(discharge_date - admission_date) AS average_length_of_stay
-- -- FROM admissions, discharges
-- -- GROUP BY service
-- -- ORDER BY total_length_of_stay desc;

-- -- USE hospital_db;
-- -- Quiz 1.1  Add a new patient with the following details
-- -- INSERT INTO patients
-- -- 	(first_name, last_name, date_of_birth, gender, language)
-- -- VALUES ('John', 'Doe', '1980-11-15', 'male', 'English');

-- -- SELECT *
-- -- FROM patients

-- -- Quiz 2.1 Write a query to change John Doe's languge from "English" to "Spanish"
-- -- UPDATE patients
-- -- SET language = 'Spanish'
-- -- WHERE patient_id = '946';

-- -- SELECT *
-- -- FROM patients;

-- -- Quiz 3.1 Delete the patient with the patient_id number 10
-- --  DELETE FROM patients
-- --  WHERE patient_id IN(10);

-- -- Quiz 4.1 Replace all the names and the emails of the providers and if any of them has a NULL email, with N/A
-- -- SELECT first_name, last_name, IFNULL(email_address, 'N/A')
-- -- FROM providers;

-- -- Quiz 4.2 Write a query that takes the names and contact details of the provider whether phone number or email and if any of the two is missing, replace it with Missing details
-- --  SELECT first_name, last_name, IFNULL( email_address, 'missing details') AS new_email_address, IFNULL(phone_number, 'missing details') AS new_phone_number
-- --  FROM providers;

-- -- Quiz Bonus Write a query to retrieve all providers whose speciality is pediatrics and they are missing either of the contact details.
-- -- SELECT first_name, last_name, COALESCE(email_address, phone_number, 'missing') AS contact_details
-- -- FROM providers
-- -- WHERE provider_specialty = 'pediatrics';