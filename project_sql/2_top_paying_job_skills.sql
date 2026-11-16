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
        salary_year_avg,
        job_posted_date::DATE
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'India' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)

SELECT 
    top_paying_jobs.*,
    skills

FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id


/*
Key insights: 
The skills column reveals some interesting patterns about what employers expect from data analyst roles, 
particularly the combination of technical skills, analytical tools, and business applications.

- SQL and Excel lead demand, appearing in 64.3% of job listings each (9/14 job listings).
- Python ranks third, appearing in 42.9% of listings (6/14 job listings).
- R and Tableau each feature in 21.4% of listings (3/14 job listings).
- Flow appears in 14.3% of listings.
- Power BI, Azure, VBA, and other specialised tools have limited representation in this sample.


OUTPUT:
=======
[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "skills": "flow"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07",
    "skills": "excel"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07",
    "skills": "word"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07",
    "skills": "powerpoint"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02",
    "skills": "sql"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02",
    "skills": "python"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02",
    "skills": "r"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02",
    "skills": "sheets"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08",
    "skills": "sql"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08",
    "skills": "python"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08",
    "skills": "excel"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08",
    "skills": "tableau"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08",
    "skills": "word"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27",
    "skills": "sql"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27",
    "skills": "unix"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27",
    "skills": "windows"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27",
    "skills": "tableau"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14",
    "skills": "python"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14",
    "skills": "tensorflow"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14",
    "skills": "pytorch"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "sql"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "oracle"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "excel"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "word"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "outlook"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22",
    "skills": "flow"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28",
    "skills": "python"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28",
    "skills": "r"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28",
    "skills": "excel"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22",
    "skills": "sql"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22",
    "skills": "python"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-09-01",
    "skills": "sql"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-09-01",
    "skills": "python"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-09-01",
    "skills": "r"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-09-01",
    "skills": "excel"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "sql"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "t-sql"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "vba"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "sql server"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "looker"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12",
    "skills": "ms access"
  },
  {
    "job_id": 671340,
    "job_title": "Business Data Analyst",
    "company_name": "NetApp",
    "salary_year_avg": "54988.0",
    "job_posted_date": "2023-12-16",
    "skills": "tableau"
  },
  {
    "job_id": 1696350,
    "job_title": "Analyst Invoice Processing (Data Operations)",
    "company_name": "BlackRock",
    "salary_year_avg": "32400.0",
    "job_posted_date": "2023-11-23",
    "skills": "excel"
  },
  {
    "job_id": 1696350,
    "job_title": "Analyst Invoice Processing (Data Operations)",
    "company_name": "BlackRock",
    "salary_year_avg": "32400.0",
    "job_posted_date": "2023-11-23",
    "skills": "terminal"
  }
]

*/