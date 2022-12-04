DELIMITER //
DROP PROCEDURE IF EXISTS sp_square_root//
CREATE PROCEDURE sp_square_root(inputNumber INT)
BEGIN
	DECLARE l_sqrt FLOAT;
    SET l_sqrt=SQRT(inputNumber);
    SELECT l_sqrt;
END//
DELIMITER ;
CALL sp_square_root(144);



DELIMITER //

DROP PROCEDURE IF EXISTS sp_add_two_numbers//
CREATE PROCEDURE sp_add_two_numbers(firstNumber INT, secondNumber INT)
BEGIN
	DECLARE result INT;
    SET result=firstNumber + secondNumber;
    SELECT result;
END//
DELIMITER ;

CALL sp_add_two_numbers(1, 3);


DELIMITER //
DROP PROCEDURE IF EXISTS sp_square_root//
CREATE PROCEDURE sp_square_root(inputNumber INT, OUT out_number FLOAT)
BEGIN
 SET out_number=SQRT(inputNumber);
END//
DELIMITER ;

CALL sp_square_root(144, @out_value);
SELECT@out_value;