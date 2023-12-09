-- STROKE DATASET EXPLORATION USING SQL



SELECT *
FROM data_stroke


-- 1. Count the total number of records in the dataset.
SELECT COUNT(*) AS total_records FROM data_stroke;

-- 2. Display the unique values in the 'gender' column.
SELECT DISTINCT gender FROM data_stroke;

-- 3. Calculate the average age of patients in the dataset.
SELECT AVG(age) AS average_age FROM data_stroke;

-- 4. Count the number of positive and negative cases of stroke.
SELECT stroke, COUNT(*) AS count FROM data_stroke GROUP BY stroke;

-- 5. Show the distinct values in the 'work_type' column.
SELECT DISTINCT work_type FROM data_stroke;

-- 6. Find the maximum and minimum values of 'avg_glucose_level'.
SELECT MAX(avg_glucose_level) AS max_glucose, MIN(avg_glucose_level) AS min_glucose FROM data_stroke;

-- 7. Count the number of positive and negative cases of hypertension.
SELECT hypertension, COUNT(*) AS count FROM data_stroke GROUP BY hypertension;

-- 8. Display the average BMI (body mass index) of patients.
SELECT AVG(bmi) AS average_bmi FROM data_stroke;

-- 9. Show the unique values in the 'smoking_status' column.
SELECT DISTINCT smoking_status FROM data_stroke;

-- 10. Count the number of positive and negative cases of heart disease.
SELECT heart_disease, COUNT(*) AS count FROM data_stroke GROUP BY heart_disease;

-- 11. Display the average age for each 'work_type'.
SELECT work_type, AVG(age) AS age FROM data_stroke GROUP BY work_type

-- 12. Display the average glucose level for each 'work_type'.
SELECT work_type, AVG(avg_glucose_level) AS avg_glucose FROM data_stroke GROUP BY work_type;

-- 13. Count the number of patients in each 'Residence_type'.
SELECT Residence_type, COUNT(*) AS count FROM data_stroke GROUP BY Residence_type;

-- 14. Show the average BMI for each 'smoking_status'.
SELECT smoking_status, AVG(bmi) AS avg_bmi FROM data_stroke GROUP BY smoking_status;

-- 15. Find the number of positive and negative cases of stroke for each 'gender'.
SELECT gender, stroke, COUNT(*) AS count FROM data_stroke GROUP BY gender, stroke;

-- 16. Display the average age of patients with and without hypertension.
SELECT hypertension, AVG(age) AS avg_age FROM data_stroke GROUP BY hypertension;

-- 17. Count the number of positive and negative cases of heart disease for each 'work_type'.
SELECT work_type, heart_disease, COUNT(*) AS count FROM data_stroke GROUP BY work_type, heart_disease;

-- 18. Show the average glucose level for patients who 'smoke' and those who 'never smoked'.
SELECT smoking_status, AVG(avg_glucose_level) AS avg_glucose FROM data_stroke WHERE smoking_status IN ('smokes', 'never smoked') GROUP BY smoking_status;

-- 19. Count the number of patients in each age group with positive and negative cases of hypertension.
SELECT FLOOR(age/10)*10 AS age_group, hypertension, COUNT(*) AS count FROM data_stroke GROUP BY age_group, hypertension;

-- 20. Calculate the percentage of patients with positive and negative cases of stroke.
SELECT stroke, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM data_stroke) AS percentage FROM data_stroke GROUP BY stroke;
