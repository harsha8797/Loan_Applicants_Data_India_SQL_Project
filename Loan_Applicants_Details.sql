CREATE DATABASE applicants_details;

CREATE TABLE applicants_details (
    Applicant_ID SERIAL PRIMARY KEY,
    Annual_Income NUMERIC,
    Applicant_Age INTEGER,
    Work_Experience INTEGER,
    Marital_Status VARCHAR(50),
    House_Ownership VARCHAR(50),
    Vehicle_Ownership BOOLEAN,
    Occupation VARCHAR(100),
    Residence_City VARCHAR(100),
    Residence_State VARCHAR(100),
    Years_in_Current_Employment INTEGER,
    Years_in_Current_Residence INTEGER,
    Loan_Default_Risk BOOLEAN
);

SELECT * FROM applicants_details LIMIT 5;


--Descriptive Analysis

-- Distribution by Age
SELECT Applicant_Age, COUNT(*) AS count
FROM applicants_details
GROUP BY Applicant_Age
ORDER BY Applicant_Age;

-- Average Annual Income by Occupation
SELECT Occupation, AVG(Annual_Income) AS avg_income
FROM applicants_details
GROUP BY Occupation
ORDER BY avg_income DESC;

-- Average Income across Age Groups
SELECT
  CASE
    WHEN Applicant_Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Applicant_Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Applicant_Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Applicant_Age BETWEEN 46 AND 55 THEN '46-55'
    WHEN Applicant_Age > 55 THEN '>55'
  END AS age_group,
  AVG(Annual_Income) AS avg_income
FROM applicants_details
GROUP BY age_group
ORDER BY age_group;

-- Exploratory Data Analysis
-- Risk Assessment by Occupation

SELECT Occupation, AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY Occupation
ORDER BY default_risk_ratio DESC;


--Loan Default Risk by Age group

SELECT
  CASE
    WHEN Applicant_Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Applicant_Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Applicant_Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Applicant_Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '55+'
  END AS age_group,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY age_group
ORDER BY age_group;

--Income V/s Loan default risk

SELECT
  CASE
    WHEN Annual_Income <= 500000 THEN '<= 5 Lakhs'
    WHEN Annual_Income > 500000 AND Annual_Income <= 1000000 THEN '5-10 Lakhs'
    WHEN Annual_Income > 1000000 AND Annual_Income <= 1500000 THEN '10-15 Lakhs'
    ELSE '> 15 Lakhs'
  END AS income_bracket,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY income_bracket
ORDER BY income_bracket;

--Work experience and loan approval rates

SELECT
  CASE
    WHEN Work_Experience <= 5 THEN '0-5 years'
    WHEN Work_Experience > 5 AND Work_Experience <= 10 THEN '6-10 years'
    ELSE '> 10 years'
  END AS experience_range,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY experience_range
ORDER BY experience_range;

--Impact of Marital Status on Loan Default Risk

SELECT
  Marital_Status,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY Marital_Status;

--House and Vehicle Ownership Impact on Loan Default Risk

SELECT
  House_Ownership,
  Vehicle_Ownership,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY House_Ownership, Vehicle_Ownership;

--Geographic Distribution of Loan Default Risk

-- By State
SELECT
  Residence_State,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY Residence_State
ORDER BY default_risk_ratio DESC;

-- By City
SELECT
  Residence_City,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY Residence_City
ORDER BY default_risk_ratio DESC
LIMIT 10; 

--Correlation Between Years in Current Employment/Residence and Loan Default Risk

SELECT
  CASE
    WHEN Years_in_Current_Employment <= 2 THEN '0-2 years'
    WHEN Years_in_Current_Employment > 2 AND Years_in_Current_Employment <= 5 THEN '3-5 years'
    ELSE '> 5 years'
  END AS employment_duration,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY employment_duration;

SELECT
  CASE
    WHEN Years_in_Current_Residence <= 2 THEN '0-2 years'
    WHEN Years_in_Current_Residence > 2 AND Years_in_Current_Residence <= 5 THEN '3-5 years'
    ELSE '> 5 years'
  END AS residence_duration,
  AVG(Loan_Default_Risk::int) AS default_risk_ratio
FROM applicants_details
GROUP BY residence_duration;





