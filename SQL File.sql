-------------------- Employee Demographics & Distribution -------------------------

-- 1) Determine the total number of employees.
SELECT 
    COUNT(EmployeeID) AS Total_EmployeeID
FROM
    general_data;

-- 2) Count of employees by Department, Job Role, Gender, Education Field, etc.
-- Department
SELECT 
    Department, COUNT(EmployeeID) AS Total_Employees
FROM
    general_data
GROUP BY Department
ORDER BY Total_Employees DESC;
-- Job Role
SELECT 
    JobRole, COUNT(EmployeeID) AS Total_Employees
FROM
    general_data
GROUP BY JobRole
ORDER BY Total_Employees DESC;
-- Gender
SELECT 
    Gender, COUNT(EmployeeID) AS Total_Employees
FROM
    general_data
GROUP BY Gender;
-- Education Field
SELECT 
    EducationField, COUNT(EmployeeID) AS Total_Employees
FROM
    general_data
GROUP BY EducationField
ORDER BY Total_Employees DESC;

-- 3) Distribution of employees by Age Group and Marital Status.
SELECT MaritalStatus, Age_Group, COUNT(EmployeeID) AS Total_Employees FROM (
    SELECT EmployeeID, MaritalStatus, 
        CASE 
            WHEN Age BETWEEN 18 AND 28 THEN '18-28'
            WHEN Age BETWEEN 29 AND 37 THEN '29-37'
            WHEN Age BETWEEN 38 AND 47 THEN '38-47'
            WHEN Age BETWEEN 48 AND 57 THEN '48-57'
            ELSE '58+'
        END AS Age_Group FROM general_data) AS grouped_data
GROUP BY MaritalStatus, Age_Group
ORDER BY Age_Group DESC;


-------------------- Employee Satisfaction & Work_Life Balance ------------------------

-- 4) Calculate the average Job Satisfaction, Environment Satisfaction, and Work-Life Balance scores.
SELECT 
    AVG(JobSatisfaction) AS Avg_JobSatisfaction,
    AVG(EnvironmentSatisfaction) AS Avg_EnvironmentSatisfaction,
    AVG(WorkLifeBalance) AS Avg_WorkLifeBalance
FROM
    employee_survey_data;

-- 5) Identify departments or job roles with lower satisfaction levels.
-- departments
SELECT 
    general_data.Department,
    AVG(employee_survey_data.JobSatisfaction) AS Avg_JobSatisfaction
FROM
    general_data
        JOIN
    employee_survey_data ON general_data.EmployeeID = employee_survey_data.EmployeeID
GROUP BY Department
ORDER BY Avg_JobSatisfaction;
-- job role
SELECT 
    general_data.JobRole,
    ROUND(AVG(employee_survey_data.JobSatisfaction),2) AS Avg_JobSatisfaction
FROM
    general_data
        JOIN
    employee_survey_data ON general_data.EmployeeID = employee_survey_data.EmployeeID
GROUP BY JobRole ORDER BY Avg_JobSatisfaction DESC;

-- 6) Determine the number of employees with high/low Work-Life Balance ratings.
SELECT 
    COUNT(EmployeeID) AS Total_Employees,
    WorkLifeBalance AS WorkLifeBalanceCategory
FROM
    (SELECT 
        employeeID,
            CASE
                WHEN WorkLifeBalance BETWEEN 1 AND 2 THEN 'LOW'
                WHEN WorkLifeBalance BETWEEN 3 AND 4 THEN 'HIGH'
                ELSE 'UNKNOW'
            END AS WorkLifeBalance
    FROM
        employee_survey_data) AS WorkLifeBalance
GROUP BY WorkLifeBalance;


-------------------------- Attrition Analysis -----------------------

-- 1) Calculate the overall attrition rate (percentage of employees who left the company).
SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data;

-- 2) Determine attrition rate by: Department, Job Role, Gender, Marital Status, Age Group.
-- Attrition Rate by Department
SELECT 
    Department,
    COUNT(EmployeeID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data
GROUP BY Department
ORDER BY Attrition_Percentage DESC;

-- Attrition Rate by Job Role
SELECT 
    JobRole,
    COUNT(EmployeeID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data
GROUP BY JobRole
ORDER BY Attrition_Percentage DESC;

-- Attrition Rate by Gender
SELECT 
    Gender,
    COUNT(EmployeeID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data
GROUP BY Gender
ORDER BY Attrition_Percentage DESC;

-- Attrition Rate by Marital Status
SELECT 
    MaritalStatus,
    COUNT(EmployeeID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data
GROUP BY MaritalStatus
ORDER BY Attrition_Percentage DESC;

-- Attrition Rate by Age Group
SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 28 THEN '18-28'
        WHEN Age BETWEEN 29 AND 37 THEN '29-37'
        WHEN Age BETWEEN 38 AND 47 THEN '38-47'
        WHEN Age BETWEEN 48 AND 57 THEN '48-57'
        ELSE '58+'
    END AS Age_Group,
    COUNT(EmployeeID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID)) * 100, 2
    ) AS Attrition_Percentage
FROM general_data
GROUP BY Age_Group
ORDER BY Attrition_Percentage DESC;

-- 3) Identify key factors affecting attrition (e.g., high attrition in a department with low job satisfaction).
SELECT 
    g.Department,
    COUNT(g.EmployeeID) AS Total_Employees,
    SUM(CASE WHEN g.Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN g.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(g.EmployeeID)) * 100, 2
    ) AS Attrition_Percentage,
    ROUND(AVG(e.JobSatisfaction), 2) AS Avg_JobSatisfaction
