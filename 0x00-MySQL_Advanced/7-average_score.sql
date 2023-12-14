-- Dropping the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

-- Changing the delimiter for compatibility with multiple statements
DELIMITER $$

-- Creating the stored procedure to compute the average score for a user
CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
    -- Initializing variables to store total score and project count
    DECLARE total_score INT DEFAULT 0;
    DECLARE projects_count INT DEFAULT 0;

    -- Calculating the total score for the user
    SELECT SUM(score)
        INTO total_score
        FROM corrections
        WHERE corrections.user_id = user_id;

    -- Counting the number of projects for the user
    SELECT COUNT(*)
        INTO projects_count
        FROM corrections
        WHERE corrections.user_id = user_id;

    -- Updating the users table with the computed average score
    UPDATE users
        SET users.average_score = IF(projects_count = 0, 0, total_score / projects_count)
        WHERE users.id = user_id;
END $$

-- Resetting the delimiter to semicolon
DELIMITER ;
