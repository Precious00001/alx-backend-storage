-- Create a table named 'users' if it does not already exist
CREATE TABLE IF NOT EXISTS `users` (
    -- Unique identifier for each user, auto-incremented
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    -- Email address of the user, must be unique
    `email` VARCHAR(255) NOT NULL UNIQUE,
    
    -- Name of the user (optional)
    `name` VARCHAR(255),
    
    -- Country of the user, restricted to specific values (US, CO, TN)
    `country` ENUM('US', 'CO', 'TN') NOT NULL
);
