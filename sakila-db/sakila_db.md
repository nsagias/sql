```sql
SHOW FULL TABLES FROM sakila;
USE sakila;

CREATE OR REPLACE VIEW vw_customer (store_id, fname, lname, email_id) AS 
    SELECT store_id, first_name, last_name, email
    FROM customer LIMIT 10;

SELECT * 
FROM vw_customer 
WHERE store_id=2;
```