ALTER TABLE `sakila`.`payment` 
ADD COLUMN `bonus` `bonus` VARCHAR(5)  NULL AFTER `amount`;

DELIMITER //
DROP PROCEDURE IF EXISTS sp_update_payment_bonus//
CREATE PROCEDURE sp_update_payment_bonus(
	IN in_payment_id INT,
    IN in_bonus VARCHAR(5)
)
BEGIN
-- 	IF (in_bonus <> 'YES' OR in_bonus <> 'NO') THEN
	IF in_bonus != 'YES'  THEN
		SELECT "Can only enter YES or NO";
	ELSE
		UPDATE payment
		SET bonus=in_bonus
		WHERE payment_id=in_payment_id; 
	END IF;
END//

DELIMITER ;
CALL sp_update_payment_bonus(1,'YES');
SELECT * FROM payment;