USE sakila;

-- MIN
SELECT MIN(rental_duration) AS `Lowest Rental Length`
FROM film;

-- MAX
SELECT MAX(rental_duration) AS `Highest Rental Length`
FROM film;

-- COUNT
SELECT COUNT(film_id) `Number of Rentals` 
FROM film;

-- AVG
SELECT AVG(rental_duration) `Average Rental Duration` 
FROM film;
SELECT AVG(rental_duration) averageRenthalDuration 
FROM film;

-- SUM
SELECT SUM(amount) AS RentalRevenue 
FROM payment;

-- SUM and AVG
SELECT SUM(amount) AS RentalRevenue, AVG(amount) AS AvgRentalRevenuePerCustomer 
FROM payment;

-- COUNT SUM and AVG WHERE not equal to 0
SELECT count(payment_id) AS NumberOfSales, SUM(amount) AS RentalRevenue, AVG(amount) AS AvgRentalRevenuePerCustomer 
FROM payment
WHERE amount <> 0;