FROM general_data g
JOIN employee_survey_data e ON g.EmployeeID = e.EmployeeID
GROUP BY g.Department
ORDER BY Attrition_Percentage DESC;


-------------- Salary & Compensation Insights --------------

-- 1) Find the average, minimum, and maximum Monthly Income.
SELECT 
    ROUND(AVG(MonthlyIncome), 2) AS Average_Income,
    MIN(MonthlyIncome) AS Minimum_Income,
    MAX(MonthlyIncome) AS Maximum_Income
FROM general_data;

-- 2) Compare income levels between employees who left vs. those who stayed.
SELECT 
    Attrition,
    COUNT(EmployeeID) AS Total_Employees,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Income,
    MIN(MonthlyIncome) AS Minimum_Income,
    MAX(MonthlyIncome) AS Maximum_Income
FROM general_data
GROUP BY Attrition;


----------------- Manager Feedback --------------------

-- 7) Find the average Job Involvement and Performance Rating scores of each Department.
SELECT 
    general_data.Department,
    AVG(manager_survey_data.JobInvolvement) AS Avg_JobInvolvement,
    AVG(manager_survey_data.PerformanceRating) AS Avg_PerformanceRating
FROM
    general_data
        JOIN
    manager_survey_data ON general_data.EmployeeID = manager_survey_data.EmployeeID
GROUP BY general_data.Department
ORDER BY Avg_JobInvolvement DESC;
 
 -- 8) Identify departments where performance is consistently below average
SELECT 
    general_data.Department,
    AVG(manager_survey_data.PerformanceRating)
FROM
    general_data
        JOIN
    manager_survey_data ON general_data.EmployeeID = manager_survey_data.EmployeeID
GROUP BY Department
HAVING AVG(manager_survey_data.PerformanceRating) < (SELECT 
        AVG(PerformanceRating)
    FROM
        manager_survey_data);
        

-------------------------- Cross-Analysis & Correlation Insights -------------------

-- 9) Examine whether low environment satisfaction is correlated with higher attrition.
SELECT 
    employee_survey_data.JobSatisfaction,
    COUNT(CASE
        WHEN general_data.Attrition = 'Yes' THEN 1
    END) AS Total_Attrition,
    COUNT(general_data.EmployeeID) AS Total_Employees,
    ROUND(COUNT(CASE
                WHEN general_data.Attrition = 'Yes' THEN 1
            END) / COUNT(general_data.EmployeeID) * 100,2) AS Attrition_Percentage
FROM
    general_data
        JOIN
    employee_survey_data ON general_data.EmployeeID = employee_survey_data.EmployeeID
GROUP BY employee_survey_data.JobSatisfaction
ORDER BY Attrition_Percentage DESC;

-- 10) Analyze if employees with poor work-life balance ratings leave more frequently.
SELECT 
    employee_survey_data.WorkLifeBalance,
    COUNT(general_data.EmployeeID) AS Total_Employees,
    SUM(CASE WHEN general_data.Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100.0 * SUM(CASE WHEN general_data.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(general_data.EmployeeID),2) AS Attrition_Percentage
FROM general_data 
        JOIN
    employee_survey_data  ON general_data.EmployeeID = employee_survey_data.EmployeeID
GROUP BY employee_survey_data.WorkLifeBalance
ORDER BY employee_survey_data.WorkLifeBalance;

-- 11) Investigate whether higher income reduces attrition risk.
SELECT Attrition,
       COUNT(EmployeeID) AS Total_Employees,
       ROUND(AVG(MonthlyIncome),2) AS Avg_MonthlyIncome
FROM general_data
GROUP BY Attrition;

-- 12) Identify which departments have the most satisfied and best-performing employees.
SELECT 
    general_data.Department,
    SUM(CASE WHEN employee_survey_data.JobSatisfaction = 4 THEN 1 ELSE 0 END) AS HighlySatisfiedCount,
    SUM(CASE WHEN manager_survey_data.PerformanceRating = 4 THEN 1 ELSE 0 END) AS HighPerformerCount
FROM 
    general_data 
JOIN 
    employee_survey_data ON general_data.EmployeeID = employee_survey_data.EmployeeID
JOIN 
    manager_survey_data ON general_data.EmployeeID = manager_survey_data.EmployeeID
GROUP BY 
    general_data.Department
HAVING 
    HighlySatisfiedCount > 0 AND HighPerformerCount > 0;
    
    -------------------------------------END------------------------------

