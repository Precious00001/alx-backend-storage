-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS validate_email;

-- Change the delimiter for creating the trigger
DELIMITER $$

-- Create a trigger named validate_email
CREATE TRIGGER validate_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email is being modified
    IF OLD.email != NEW.email THEN
        -- If email is modified, set valid_email to 0
        SET NEW.valid_email = 0;
    ELSE
        -- If email is not modified, retain the current valid_email value
        SET NEW.valid_email = NEW.valid_email;
    END IF;
END $$

-- Reset the delimiter back to semicolon
DELIMITER ;
