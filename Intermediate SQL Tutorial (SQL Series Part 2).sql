-- Select countries that start with letter "f"
SELECT * FROM billionaires
WHERE country REGEXP "^f";

-- Select countries that end with letter "a"
SELECT * FROM billionaires
WHERE country REGEXP "a$";

-- List those that start with "f" or "c"
SELECT * FROM billionaires
WHERE country REGEXP '^f|^c';

-- List those that start with "c" but have an "h/o" after that
SELECT * FROM billionaires
WHERE country REGEXP '^c[ho]';

-- Categorize the billionaires by high or low with 10B threshold
SELECT personname,finalworth,
IF(finalworth < 10000,'low','high') AS category
FROM billionaires;

-- Categorize the billionaires by high, medium, or low 
SELECT personname,finalworth,
CASE
    WHEN finalworth <10000 THEN 'low'
    WHEN finalworth BETWEEN 10000 AND 30000 THEN 'medium'
    ELSE 'high'
END
FROM billionaires;

-- Compare the average net worth versus each person
SELECT personname,finalworth,
(SELECT AVG(finalworth) FROM billionaires)
FROM billionaires;

-- Inner Join: Combining tables based on similarities
SELECT country,continent,language FROM billionaires
INNER JOIN geography
ON billionaires.country = geography.Country_Name;

-- Left Join: Returning all values from the left table, but only matching rows from the right table."
SELECT DISTINCT(country),continent,language FROM billionaires
LEFT JOIN geography
ON billionaires.country = geography.Country_Name;

-- Right Join: Returning all values from the right table, but only matching rows from the left table."
SELECT DISTINCT(country),country_name,language FROM billionaires
RIGHT JOIN geography
ON billionaires.country = geography.Country_Name;