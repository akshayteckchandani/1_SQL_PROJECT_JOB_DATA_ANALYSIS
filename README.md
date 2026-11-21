# Introduction
This project explores the Data Analyst job market using SQL to identify the highest-paying job opportunities, the most in-demand skills, and the skills that offer the best combination of demand and salary.

The objective is to gain insights into the job market and identify the skills worth prioritising for a career in Data Analytics.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
As someone transitioning into Data Analytics, I wanted to understand what employers look for in Data Analyst candidates and which skills can lead to better career opportunities.

I used SQL to explore job postings, analyse salary trends, and identify the technical skills that are most valuable in the job market.

# The questions that I wanted to answer through my SQL queries were:

1. What are the top paying data analyst jobs?
2. What skills are required for the highest paying data analyst jobs?
3. What are the most in-demand skills for Data Analytics?
4. Which skills offer the highest average salaries?
5. What are the most optimal skills to learn based on demand and salary?

# Tools I used

For my comprehensive analysis of the data analysis job market, I utilized the power of several key tools:

- **SQL:** The backbone of my analysis,allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen DBMS, ideal for handling the job posting data
- **Visual Studio Code:** Used as my development environment to write and execute SQL queries.
- **Git & GitHub:** Used for version control and project documentation.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market.
Here's how i approached each question:

### 1. Top Paying Data Analyst Job

To identify the highest paying roles, I filtered data analyst positions by location, focusing on remote jobs and sorted by average salary and also made sure that no rows with NULL values are selected.
This query highlights the high paying opportunities in the field.

```sql
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
```
Here is the breakdown of the top data analyst jobs in 2023:
1. **Exceptional salary outlier:** Mantys offers $650,000, significantly higher than the second-highest listing at Meta ($336,500). This could be an outlier and should be investigated before drawing conclusions.

2. **Leadership roles command higher salaries:** Director-level positions at Meta ($336,500), AT&T ($255,830) and A-Line Staffing ($170,000) feature prominently, highlighting the earning potential of senior analytics positions.

3. **Specialisation offers strong earning potential:** Roles in marketing analytics, financial analytics, enterprise analytics and data intelligence appear among the highest-paying listings.

4. **Principal and senior positions dominate:** Several Principal Data Analyst positions at SmartAsset, Motional and other organisations offer salaries exceeding $180,000, indicating the value of advanced experience and expertise.

5. **Full-time employment dominates:** 19 out of 20 listings are full-time, with only one contractor position, suggesting that full-time employment is prevalent among these high-paying opportunities.

![Annual average salaries grouped by no. of listings](assets\1_listings_to_avg_salary.png)

*The bar graph visualizes the no. of job listings in each average salary bracket for data analysts; ChatGPT generated this graph from my sql query results*

### 2. Skills Required For Top Paying Jobs
To find what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high paying roles.

```sql
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
```
Key insights
1. **SQL and Python dominate:** Both appear in 13 out of 16 job listings (81.3%), making them the most consistently required technical skills.

2. **Visualisation is important:** Tableau appears in 10 listings (62.5%), significantly ahead of Power BI (18.8%), indicating strong demand for Tableau in this sample.

3. **Statistical skills remain relevant:** R appears in 7 listings (43.8%), highlighting the importance of statistical computing alongside Python.

4. **Cloud and big data technologies:** Azure (5), AWS (4), Snowflake (4), and Databricks (3) demonstrate the relevance of cloud platforms and modern data infrastructure.

5. **Python ecosystem:** Pandas (4), NumPy (2), PySpark (2), and Jupyter (1) indicate demand for Python-based data manipulation and processing tools.

| Skill | Job Listings | Percentage |
|---|---:|---:|
| SQL | 13 | 81.3% |
| Python | 13 | 81.3% |
| Tableau | 10 | 62.5% |
| R | 7 | 43.8% |
| Azure | 5 | 31.3% |
| Excel | 5 | 31.3% |
| AWS | 4 | 25% |
| Pandas | 4 | 25% |
| Go | 4 | 25% |
| Snowflake | 4 | 25% |

