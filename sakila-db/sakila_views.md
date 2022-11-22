```sql
SHOW FULL TABLES FROM sakila;
USE sakila;

CREATE OR REPLACE VIEW vw_customer (store_id, fname, lname, email_id) AS 
    SELECT store_id, first_name, last_name, email
    FROM customer LIMIT 10;

SELECT * 
FROM vw_customer 
WHERE store_id=2;

-- CREATE
--     [OR REPLACE]
--     [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
--     [DEFINER = user]
--     [SQL SECURITY { DEFINER | INVOKER }]
--     VIEW view_name [(column_list)]
--     AS select_statement
--     [WITH [CASCADED | LOCAL] CHECK OPTION]

CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW vw_customer (store_id, fname, lname, email_id) AS 
    SELECT store_id, first_name, last_name, email
    FROM customer LIMIT 10;


SELECT * 
FROM vw_customer 
WHERE store_id=2;


CREATE OR REPLACE 
	VIEW vw_tax_example AS
	SELECT amount, amount*1.13 AS sales_with_tax
    FROM payment;

SELECT * 
FROM vw_tax_example
LIMIT 10;
```