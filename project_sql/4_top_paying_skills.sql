/*
Question: What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions. 
- Focuses on roles with specified salaries, regardless of location.
-Why? It reveals how different skills impact salary levels for Data Analysts and helps identify 
the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL AND 
job_work_from_home = True 
GROUP BY 
skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
Here is the breakdown of the results for Top-paying skills
 for Data Analysts based on the average salary:
1. High demand for Big data and engineering skills
PySpark sits alone at the top, and Databricks, Airflow, Scala, and Kubernetes all appear.
 The highest-paying analyst jobs lean toward analytics engineering: 
 building pipelines and working with large datasets, not just querying and reporting.
2. The Python data stack is a strong middle tier
Jupyter, Pandas, NumPy, and Scikit-learn all. Python is a baseline for well-paid analysts,
 and scikit-learn hints at a premium for analysts who can do some machine learning.
3. Software-engineering practices carry a premium
Bitbucket, GitLab, Jenkins, Linux, and Kubernetes all rank high. Analysts who work with version control,
 CI/CD, and deployment look more like engineers, and employers pay for that. Atlassian tools and Notion show up too, 
 suggesting collaborative, team-based environments.
4. Programming languages beyond Python and R
Swift, Golang, and Scala are all in the top 25. These are likely hybrid roles (data plus software or product engineering), 
which tend to pay more than pure analyst positions.
5. Notably absent: the usual analyst tools
SQL, Excel, Tableau, and Power BI don’t appear. They’re probably so common that they don’t differentiate pay.
 The top-paying skills are the add-ons to them. The one traditional BI tool present, MicroStrategy, ranks last.
6. Platform and database niches
Couchbase, Elasticsearch, PostgreSQL, and GCP point to demand for analysts comfortable with NoSQL, search, and cloud data platforms.

Here [
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619"
  }
]

*/