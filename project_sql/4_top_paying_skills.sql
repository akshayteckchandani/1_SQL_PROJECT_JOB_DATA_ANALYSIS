/*
Question: What are the top paying skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM 
    job_postings_fact

LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;


/*
Data Insights: 
- PySpark tops the list (~$208K)**, well ahead of everything else. Big-data processing skills are rewarded most.
- Engineering and DevOps tools pay highly.** Bitbucket (~$189K), GitLab (~$155K), Kubernetes (~$133K), Jenkins (~$125K) 
  and Linux (~$137K) show that analysts who can work with code, version control and deployment earn more.
- Core Python libraries are strong.** Pandas (~$152K), NumPy (~$144K), Jupyter (~$153K) and scikit-learn (~$126K) all sit in 
  the upper-middle of the list, so Python is a solid base skill.
- Cloud and data platforms matter.** Databricks (~$142K), Airflow (~$126K), GCP (~$123K) and Scala (~$125K) point to demand for 
  pipeline and cloud skills.
- Niche tools may be skewed.** Couchbase and Watson have identical salaries (~$160.5K), and Swift and Golang are unusual for analytics. 
  This suggests very few job postings behind those averages, so check the job count for each skill before trusting the numbers.
- Takeaway for learning:** build on SQL and Python, then add PySpark, a cloud platform and Git. That path matches the highest-paying 
  skills here.

OUTPUT:
=======

[
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