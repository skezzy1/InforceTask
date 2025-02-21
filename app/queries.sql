-- Query 1: Retrieve the count of users who signed up on each day.
SELECT signup_date, COUNT(*) AS user_count
FROM users
GROUP BY signup_date
ORDER BY signup_date;

-- Query 2: List all unique email domains present in the database
SELECT DISTINCT domain
FROM users;

-- Query 3: Retrieve the details of users whose `signup_date` is within the last 7 days
ALTER TABLE users
ALTER COLUMN signup_date TYPE TIMESTAMP USING signup_date::TIMESTAMP; 

SELECT * FROM users
WHERE signup_date >= CURRENT_DATE - INTERVAL '7 days';

-- Query 4: Find the user(s) with the most common email domain
SELECT domain, COUNT(*) AS domain_count
FROM users
GROUP BY domain
ORDER BY domain_count DESC
LIMIT 1;

-- Query 5: Delete records where the email domain is not from a specific list
DELETE FROM users
WHERE domain NOT IN ('gmail.com', 'yahoo.com', 'example.com');
