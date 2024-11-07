-- 1. Managing a Fitness Center Database

-- Task 1: SQL Data Insertion

-- Problem Statement: Your task is to populate the Members and WorkoutSessions 
-- tables with relevant data. This will involve inserting records into both tables
--  while ensuring data integrity and consistency.

-- Expected Outcome: New member records are successfully added to the Members table
--  with their respective details.



CREATE TABLE Members (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL,
    age INT);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY NOT NULL,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members ( id, name, age)
VALUES
(1, 'Jane Doe', 37),
(2, 'Johnny Sanders', 27),
(3, 'Jeff Wilson', 25),
(4, 'Jackie Robinson', 42);

INSERT INTO WorkoutSessions ( session_id, member_id, session_date, session_time, activity)
VALUES
(1, 1,  "2024-08-20" , "9:30a.m.", "yoga");

SELECT * FROM Members;

SELECT * FROM WorkoutSessions;

-- #Task 2: SQL Data Update

-- Problem Statement: Update the workout session time for a specific member. 
-- Assume member 'Jane Doe' has changed her workout session from morning to evening.
-- Expected Outcome: The WorkoutSessions table is successfully updated to reflect 
-- the new session time for Jane Doe.

UPDATE WorkoutSessions
SET session_time = "5:00p.m."
WHERE member_id = 1;

SELECT * FROM WorkoutSessions
WHERE session_id = 1;


-- #Task 3: SQL Data Deletion
-- #Problem Statement: Remove data of a member who has canceled their gym membership. 

SET SQL_SAFE_UPDATES = 0;
UPDATE Members
SET name = "John Smith"
WHERE id = 3;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Members WHERE name = "John Smith";
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Members

