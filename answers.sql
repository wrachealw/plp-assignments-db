-- CREATE DATABASE hospital_db;
-- USE hospital_db;
-- QUIZ 1.1 Table Name: patients
CREATE TABLE patients(
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	gender VARCHAR(20) NOT NULL,
	language VARCHAR(50) NOT NULL
);
-- QUIZ 1.2 Table Name: providers
CREATE TABLE providers(
	provider_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	provider_speciality VARCHAR(50) NOT NULL,
    email_address VARCHAR(200),
    phone_number VARCHAR(20),
    date_joined DATE NOT NULL
);
-- QUIZ 1.3 Table Name: visits
CREATE TABLE visits(
	visit_id INT PRIMARY KEY AUTO_INCREMENT,
	patient_id INT,
	FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
	provider_id INT,
	FOREIGN KEY (provider_id) REFERENCES providers(provider_id),
	date_of_visit DATE NOT NULL,
	date_scheduled DATE NOT NULL,
	visit_department_id INT NOT NULL,
	Visit_type VARCHAR(255) NOT NULL,
	blood_pressure_systollic INT,
	blood_pressure_diastollic DECIMAL,
	pulse DECIMAL,
	isit_status VARCHAR(255) NOT NULL
);
-- QUIZ 1.4 Table Name: ed_visits
CREATE TABLE ed_visits(
	ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
	visit_id INT,
	FOREIGN KEY(visit_id) REFERENCES visits(visit_id),
	patient_id INT,
	FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
	acquiy INT NOT NULL,
    reason_for_visit VARCHAR(255) NOT NULL,
   disposition VARCHAR(255) NOT NULL
);
  -- QUIZ 1.5 Table Name: admissions  
CREATE TABLE admissions(
	admission_id INT PRIMARY KEY AUTO_INCREMENT,
	patient_id INT,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
	admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    service VARCHAR(255) NOT NULL,
    discharge_disposition VARCHAR(255) NOT NULL,
    primary_diagnosis VARCHAR(255) NOT NULL
);
-- QUIZ 1.6 Table Name: discharges
CREATE TABLE discharges(
	discharge_id INT PRIMARY KEY AUTO_INCREMENT,
	admission_id INT,
    FOREIGN KEY(admission_id) REFERENCES admissions(admission_id),
	patient_id INT,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
	discharge_date DATE NOT NULL,
    discharge_disposition	VARCHAR(255) NOT NULL
);
