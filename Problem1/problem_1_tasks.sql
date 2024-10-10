-- 1. SQL Queries

-- a. Students enrolled in Physics 101
SELECT 
-- I used a CONCAT function to combine the first and last name of the student into a single column.
    s.first_name || ' ' || s.last_name AS full_name
FROM 
    students s
JOIN 
-- Used a JOIN to connect the students table with the enrollments table using the student ID.
    enrollments e ON s.id = e.student_id
WHERE 
-- I used a subquery to select the course ID for Physics 101.
    e.course_id = (SELECT id FROM courses WHERE course_name = 'Physics 101');

----------------------------------------------------------------------------------------------------------------------------

-- b. Courses with professor names

SELECT 
-- I used a CONCAT function to combine the first  last name of the professor into a single column.
    p.first_name || ' ' || p.last_name AS professor_full_name,
    c.course_name
FROM
    professors p 
-- I used a JOIN to connect the professors table with the courses table using the professor ID.
JOIN 
    courses c ON p.id = c.professor_id;

----------------------------------------------------------------------------------------------------------------------------

-- c. Courses with enrolled students
-- I used a COUNT function to count the number of students enrolled in each course.
SELECT 
    c.id,
    c.course_name,
    COUNT(e.student_id) AS enrolled_students
FROM 
    courses c
-- I used a JOIN to connect the courses table with the enrollments table. 
JOIN 
    enrollments e ON c.id = e.course_id
-- I used a GROUP BY clause to group the results by course ID and course name.
GROUP BY 
    c.id, c.course_name
-- I used an ORDER BY clause to order the results by course ID. This showed me how many people were enrolled in each course.
ORDER BY 
    c.id;

----------------------------------------------------------------------------------------------------------------------------

-- 2. Update Data
-- Update a student's email
-- I checked the user first to make sure it existed
SELECT id, first_name, last_name, email
FROM students
WHERE id = 1;

-- I then updated the email to a new, cooler email address.
UPDATE students
SET email = 'brian.janes@updatedemail.com'
WHERE id = 1;

-- I then checked the user again to make sure the email was updated. It was! Nice.
SELECT id, first_name, last_name, email
FROM students
WHERE id = 1;

----------------------------------------------------------------------------------------------------------------------------

-- 3. Delete Data
-- Remove a student from a course
-- I checked the student first to make sure they existed in enrollments.
SELECT s.id, s.first_name, s.last_name, c.course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE s.id = 1;

-- This should drop the student from the course with course_id 10. (Computer Engineering)
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 10;

-- When I check again, the student is no longer enrolled in the course with that course_id, but still in Physics 101.
SELECT s.id, s.first_name, s.last_name, c.course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE s.id = 1;