USE sakila;

-- AND
SELECT *
FROM film
WHERE 
	rental_rate < 1.00 AND rental_duration <= 3;

-- AND/ NOT
SELECT *
FROM film
WHERE 
	rental_rate < 1.00 
    AND rental_duration <= 3  
    AND NOT rating ='R';

-- AND/NOT/OR NOT`
SELECT *
FROM film
WHERE 
	rental_rate < 1.00 
    AND rental_duration <= 3  
    AND NOT rating ='R' OR NOT rating ='NC-17';