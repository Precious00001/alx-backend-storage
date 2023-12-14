-- Create an index named 'idx_name_first_score' on the 'names' table
-- with a composite key consisting of the first character of the 'name' column and the 'score' column.
CREATE INDEX idx_name_first_score ON names(name(1), score);
