DELIMITER //

DROP PROCEDURE IF EXISTS sp_control_flow//
CREATE PROCEDURE sp_control_flow(
IN original_price DECIMAL(8,2), 
	OUT discounted_price DECIMAL(8,2)
	)
BEGIN
	IF (original_price>500) THEN
		SET discounted_price=original_price*.8;
	ELSEIF (original_price>100) THEN
		SET discounted_price=original_price*.9;
	ELSE 
		SET discounted_price=original_price;
	END IF;
END //

DELIMITER ;

CALL sp_control_flow(501, @more_than_500);
CALL sp_control_flow(401, @in_between_100_and_500);
CALL sp_control_flow(50, @less_than_100);

SELECT @more_than_500;
SELECT @in_between_100_and_500;
SELECT @less_than_100;