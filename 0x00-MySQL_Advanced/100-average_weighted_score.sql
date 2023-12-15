-- This SQL script defines a stored procedure named ComputeAverageWeightedScoreForUser
-- The procedure calculates and updates the average weighted score for a specified user.

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Change the delimiter to $$ to handle the semicolons within the procedure
DELIMITER $$

-- Create the stored procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
    -- Declare variables to store total weighted score and total weight
    DECLARE total_weighted_score INT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;

    -- Calculate the sum of (corrections.score * projects.weight) for the specified user
    SELECT SUM(corrections.score * projects.weight)
        INTO total_weighted_score
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    -- Calculate the sum of project weights for the specified user
    SELECT SUM(projects.weight)
        INTO total_weight
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    -- Check if the total weight is zero
    IF total_weight = 0 THEN
        -- If total weight is zero, set the user's average score to 0
        UPDATE users
            SET users.average_score = 0
            WHERE users.id = user_id;
    ELSE
        -- If total weight is non-zero, calculate and update the average score
        UPDATE users
            SET users.average_score = total_weighted_score / total_weight
     

