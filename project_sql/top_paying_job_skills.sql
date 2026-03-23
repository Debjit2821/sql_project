/*
question: what skills are required for the top-paying data analyst jobs?
    -using the top 10 highest paying data analyst job from first quesry 
    -adding the specific skills required for these roles
    -why?it provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that allign with top salaries
*/
with top_paying_job as(
SELECT 
    job_id,
    job_title,
    job_schedule_type,
    salary_year_avg,
    name as company
FROM 
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
where
 job_title_short='Data Analyst' AND job_location='Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY
 salary_year_avg DESC                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
LIMIT 10
)
select 
top_paying_job.*,
skills
from top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
