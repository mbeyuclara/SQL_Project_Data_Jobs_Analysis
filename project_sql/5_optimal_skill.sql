/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that offer job security(high demand) and financial benefits (high salaries), offering strategic insights for career development in Data Analysis.
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
    GROUP BY 
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND 
        job_work_from_home = True 
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 20
ORDER BY 
    average_salary DESC,
    demand_count DESC
LIMIT 25;


/*
Here is the breakdown of the most optimal skills to learn (those that combine high demand with high average salaries).
-Most optimal: Snowflake, Azure, and AWS offer average salaries above $108,000, with demand counts exceeding 30.
-Highest demand: Python (236), Tableau (230), and R (148) are the most frequently demanded skills in your dataset with moderate salary.
-Promising specialization: Cloud technologies and data warehousing are worth exploring because of their relatively high salaries and 
meaningful demand counts.

Breakdown according to category:
1. Programming skills are important.
-Python has a demand count of 236, while R has a demand count of 148.
-These are two of the most frequently demanded skills in the dataset, suggesting that programming and 
statistical analysis are important capabilities for the roles represented.

2. Data visualization remains relevant.
-Tableau has a demand count of 230, placing it among the most frequently demanded skills.
-This suggests that employers value the ability to present data in a clear, understandable format.

3. Cloud and data warehouse technologies are represented strongly.
-Snowflake, Azure, AWS, and Oracle each have demand counts above 30.
-These technologies are relevant to data storage, data infrastructure, and cloud-based analytics.

4. The dataset extends beyond traditional data analyst tools.
-Skills such as Go, Java, C++, and JavaScript are also included. Their presence suggests that the underlying roles may span multiple 
technical occupations rather than only conventional data analyst positions.
*/