USE sakila;
DELIMITER //

DROP PROCEDURE IF EXISTS customer_sales//
CREATE PROCEDURE customer_sales(
	IN in_customer_id INT
)
	READS SQL DATA
BEGIN
	DECLARE total_sales DECIMAL(8,2);
    SELECT SUM(amount)
		INTO total_sales
		FROM payment
        WHERE customer_id=in_customer_id;
        
	SELECT CONCAT('Total sales for ', in_customer_id,' is ',total_sales);
END //
DELIMITER ;
CALL customer_sales(2);