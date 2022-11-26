SELECT * 
  FROM film
  WHERE rating NOT IN('R', 'NC-17');

SELECT * 
  FROM city
  WHERE city IN (SELECT city FROM country);


SELECT * 
	FROM city
	WHERE city IN (SELECT city FROM country WHERE city='Abha');