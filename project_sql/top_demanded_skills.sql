/*
Question: What are the most in-demand skills for data analysts?
    -Joining job postings to inner join table similar to query 2
    -Identifying the top 5 in-demand skills for a data analyst.
    -Focusing on all job postings.
    -Why? Retrieves the top 5 skills with the highest demand in the job market,
     providing insights into the most valuable skills for job seekers.
*/
SELECT 
    skills,
    count(skills_job_dim.job_id) as demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short='Data Analyst'
GROUP BY skills
ORDER BY demand DESC
limit 5