*Percentages are calculated using 16 unique job listings.

### 3. In-demand Skills for Data Analysts
Here, I have tried to find the top 5 skills for remote Data Analysts roles.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

```
Key insights:

The top 5 skills for a data analyst role are;

|  skills  |  demand count|
|  ---     |  ----|
|  sql  |  7291|
|  excel  |  4611|
|  python  |  4330|
|tableau  |  3745|
|power bi  |  2609|

**The demand count in this table is based on all the remote data analyst job postings.*

### 4. Top paying skills
This query helped associate average salary to different skills and identify the skills that are high paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM 
    job_postings_fact

LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;
```
Here's a breakdown of the results for top paying skills for Data Analysts.
1.  **PySpark Dominates Salary Rankings:** At about $208K, it pays roughly $19K more than the next skill, Bitbucket ($189K). Big-data processing is the most valuable skill here.

2. **Engineering Skills Boost Analyst Pay:** Bitbucket, GitLab, Kubernetes, Jenkins and Linux all appear in the top 25. Analysts who can use version control and deployment tools earn more.

3. **Python Libraries Are Solid Foundations:** Jupyter, Pandas and NumPy sit between $144K and $153K, and scikit-learn is at about $126K. Python is a dependable core skill, though not the top earner.

4. **Niche Tools May Be Skewed:** Couchbase and Watson share the same salary ($160.5K), and Swift and Golang are unusual for analytics. Check the job counts behind these averages before relying on them.

5. **SQL, Excel, Python, Tableau, Power BI missing:** These were the top 5 in-demand skills. These skills are missing most likely because they are so common, that their average salary gets pulled toward the overall market average

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| pyspark       |            208,172 |
| bitbucket     |            189,155 |
| couchbase     |            160,515 |
| watson        |            160,515 |
| datarobot     |            155,486 |
| gitlab        |            154,500 |
| swift         |            153,750 |
| jupyter       |            152,777 |
| pandas        |            151,821 |
| elasticsearch |            145,000 |
| golang         |            145,000 |
| numpy          |            143,513 |
| databricks     |            141,907 |
| linux          |            136,508 |
| kubernetes     |            132,500 |
| atlassian      |            131,162 |
| twilio         |            127,000 |
| airflow        |            126,103 |
| scikit-learn   |            125,781 |
| jenkins        |            125,436 |
| notion         |            125,000 |
| scala         |            124,903 |
| postgresql    |            123,879 |
| gcp           |            122,500 |
| microstrategy |            121,619 |

**Table showing average salary of the top 25 paying skills for data analysts*

### 5. Most Optimal Skills To Learn
To find the most optimal skills, i have combined queries from 3rd and the 4th question of the analysis. This query aims to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
        job_work_from_home = True AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skills
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
WHERE 
  demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 30;
