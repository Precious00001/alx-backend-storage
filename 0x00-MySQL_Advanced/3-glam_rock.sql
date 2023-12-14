-- SQL Query to retrieve band_name and calculate the lifespan of metal bands in Glam rock style

-- Select band_name and calculate the lifespan by subtracting formed year from the split year (default to 2020 if split is NULL)
SELECT band_name, IFNULL(split, 2020) - formed AS lifespan
FROM metal_bands
-- Filter bands in the Glam rock style
WHERE FIND_IN_SET("Glam rock", style)
-- Order the result by the calculated lifespan in descending order
ORDER BY lifespan DESC;
