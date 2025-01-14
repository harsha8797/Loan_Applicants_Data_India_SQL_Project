Loan Applicants in India Data Analysis Project Using SQL

Overview
This project focuses on analyzing loan applicant data to uncover insights into factors affecting loan approval rates and default risks. Utilizing PostgreSQL for data storage and manipulation, and pgAdmin for executing and managing SQL queries, we aim to provide a comprehensive analysis of various attributes of loan applicants in India. The insights derived from this project are intended to assist in making informed decisions regarding loan eligibility assessments.

Dataset Description
The dataset contains detailed information about loan applicants, including demographics, financial status, and loan default risks. 

Key attributes include:

Applicant_ID: Unique identifier for each loan applicant.

Annual_Income: The annual income of the applicant.

Applicant_Age: Age of the applicant.

Work_Experience: Number of years of work experience.

Marital_Status, House_Ownership, Vehicle_Ownership: Marital status, house, and vehicle ownership status.

Occupation, Residence_City, Residence_State: Professional and residential information.

Loan_Default_Risk: Indicator of the risk of defaulting on the loan.

SQL Queries

This project includes a series of SQL queries designed to perform a deep dive into the dataset, addressing various analytical objectives:

Demographic Analysis: Analyze applicant demographics to understand the distribution across different categories.

Income Analysis: Explore the relationship between applicants' incomes, occupations, and loan default risks.

Ownership Status: Assess the impact of house and vehicle ownership on loan default risks.

Geographic Insights: Identify geographic patterns related to loan applications and default risks.

Outputs:
For each SQL query, outputs are provided in CSV format, showcasing the results of the analysis. These outputs serve as the basis for further discussion and decision-making processes.

Usage

To replicate this analysis:

Set up your PostgreSQL environment: Ensure PostgreSQL is installed and running on your machine. Create a new database named loan_applicants_db.

Import the dataset: Use pgAdmin's import functionality or the provided SQL \copy command to import Applicant-details.csv into your database.

Execute SQL queries: Open each SQL query file in pgAdmin's Query Tool and execute them to analyze the dataset.

Review outputs: Check the CSV outputs for analysis results. These files are generated by exporting query results from pgAdmin.



