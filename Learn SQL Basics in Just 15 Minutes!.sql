-- Data preview
SELECT * FROM billionaires;

-- Show their name and net worth
SELECT personName,finalWorth FROM billionaires;

-- Show all unique countries
SELECT DISTINCT country FROM billionaires;

-- Show count of unique countries
SELECT COUNT(DISTINCT country) FROM billionaires;

-- Show count of unique people
SELECT COUNT(DISTINCT personName) FROM billionaires;

-- Show average net worth of the list
SELECT AVG(finalWorth) FROM billionaires;

-- List the richest people in France
SELECT * FROM billionaires
WHERE country = 'france';

-- List the richest people in France but not in Paris
SELECT * FROM billionaires
WHERE country = 'france' AND city <> 'paris';

-- List the richest people in France or Spain
SELECT * FROM billionaires
WHERE country = 'france' or country = 'spain';

-- List the richest people in France, Spain, and Italy
SELECT * FROM billionaires
WHERE country IN('france','spain','italy');

-- Count how many are selfMade
SELECT COUNT(personname) FROM billionaires
WHERE selfMade = 'true';

-- Find the top 10 billionaires by industry in descending order
SELECT industries,COUNT(personname) AS billionare_count FROM billionaires
GROUP BY industries
ORDER BY COUNT(personname) DESC
LIMIT 10;

-- Find the number of billionaires by birthmonth
SELECT birthmonth,COUNT(personname) FROM billionaires
GROUP BY birthmonth
ORDER BY COUNT(personname) DESC;