CREATE DATABASE sql_course;

-- DROP DATABASE IF EXISTS sql_course;


SELECT COUNT(*) FROM company_dim;
SELECT COUNT(*) FROM skills_dim;
SELECT COUNT(*) FROM job_postings_fact;
SELECT COUNT(*) FROM skills_job_dim;

SELECT * FROM job_postings_fact
LIMIT 100;

SELECT * FROM company_dim
LIMIT 100;