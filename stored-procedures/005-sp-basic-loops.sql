DELIMITER //

DROP PROCEDURE IF EXISTS basic_loop//
CREATE PROCEDURE basic_loop()
BEGIN
	DECLARE counter INT 
		DEFAULT 0;
    basic_loop_name:LOOP
		SET counter=counter +1;
        IF counter=10 THEN
			LEAVE basic_loop_name;
		END IF;
    END LOOP basic_loop_name;
    SELECT 'COUNTING TO TEN';
END //

DELIMITER ;
CALL basic_loop();