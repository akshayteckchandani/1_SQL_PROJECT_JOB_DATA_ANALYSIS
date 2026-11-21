/*
Question: What skills are required for the top paying data analysts jobs?
- Use the high paying Data Analyst jobs from the first query
- Add specific skills required for these roles
- Why? It provides a detailed look at which high paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20
)

SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;


/*
Key insights:
1. SQL and Python dominate: Both appear in 13 out of 16 job listings (81.3%), making them the most consistently required technical skills.

2. Visualisation is important: Tableau appears in 10 listings (62.5%), significantly ahead of Power BI (18.8%), indicating strong demand 
   for Tableau in this sample.

3. Statistical skills remain relevant: R appears in 7 listings (43.8%), highlighting the importance of statistical computing alongside Python.

4. Cloud and big data technologies: Azure (5), AWS (4), Snowflake (4), and Databricks (3) demonstrate the relevance of cloud platforms 
   and modern data infrastructure.

5. Python ecosystem: Pandas (4), NumPy (2), PySpark (2), and Jupyter (1) indicate demand for Python-based data manipulation and processing 
   tools.


OUTPUT:
=======
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "r"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-10-06",
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-10-06",
    "skills": "go"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-10-06",
    "skills": "excel"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "company_name": "A-Line Staffing Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-08-09",
    "skills": "sql"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "company_name": "A-Line Staffing Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-08-09",
    "skills": "python"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "company_name": "A-Line Staffing Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-08-09",
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23",
    "skills": "sql"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23",
    "skills": "python"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23",
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23",
    "skills": "databricks"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23",
    "skills": "power bi"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "swift"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14",
    "skills": "sas"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08",
    "skills": "aws"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20",
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20",
    "skills": "go"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20",
    "skills": "crystal"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20",
    "skills": "tableau"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20",
    "skills": "sas"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "databricks"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "aws"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14",
    "skills": "visio"
  }
]

*/