```
| Rank | Skill | Demand Count | Average Salary (USD) |
|-----:|-------|-------------:|---------------------:|
| 1 | Go | 27 | $115,320 |
| 2 | Confluence | 11 | $114,210 |
| 3 | Hadoop | 22 | $113,193 |
| 4 | Snowflake | 37 | $112,948 |
| 5 | Azure | 34 | $111,225 |
| 6 | BigQuery | 13 | $109,654 |
| 7 | AWS | 32 | $108,317 |
| 8 | Java | 17 | $106,906 |
| 9 | SSIS | 12 | $106,683 |
| 10 | Jira | 20 | $104,918 |
| 11 | Oracle | 37 | $104,534 |
| 12 | Looker | 49 | $103,795 |
| 13 | NoSQL | 13 | $101,414 |
| 14 | Python | 236 | $101,397 |
| 15 | R | 148 | $100,499 |
| 16 | Redshift | 16 | $99,936 |
| 17 | Qlik | 13 | $99,631 |
| 18 | Tableau | 230 | $99,288 |
| 19 | SSRS | 14 | $99,171 |
| 20 | Spark | 13 | $99,077 |
| 21 | C++ | 11 | $98,958 |
| 22 | SAS | 126 | $98,902 |
| 23 | SQL Server | 35 | $97,786 |
| 24 | JavaScript | 20 | $97,587 |
| 25 | Power BI | 110 | $97,431 |
| 26 | SQL | 398 | $97,237 |
| 27 | Flow | 28 | $97,200 |
| 28 | Alteryx | 17 | $94,145 |
| 29 | SPSS | 24 | $92,170 |
| 30 | Outlook | 13 | $90,077 |

**Table of the most optimal skills for data analysts sorted by salary.*

Here's a breakdown of the most optimal skills for Data Analysts in 2023.
1. **Pay rises as demand falls.** SQL has the most postings (398) at $97K, while the top earners (Go, Confluence, Hadoop, Snowflake) all have under 40 postings and pay $113–115K.
2. **Cloud skills carry the clearest premium.** Snowflake ($113K), Azure ($111K), BigQuery ($110K) and AWS ($108K) pay about 10–16% more than SQL.
3. **SQL, Python and Tableau are the entry ticket.** They are the most in demand but pay only $97–101K, so they get you interviews more than they raise your pay.
4. **Looker pays more than Tableau or Power BI.** It earns $103.8K vs $99.3K and $97.4K, but has far fewer postings (49 vs 230 and 110).
5. **Legacy and niche tools pay least.** SPSS ($92K), Alteryx ($94K) and Outlook ($90K) sit at the bottom, and the overall spread is only about $25K, so no single skill is a game-changer.

### 6. Re-writing Query 5
While writing the query for the most optimal skills, I realized that it was not the most efficient approach and that a more concise, less redundant version was possible.

So here I have written a different query that gives the same result as the 5th query but is more efficient.

```sql
SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg)) AS average_salary

FROM
    job_postings_fact

INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL

GROUP BY
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 30;
```
**This query gives the same result as the 5th query.*

# What I learned

This project improved my SQL skills in several practical ways:

- **Building complex queries step by step.** I learned to combine joins, filters, and calculations in multi-step queries, and to split them into clear, readable parts instead of one tangled statement.
- **Organizing logic with CTEs.** I now understand how Common Table Expressions keep queries easier to read, debug, and reuse, especially compared with deeply nested subqueries.
- **Summarizing data accurately.** I have a firm grasp of `GROUP BY` and `HAVING`, including how grouping changes the level of the data and when to filter individual rows (`WHERE`) versus whole groups (`HAVING`).
- **Turning questions into actionable insights.** I practiced converting open-ended business questions into precise queries and then into results that people could act on.

# Conclusions
**Insights:**

The analysis surfaced several key takeaways:

1. **Highest-Paying Data Analyst Roles:** Among remote-friendly data analyst jobs, salaries vary widely, with the top offer reaching $650,000.
2. **Skills Behind the Top Salaries:** The best-paying roles call for strong SQL proficiency, which points to it being essential for earning a high salary.
3. **Most Requested Skills:** SQL also appears in more job postings than any other skill, making it a must-have for anyone job hunting.
4. **Skills Linked to Higher Pay:** Niche skills such as SVN and Solidity come with the highest average salaries, showing that specialized expertise earns a premium.
5. **Best Skills for Market Value:** SQL combines the highest demand with a strong average salary, making it one of the smartest skills for analysts to learn if they want to maximize their market value.

**Closing Thoughts:**

Working on this project sharpened my SQL abilities and gave me a clearer picture of the data analyst job market. The results can help guide which skills to learn first and where to focus a job search. By concentrating on skills that are both in high demand and well paid, aspiring analysts can stand out in a crowded market. The project also shows why it's important to keep learning and to adapt as new trends emerge in data analytics.
