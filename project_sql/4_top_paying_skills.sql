/*Answer: What are the top skills based on salary?
- Look at the aevrage salary associated with each skill for Data Analyst positions.
- Focuses on roles with specific salaries, regaardless of location.
- Why? It reveals how different skills impact salary levels for Data Analyst and 
  helps identify the most financially rewarding skills to acquire or improve.
  */

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    --AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Specialized & Emerging Tech Leads to Higher Salaries – Niche technologies like 
SVN, Solidity, and Couchbase offer premium pay due to limited expertise and high
business impact, particularly in blockchain and database management.

AI & Machine Learning Continue to Dominate – The presence of MXNet, Keras, PyTorch,
and Hugging Face highlights how AI and deep learning skills remain essential for 
industries investing in automation, predictive analytics, and NLP.

Cloud & DevOps Are Driving Modern Infrastructure – Skills like Terraform, VMware,
and Ansible show that cloud computing, automation, and scalable infrastructure
are crucial for businesses, making these skills highly rewarding.
*/