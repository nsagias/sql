DELIMITER //
DROP PROCEDURE IF EXISTS sp_cursor_get_customer_data//
CREATE PROCEDURE sp_cursor_get_customer_data()
	READS SQL DATA
    
BEGIN
	DECLARE a_customer_id INT;
	DECLARE customer_first_name VARCHAR(30);
    DECLARE email_address VARCHAR(255);
    DECLARE done INT
		DEFAULT 0;
	DECLARE cursor_1 CURSOR FOR
		SELECT customer_id, first_name, email
        FROM customer;
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
    
    OPEN cursor_1;
		customer_information_loop:LOOP
			FETCH cursor_1 INTO a_customer_id, customer_first_name, email_address;
            IF done=1 THEN
				LEAVE customer_information_loop;
            END IF;
		END LOOP customer_information_loop;	
    CLOSE cursor_1;
END //
DELIMITER ;