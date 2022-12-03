DELIMITER $$

DROP PROCEDURE IF EXISTS sp_variable_and_types$$
CREATE PROCEDURE sp_variable_and_types()
BEGIN
	DECLARE a_tiny_int tinyint;   	/* 1 byte , values between 0 to 255 */
    DECLARE a_small_int smallint; 	/* 16-bit, 2 bytes, -32768 to 32767 */
	DECLARE an_integer INT; 			/* 32-bit integer, 4 bytes, -2,147,483,648 to 2,147,483,647 */
    DECLARE a_big_integer BIGINT;   	/* 64-bit integer, 8 bytes, -2E63 to 2E63 -1 */
    DECLARE a_decimal DECIMAL(10,2); 	/* 5 to 17 bytes, -10E38 + 1 to 10E38 -1 toDecimal with 2 decimals, decimal number with upt o 38 digits */
	DECLARE a_numeric NUMERIC(10,2);  /* similar to deciman */
    DECLARE a_float FLOAT; 			/* if n <= 24: 4 bytes, 24 > n < 53: 8 bytes similar to decimal */
    DECLARE a_pi_default FLOAT 
		DEFAULT 3.1415926; 
	DECLARE a_text TEXT; /* 65,535 bytes */
    DECLARE a_date DATE; /* YYYY-MM-DD */
    DECLARE a_date_with_default DATE 
		DEFAULT'2023-01-01';
	DECLARE a_varchar VARCHAR(30) /* can be from 0 to 65535 */
		DEFAULT 'Hello world';
	DECLARE an_enum ENUM ('a', 'b','c') /* max 65535 possible enums vars */
		DEFAULT 'c';
	SET an_integer=20;
    SET a_big_integer=POWER(an_integer, 3);
    
END$$
DELIMITER ;
