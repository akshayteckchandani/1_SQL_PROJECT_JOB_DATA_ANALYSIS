/*
Question: What are the most optimal skills to learn (it's in high demand and high paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analysts Role.
- Concentrates on remote postions with specifies salaries.
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
        offfernig strategic insights for career development in data analysis.
*/

WITH skills_in_demand AS (
    SELECT
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skills
    HAVING
        COUNT(skills_job_dim.job_id) > 10
),

average_salary AS (
    SELECT 
        skills,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM 
        job_postings_fact

    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skills
)

SELECT 
    skills_in_demand.skills,
    demand_count,
    average_salary.average_salary
FROM 
    skills_in_demand
INNER JOIN average_salary ON average_salary.skills = skills_in_demand.skills

ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 30;

/*
Data Insights: 
- SQL (398), Python (236), and Tableau (230) lead in demand, making them essential skills for Data 
  Analyst roles.
- Go ($115,320), Confluence ($114,210), and Hadoop ($113,193) offer the highest average salaries among 
  the listed skills.
- Cloud and BI technologies such as Snowflake, Azure, AWS, Power BI, and Tableau combine strong market 
  demand with competitive salaries.
- Overall Takeaway: Prioritize SQL, Python, and BI tools to build a strong analytics foundation, then 
  expand into cloud and big data technologies to unlock higher-paying opportunities.

OUTPUT:
=======

[
  {
    "skills": "go",
    "demand_count": "27",
    "average_salary": "115320"
  },
  {
    "skills": "confluence",
    "demand_count": "11",
    "average_salary": "114210"
  },
  {
    "skills": "hadoop",
    "demand_count": "22",
    "average_salary": "113193"
  },
  {
    "skills": "snowflake",
    "demand_count": "37",
    "average_salary": "112948"
  },
  {
    "skills": "azure",
    "demand_count": "34",
    "average_salary": "111225"
  },
  {
    "skills": "bigquery",
    "demand_count": "13",
    "average_salary": "109654"
  },
  {
    "skills": "aws",
    "demand_count": "32",
    "average_salary": "108317"
  },
  {
    "skills": "java",
    "demand_count": "17",
    "average_salary": "106906"
  },
  {
    "skills": "ssis",
    "demand_count": "12",
    "average_salary": "106683"
  },
  {
    "skills": "jira",
    "demand_count": "20",
    "average_salary": "104918"
  },
  {
    "skills": "oracle",
    "demand_count": "37",
    "average_salary": "104534"
  },
  {
    "skills": "looker",
    "demand_count": "49",
    "average_salary": "103795"
  },
  {
    "skills": "nosql",
    "demand_count": "13",
    "average_salary": "101414"
  },
  {
    "skills": "python",
    "demand_count": "236",
    "average_salary": "101397"
  },
  {
    "skills": "r",
    "demand_count": "148",
    "average_salary": "100499"
  },
  {
    "skills": "redshift",
    "demand_count": "16",
    "average_salary": "99936"
  },
  {
    "skills": "qlik",
    "demand_count": "13",
    "average_salary": "99631"
  },
  {
    "skills": "tableau",
    "demand_count": "230",
    "average_salary": "99288"
  },
  {
    "skills": "ssrs",
    "demand_count": "14",
    "average_salary": "99171"
  },
  {
    "skills": "spark",
    "demand_count": "13",
    "average_salary": "99077"
  },
  {
    "skills": "c++",
    "demand_count": "11",
    "average_salary": "98958"
  },
  {
    "skills": "sas",
    "demand_count": "126",
    "average_salary": "98902"
  },
  {
    "skills": "sql server",
    "demand_count": "35",
    "average_salary": "97786"
  },
  {
    "skills": "javascript",
    "demand_count": "20",
    "average_salary": "97587"
  },
  {
    "skills": "power bi",
    "demand_count": "110",
    "average_salary": "97431"
  },
  {
    "skills": "sql",
    "demand_count": "398",
    "average_salary": "97237"
  },
  {
    "skills": "flow",
    "demand_count": "28",
    "average_salary": "97200"
  },
  {
    "skills": "alteryx",
    "demand_count": "17",
    "average_salary": "94145"
  },
  {
    "skills": "spss",
    "demand_count": "24",
    "average_salary": "92170"
  },
  {
    "skills": "outlook",
    "demand_count": "13",
    "average_salary": "90077"
  }
]
*/