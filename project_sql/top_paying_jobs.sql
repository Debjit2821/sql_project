/*
questions: what are the top paying jobs?
    -Identifying the top 10 highest paying data analyst roles that are available remotely.
    -Focusing on job with specific salaries (remove nulls).
    -Why?Highlight the top paying opportunities for data Analyst,offering insights into job location,date of the job posted and job location.
*/
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
