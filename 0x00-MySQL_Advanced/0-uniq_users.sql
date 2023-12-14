-- Create a table named 'users' with the specified columns and constraints
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user, auto-incremented
    email VARCHAR(255) NOT NULL UNIQUE, -- User's email address, must be unique
    name VARCHAR(255) -- User's name
);

