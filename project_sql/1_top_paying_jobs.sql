/*
Questions: What are the top-paying Data Analyst remote jobs in 2023?
- Identify the top 20 highest paying Data Analyst roles that are available remotely.
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
    job_work_from_home = True AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;

/*
Key Insights – Top-Paying Data Analyst Remote Jobs (2023)

1. Exceptional salary outlier: Mantys offers $650,000, significantly higher than the second-highest listing at Meta ($336,500). 
   This could be an outlier and should be investigated before drawing conclusions.

2. Leadership roles command higher salaries: Director-level positions at Meta ($336,500), AT&T ($255,830) and A-Line Staffing ($170,000) 
   feature prominently, highlighting the earning potential of senior analytics positions.

3. Specialisation offers strong earning potential: Roles in marketing analytics, financial analytics, enterprise analytics and data intelligence 
   appear among the highest-paying listings.

4. Principal and senior positions dominate: Several Principal Data Analyst positions at SmartAsset, Motional and other organisations offer 
   salaries exceeding $180,000, indicating the value of advanced experience and expertise.

5. Full-time employment dominates: 19 out of 20 listings are full-time, with only one contractor position, suggesting that full-time 
   employment is prevalent among these high-paying opportunities.

Overall takeaway: Seniority, domain expertise, and specialisation in finance, business intelligence, and healthcare 
appear to be key factors associated with higher-paying data analyst opportunities.

Output:
========
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-10-06"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "company_name": "A-Line Staffing Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08"
  },
  {
    "job_id": 1799883,
    "job_title": "Principal Data Science Analyst- Remote",
    "company_name": "Mayo Clinic",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "164746.0",
    "job_posted_date": "2023-04-14"
  },
  {
    "job_id": 1423236,
    "job_title": "Principal Data Science Analyst- Remote",
    "company_name": "Mayo Clinic",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "164746.0",
    "job_posted_date": "2023-01-13"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "company_name": "CEDARS-SINAI",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14"
  }
]
*/