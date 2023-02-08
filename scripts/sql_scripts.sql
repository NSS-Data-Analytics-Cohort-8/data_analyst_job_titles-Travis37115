-- 1.How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs
--Answer 1793

-- 2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company
FROM data_analyst_jobs
LIMIT 10;
--Answer ExxonMobil

-- 3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT location
FROM data_analyst_jobs
WHERE (location = 'TN')
OR (location = 'KY');
--Answer TN has 21 postings and KY has 6 for a total of 27 postings

-- 4.How many postings in Tennessee have a star rating above 4?
SELECT star_rating
FROM data_analyst_jobs
WHERE (star_rating > 4.0);
--Answer There are 416 ratings that are above 4 stars.

-- 5.How many postings in the dataset have a review count between 500 and 1000?
SELECT review_count
FROM data_analyst_jobs
WHERE (review_count BETWEEN 500 AND 1000);
--Answer there are 151 postings that have a review count between 500 and 1000

-- 6.Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--Answer NE shows the highest rating at 4.19

-- 7.Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;
--Answer there are 881 unique job titles

-- 8.How many unique job titles are there for California companies?
SELECT DISTINCT title, location
FROM data_analyst_jobs
WHERE location = 'CA';
--Answer Cali has 230 unique job titles for companies

-- 9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT DISTINCT company, review_count,
AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count;
--Answer 46 companies have more than 5000 reviews across all locations.

-- 10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT DISTINCT company, review_count, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
ORDER BY star_rating DESC;
--Answer AMEX has the highest rating at 4.19 with more than 5000 reviews.

-- 11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';
--Answer There are 754 titles with the word Analyst in it.

-- 12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT LIKE '%Analytics%';
--Answer There are only 4 titles and they all contain Tableau visualization software.

--BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
SELECT COUNT(domain) AS hard_to_fill, title, company, skill, days_since_posting
FROM data_analyst_jobs
WHERE domain IS NOT NULL 
AND title LIKE '%SQL%'
AND skill LIKE '%SQL%'
AND (days_since_posting >= 21)
GROUP BY domain, title, company, skill, days_since_posting;	
--Answer 7 jobs listed that require SQL

--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?