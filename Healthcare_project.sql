--- ### HEALTHCARE DATASET EXPLORATION PROJECT WITH SQL ### ---


 -- (source:https://www.kaggle.com/datasets/prasad22/healthcare-dataset) --


 --## Show Table
 SELECT *
 FROM healthcare_dataset




-- 1. How many records are there in the dataset?
SELECT COUNT(*) AS total_records 
FROM healthcare_dataset;

-- 2. What are the distinct blood types present in the dataset?
SELECT DISTINCT "BloodType" 
FROM healthcare_dataset;

-- 3. What is the average age of patients in the dataset?
SELECT AVG(Age) AS average_age 
FROM healthcare_dataset;

-- 4. How many male and female patients are there in the dataset?
SELECT Gender, COUNT(*) AS total_patients 
FROM healthcare_dataset 
GROUP BY Gender;

-- 5. What are the unique medical conditions present in the dataset?
SELECT DISTINCT "MedicalCondition" 
FROM healthcare_dataset;

-- 6. What is the earliest admission date in the dataset?
SELECT MIN("DateofAdmission") AS earliest_admission 
FROM healthcare_dataset;

-- 7. Who are the top 5 doctors with the highest number of patients?
SELECT TOP 5 Doctor, COUNT(*) AS patient_count 
FROM healthcare_dataset 
GROUP BY Doctor 
ORDER BY patient_count DESC;


-- 8. Which hospital had the highest billing amount?
SELECT TOP 1 Hospital, MAX("BillingAmount") AS highest_billing_amount 
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY highest_billing_amount DESC;

-- 9. What are the different insurance providers in the dataset?
SELECT DISTINCT "InsuranceProvider" 
FROM healthcare_dataset;

-- 10. What is the total billing amount for each insurance provider?
SELECT "InsuranceProvider", SUM("BillingAmount") AS total_billing_amount 
FROM healthcare_dataset 
GROUP BY "InsuranceProvider";

-- 11. How many patients were admitted as emergencies, electives, and urgent cases?
SELECT "AdmissionType", COUNT(*) AS admission_count 
FROM healthcare_dataset 
GROUP BY "AdmissionType";

-- 12. What is the average billing amount for each medical condition?
SELECT "MedicalCondition", AVG("BillingAmount") AS average_billing_amount 
FROM healthcare_dataset 
GROUP BY "MedicalCondition";

-- 13. Which room numbers are occupied by patients the most?
SELECT "RoomNumber", COUNT(*) AS occupancy_count 
FROM healthcare_dataset 
GROUP BY "RoomNumber" 
ORDER BY occupancy_count DESC;

-- 14. How many patients have inconclusive test results?
SELECT COUNT(*) AS inconclusive_test_count 
FROM healthcare_dataset 
WHERE "TestResults" = 'Inconclusive';

-- 15. What is the most prescribed medication in the dataset?
SELECT TOP 10 "Medication", COUNT(*) AS prescription_count 
FROM healthcare_dataset 
GROUP BY "Medication" 
ORDER BY prescription_count DESC;

-- 16. How many patients have diabetes, hypertension, and asthma?
SELECT "MedicalCondition", COUNT(*) AS patient_count 
FROM healthcare_dataset 
WHERE "MedicalCondition" IN ('Diabetes', 'Hypertension', 'Asthma') 
GROUP BY "MedicalCondition";

-- 17. What is the average age of male and female patients separately?
SELECT Gender, AVG(Age) AS average_age 
FROM healthcare_dataset 
GROUP BY Gender;

-- 18. How many patients were discharged on the same day as admission?
SELECT COUNT(*) AS same_day_discharge_count 
FROM healthcare_dataset 
WHERE "DischargeDate" = "DateofAdmission";

-- 19. What is the total billing amount for each hospital?
SELECT Hospital, SUM("BillingAmount") AS total_billing_amount 
FROM healthcare_dataset 
GROUP BY Hospital;

-- 20. Who are the doctors associated with the "Emergency" admission type?
SELECT DISTINCT Doctor 
FROM healthcare_dataset 
WHERE "AdmissionType" = 'Emergency';

-- 21. What is the maximum age of patients in the dataset?
SELECT MAX(Age) AS max_age 
FROM healthcare_dataset;

-- 22. How many patients have "Abnormal" test results?
SELECT COUNT(*) AS abnormal_test_count 
FROM healthcare_dataset 
WHERE "TestResults" = 'Abnormal';

-- 23. Which insurance provider has the highest average billing amount?
SELECT TOP 5 "InsuranceProvider", AVG("BillingAmount") AS average_billing_amount 
FROM healthcare_dataset 
GROUP BY "InsuranceProvider" 
ORDER BY average_billing_amount DESC;

-- 24. How many patients were admitted to each hospital?
SELECT Hospital, COUNT(*) AS admission_count 
FROM healthcare_dataset 
GROUP BY Hospital;

-- 25. What is the average billing amount for each gender?
SELECT Gender, AVG("BillingAmount") AS average_billing_amount 
FROM healthcare_dataset 
GROUP BY Gender;


-- 26. How many patients were admitted in each month? (for SQL Server)
SELECT MONTH("DateofAdmission") AS admission_month, COUNT(*) AS admission_count 
FROM healthcare_dataset 
GROUP BY MONTH("DateofAdmission");


-- 27. What is the total billing amount for patients with inconclusive test results?
SELECT SUM("BillingAmount") AS total_billing_amount 
FROM healthcare_dataset 
WHERE "TestResults" = 'Inconclusive';

-- 28. How many patients were admitted by each doctor?
SELECT Doctor, COUNT(*) AS admission_count 
FROM healthcare_dataset 
GROUP BY Doctor;

-- 29. What is the average billing amount for each admission type?
SELECT "AdmissionType", AVG("BillingAmount") AS average_billing_amount 
FROM healthcare_dataset 
GROUP BY "AdmissionType";

-- 30. Which patients have the highest billing amount?
SELECT TOP 1 Name, "BillingAmount" 
FROM healthcare_dataset 
ORDER BY "BillingAmount" DESC;
