-- 1. Number of employees
SELECT COUNT(*) FROM employees;

-- 2. List of all departments
SELECT DISTINCT department_name FROM departments;

-- 3. Average salary per department
SELECT department_id, AVG(salary) AS avg_salary
FROM salaries
GROUP BY department_id;

-- 4. Top 5 performers by review score
SELECT employee_id, AVG(score) AS avg_score
FROM performance_reviews
GROUP BY employee_id
ORDER BY avg_score DESC
LIMIT 5;

-- 5. Employees hired in the last 6 months
SELECT * FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 6. Department with highest attrition rate (MySQL version)
SELECT department_id,
       (SUM(CASE WHEN exit_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS attrition_rate
FROM employees
GROUP BY department_id;

-- 7. Number of promotions per employee
SELECT employee_id, COUNT(*) AS promotion_count
FROM promotions
GROUP BY employee_id;

-- 8. Gender distribution by department
SELECT department_id, gender, COUNT(*) AS count
FROM employees
GROUP BY department_id, gender;

-- 9. Employee tenure in years
SELECT employee_id, DATEDIFF(CURDATE(), hire_date) / 365 AS tenure_years
FROM employees;

-- 10. Correlation between salary and performance
SELECT e.employee_id, s.salary, AVG(p.score) AS avg_score
FROM employees e
JOIN salaries s ON e.id = s.employee_id
JOIN performance_reviews p ON e.id = p.employee_id
GROUP BY e.employee_id, s.salary;