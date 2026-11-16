/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to skills table similar to query 2.
- Identify the top 5 in demand skills for data analysts.
- Focus on all job postings.
- Why? Retreives the top 5 skills with the highest demand in the job market,
* provides insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Key insights: 
The demand_count column reveals the number of job postings that require each skill.

The top 5 skills for a data analyst role are;
- SQL
- Excel
- Python
- Tableau
- Power BI
This exercise provides the most in-demand skills for data analysts from all the job postings and not
just the top paying jobs.   


OUTPUT:
=======
[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/