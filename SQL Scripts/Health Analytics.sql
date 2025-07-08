-- ========================================
-- 🏥 Health Analytics --

-- 1. Total number of patients
SELECT COUNT(*) AS total_patients FROM patients;

-- 2. Patients who visited in 2025
SELECT * FROM visits WHERE YEAR(visit_date) = 2025;

-- 3. Average age of patients
SELECT AVG(age) AS avg_age FROM patients;

-- 4. Top 5 most common diagnoses
SELECT diagnosis, COUNT(*) AS freq
FROM diagnoses
GROUP BY diagnosis
ORDER BY freq DESC
LIMIT 5;

-- 5. Number of treatments per hospital
SELECT hospital_id, COUNT(*) AS total_treatments
FROM treatments
GROUP BY hospital_id;

-- 6. Patients with more than 3 treatments
SELECT patient_id
FROM treatments
GROUP BY patient_id
HAVING COUNT(*) > 3;

-- 7. Monthly visit trends in 2024
SELECT MONTH(visit_date) AS month, COUNT(*) AS visits
FROM visits
WHERE YEAR(visit_date) = 2024
GROUP BY MONTH(visit_date);

-- 8. Average cost of treatments by diagnosis
SELECT d.diagnosis, AVG(t.cost) AS avg_cost
FROM treatments t
JOIN diagnoses d ON t.diagnosis_id = d.id
GROUP BY d.diagnosis;

-- 9. Patients who visited ≥ 2 different hospitals
SELECT patient_id
FROM visits
GROUP BY patient_id
HAVING COUNT(DISTINCT hospital_id) >= 2;

-- 10. Time between first and last visit per patient
SELECT patient_id,
       DATEDIFF(MAX(visit_date), MIN(visit_date)) AS days_between
FROM visits
GROUP BY patient_id;