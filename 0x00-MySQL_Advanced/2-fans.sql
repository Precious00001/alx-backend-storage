-- This SQL query retrieves the total number of fans for each unique origin of metal bands.
SELECT
    origin,               -- Selecting the 'origin' column
    SUM(fans) AS nb_fans  -- Calculating the sum of 'fans' for each origin and aliasing it as 'nb_fans'
FROM
    metal_bands           -- Using the 'metal_bands' table
GROUP BY
    origin                -- Grouping the results by the 'origin' column
ORDER BY
    nb_fans DESC;         -- Ordering the results in descending order based on the total number of fans

