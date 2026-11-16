/*
Question: How can you solve the 5th Problem with a more concise and efficient query writing?

*/

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

/*

Key takeaway: 
This exercise shows that there are multiple ways to acheive the desired result.
The approach in this query is better because:
- It is shorter and easier to maintain.
- It avoids redundant CTEs and JOINS.
- It performs both aggregations in a single grouped query.
- It communicates the analytical objective more directly.

*/


