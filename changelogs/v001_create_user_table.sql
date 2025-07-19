-- Create users table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);
