-- Drop the function 'SafeDiv' if it already exists
DROP FUNCTION IF EXISTS SafeDiv;

-- Change the delimiter to $$ for creating the function
DELIMITER $$

-- Create the SafeDiv function
CREATE FUNCTION SafeDiv (a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    -- Initialize the result variable
    DECLARE result FLOAT DEFAULT 0;

    -- Check if the denominator (b) is not zero to avoid division by zero
    IF b != 0 THEN
        -- Perform the division if the denominator is not zero
        SET result = a / b;
    END IF;

    -- Return the result of the division
    RETURN result;
END $$

-- Reset the delimiter back to ;
DELIMITER ;
