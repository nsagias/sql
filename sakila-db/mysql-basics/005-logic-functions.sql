-- IF LOGIC
SELECT IF(500 < 1000, "Y", "N");

-- IF LOGIC is Saturday
SELECT IF(WEEKDAY(CURDATE()) = 5, "Y", "N");

-- IF LOGIC is weekend
SELECT IF(WEEKDAY(CURDATE()) < 5, "Y", "N");

-- IF LOGIC is Friday long weekend
SELECT IF(WEEKDAY(CURDATE()) < 4, "Y", "N");

-- CASE Example with between
SELECT 
	film_id AS Id,
  title AS `Movie Name`,
CASE
	WHEN rental_rate < 0.99 THEN 'Cheap Rentals'
    WHEN rental_rate BETWEEN 1.00 AND 2.99 THEN 'Medium Priced Rentals'
	ELSE 'Premium Rentals'
END AS 'Price Range'
FROM film;