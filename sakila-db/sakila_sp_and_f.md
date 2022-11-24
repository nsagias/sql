```txt
CREATE
    [DEFINER = user]
    PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = user]
    FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

func_parameter:
    param_name type

type:
    Any valid MySQL data type

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
}

routine_body:
    Valid SQL routine statement

```

```SQL
DELIMITER //

CREATE FUNCTION  FCalcPriceSalesTaxWhileLoop ( startingValue FLOAT )
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE totalPrice FLOAT;
	SET totalPrice = 0;
	label1: WHILE startingValue >= 0.0 DO
		SET totalPrice = startingValue * 1.13;
    END WHILE label1;
    IF startingValue > 0 THEN SET totalPrice = startingValue * 1.13;
    END IF;
	RETURN totalPrice;
END; //
DELIMITER ;

DELIMITER //



CREATE FUNCTION CalculateSaleTaxIFStatement(
 	credit DECIMAL(10,2)
 ) 
RETURNS  DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalPrice DECIMAL(10,2);
    IF credit > 0 THEN
  SET totalPrice = credit * 10;
    ELSEIF credit < 0 THEN
        SET totalPrice = credit;
    END IF;
RETURN (totalPrice);
END//
DELIMITER ;



DELIMITER $$
CREATE FUNCTION CalculateSaleTaxOnly(
	payment DECIMAL(10,2)
) 
RETURNS  DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totalPrice DECIMAL(10,2);
    IF payment > 0 THEN
		SET totalPrice = payment * 0.13;
    ELSEIF payment < 0 THEN
        SET totalPrice = payment;
    END IF;
	RETURN (totalPrice);
END$$
DELIMITER ;

-- USE FUNCTION IN A QUERY
SELECT CalculateSaleTaxOnly(amount) FROM payment LIMIT 10;



SELECT * FROM film LIMIT 10;

DELIMITER //
CREATE PROCEDURE sp_get_movies()
BEGIN
  SELECT title, description, release_year, rating
  FROM film;
END //
DELIMITER ;


USE `sakila`;
DROP PROCEDURE IF EXISTS `sp_get_customer_by_rating`

DELIMITER //
USE `sakila` //

CREATE PROCEDURE `sp_get_customer_by_rating`(IN rating varchar(50))
BEGIN
  SELECT title, description, release_year, rating
  FROM film;
END //
DELIMITER ;

CALL sp_get_customer_by_rating('R')


-- USE sakila;

-- SELECT * FROM actor;
-- SELECT * FROM film;
-- SELECT * FROM film_actor;
-- SELECT 
-- 	a.first_name AS FirstName, 
-- 	a.last_name AS LastName
-- FROM 
-- 	actor a;

SELECT 
	title, 
    f.film_id as id, 
    fa.actor_id as actor_id,
	a.first_name AS FirstName, 
	a.last_name AS LastName
FROM 
	film f,
	film_actor fa,
	actor a
WHERE
	f.film_id = fa.film_id AND fa.actor_id = a.actor_id;



-- Make into view vw_film_and_actors 
CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW vw_film_and_actors (title, filmId, actorId, firstName, lastName) AS
SELECT 
	title, 
    f.film_id as  filmId, 
    fa.actor_id as actorId,
	a.first_name AS firstName, 
	a.last_name AS lastName
FROM 
	film f,
	film_actor fa,
	actor a
WHERE
	f.film_id = fa.film_id AND fa.actor_id = a.actor_id;


-- use view vw_film_and_actors 
SELECT 
	title, firstName 
FROM 
	vw_film_and_actors
WHERE
	actorId=1;
```