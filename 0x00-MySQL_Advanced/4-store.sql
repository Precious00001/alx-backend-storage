-- Drop the items table if it exists
DROP TABLE IF EXISTS items;

-- Drop the orders table if it exists
DROP TABLE IF EXISTS orders;

-- Create the items table if it does not exist
CREATE TABLE IF NOT EXISTS items (
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL DEFAULT 10
);

-- Create the orders table if it does not exist
CREATE TABLE IF NOT EXISTS orders (
    item_name VARCHAR(255) NOT NULL,
    number INT NOT NULL
);

-- Insert initial data into the items table
INSERT INTO items (name) VALUES ("apple"), ("pineapple"), ("pear");
