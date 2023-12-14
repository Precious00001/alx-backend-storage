-- DELIMITER is used to change the statement delimiter to '|' for this script
DELIMITER |

-- CREATE PROCEDURE defines a stored procedure named AddBonus
CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score FLOAT
)
BEGIN
    -- Insert the project_name into the projects table only if it doesn't exist
    INSERT INTO projects (name)
    SELECT project_name FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM projects WHERE name = project_name);

    -- Insert a new correction record with user_id, project_id, and score
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (
        user_id,
        (SELECT id FROM projects WHERE name = project_name),
        score
    );
END;
|

-- Resetting the delimiter to its default value
DELIMITER ;
