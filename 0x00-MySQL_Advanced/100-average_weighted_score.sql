-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Change the delimiter to avoid conflicts with semicolons in the procedure
DELIMITER $$

-- Create the stored procedure to compute the average weighted score for a user
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INT)
BEGIN
    -- Declare a variable to store the weighted average score
    DECLARE w_avg_score FLOAT;

    -- Calculate the weighted average score using a SELECT query
    SET w_avg_score = (SELECT SUM(score * weight) / SUM(weight) 
                        FROM users AS U 
                        JOIN corrections AS C ON U.id = C.user_id 
                        JOIN projects AS P ON C.project_id = P.id 
                        WHERE U.id = user_id);

    -- Update the users table with the computed average score for the specified user
    UPDATE users SET average_score = w_avg_score WHERE id = user_id;
END
$$

-- Reset the delimiter back to semicolon
DELIMITER ;
