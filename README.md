# HR Analytics Project Using MySQL

## 📌 Project Overview

This project focuses on performing **HR analytics** using SQL to uncover insights from employee-related data, aiming to improve engagement, retention, satisfaction, and organizational performance. SQL queries were developed to explore trends in demographics, compensation, satisfaction, attrition, and performance.

---

## 🎯 Objectives

1. Analyze employee demographics, job roles, and salary distribution.
2. Evaluate job satisfaction and work-life balance using survey data.
3. Identify key attrition factors and calculate turnover rates.
4. Assess employee performance and involvement based on manager feedback.
5. Provide data-driven HR recommendations to reduce attrition and boost satisfaction.

---

## 🗂️ Datasets

Three CSV files were used to create a relational database:

| Table Name             | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `general_data`         | Employee demographics, job details, salary, attrition status, etc.          |
| `employee_survey_data` | Employee satisfaction: job, environment, and work-life balance ratings.     |
| `manager_survey_data`  | Manager feedback on job involvement and performance rating.                 |

> 📌 **Database Name:** `employees_db`  
> 🔗 **Dataset Source:** [Kaggle - Employee Details Dataset](https://www.kaggle.com/datasets/mayanolan/employee-details-dataset)

---

## 🧠 SQL-Based Analytical Plan

### 1. 👥 Employee Demographics & Distribution
- Total employees.
- Distribution by department, job role, gender, education field.
- Age group and marital status analysis.

### 2. 😌 Satisfaction & Work-Life Balance
- Average satisfaction and work-life scores.
- Departments/job roles with lower satisfaction.
- Categorize employees by low/high work-life balance.

### 3. ❌ Attrition Analysis
- Overall attrition rate.
- Attrition by department, job role, gender, marital status, and age group.
- Correlation between satisfaction and attrition.

### 4. 💰 Salary & Compensation Insights
- Average, min, and max income.
- Comparison of income for retained vs. exited employees.

### 5. 📊 Manager Feedback
- Job involvement and performance rating by department.
- Departments with below-average performance.

### 6. 🔁 Cross-Analysis
- Correlation of attrition with job satisfaction, work-life balance, income.
- Departments with high performers and satisfaction levels.

---

## 📋 Key SQL Highlights

- Used **JOINs**, **CASE**, **GROUP BY**, **HAVING**, and **subqueries**.
- SQL file includes over 30 optimized queries for deep analysis.
- Dataset was normalized using `EmployeeID` as the primary key across all tables.

📄 SQL File: [`SQL File.sql`](./SQL%20File.sql)

---

## 📈 Key Insights

- Majority of employees are aged 28–37.
- R&D department has the **highest attrition rate**.
- **Low work-life balance** strongly correlates with attrition.
- **Higher income** and **job satisfaction** reduce turnover.
- **Sales & R&D** house most high performers.

---

## 💡 Recommendations

1. Improve work-life balance initiatives (especially in R&D).
2. Adjust salary structures in high-turnover job roles.
3. Retain employees aged 28–37 with engagement programs.
4. Recognize and promote top performers.

---

## 🧾 Project Files

| File                         | Description                                |
|------------------------------|--------------------------------------------|
| `general_data.csv`           | Base employee data                         |
| `employee_survey_data.csv`   | Employee feedback                          |
| `manager_survey_data.csv`    | Manager evaluations                        |
| `SQL File.sql`               | Full SQL analytical queries                |
| `HR_Analytics_PPT_PFD.pdf`   | Final presentation of findings             |
| `Project_Report.pdf`         | Detailed project documentation             |

---

## 🧑‍💼 Author

**Tejas Phalke**  
📍 Pune, Maharashtra, India  
📧 phalketejas89@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/tejas-phalke)

---

## ✅ Conclusion

This project demonstrates the power of SQL in deriving actionable HR insights from structured data. It supports strategic decision-making in areas like employee retention, satisfaction, and workforce optimization.
