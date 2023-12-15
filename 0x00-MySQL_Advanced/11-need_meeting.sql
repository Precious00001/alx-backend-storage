-- Drop the 'need_meeting' view if it already exists
DROP VIEW IF EXISTS need_meeting;

-- Create a view named 'need_meeting' based on specific conditions in the 'students' table
CREATE VIEW need_meeting AS
    SELECT name
    FROM students
    WHERE score < 80 AND last_meeting IS NULL
    OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH);

-- Explanation:
-- This SQL script creates a view named 'need_meeting' by selecting 'name' from the 'students' table
-- based on the conditions specified in the WHERE clause. The view includes students with a score
-- less than 80 and either have a NULL value for 'last_meeting' or 'last_meeting' is older than
-- one month from the current date.
