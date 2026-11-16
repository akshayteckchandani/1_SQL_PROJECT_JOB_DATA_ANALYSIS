/*
Questions: What are the top-paying Data Analyst jobs in India in 2023?
- Identify the top 10 highest paying Data Analyst roles that are available in India.
- Focuses on job postings with specified salaries (remove NULLS).
- Why? Highlight the top paying opportunities for Data Analysts, offering insights into employment options and location. 
*/

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
    job_location = 'India' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;

/*
Key Insights – Top-Paying Data Analyst Jobs in India (2023)

- Highest-paying role: Senior Business & Data Analyst at Deutsche Bank, offering an average annual salary of $119,250.
- Experience matters: Senior-level analyst positions dominate the top salary brackets, indicating higher earning 
  potential with experience.
- Industry concentration: Banking, finance, healthcare, and pharmaceuticals feature prominently among the 
  highest-paying employers.
- Diverse specialisations: Financial Data Analysis, HR Analytics, Business Intelligence, and Healthcare Research offer 
  lucrative career opportunities.
- Full-time dominance: 13 out of 14 listings are full-time positions, with only one contract-based role.
- Salary disparity: Salaries range from $32,400 to $119,250, highlighting significant differences across roles and 
  specialisations.
- Entry-level opportunity: Associate Data Analyst at Amwell offers $64,600, suggesting that specialised skills can 
  command competitive salaries even at associate levels.

Overall takeaway: Seniority, domain expertise, and specialisation in finance, business intelligence, and healthcare 
appear to be key factors associated with higher-paying data analyst opportunities.

Output:
========

[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22"
  },
  {
    "job_id": 306376,
    "job_title": "Project Associate - Data Analytics (Contract)",
    "company_name": "Array",
    "job_location": "India",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-09-01"
  },
  {
    "job_id": 946307,
    "job_title": "Associate Data Analyst",
    "company_name": "Amwell",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64600.0",
    "job_posted_date": "2023-07-12"
  },
  {
    "job_id": 671340,
    "job_title": "Business Data Analyst",
    "company_name": "NetApp",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "54988.0",
    "job_posted_date": "2023-12-16"
  },
  {
    "job_id": 1696350,
    "job_title": "Analyst Invoice Processing (Data Operations)",
    "company_name": "BlackRock",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "32400.0",
    "job_posted_date": "2023-11-23"
  }
]
*/