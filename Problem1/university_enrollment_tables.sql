----------------------------------------------------------------------------------------------------------------------------
-- University Course Enrollment System Tables
----------------------------------------------------------------------------------------------------------------------------

-- Students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

-- Professors table
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- Courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(75) NOT NULL,
    course_description VARCHAR(100) NOT NULL,
    professor_id INTEGER NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

-- Enrollments table
CREATE TABLE enrollments (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

----------------------------------------------------------------------------------------------------------------------------
-- Insertions of data into each table.
----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the students table
INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Brian', 'Janes', 'brian.janes@keyin.com', '2022-12-15'),
('Jane', 'Smith', 'jane.smith@mun.ca', '2023-09-01'),
('Michael', 'Johnson', 'michael.johnson@cona.ca', '2022-09-01'),
('Emily', 'Brown', 'emily.brown@athabasca.ca', '2024-01-15'),
('David', 'Wilson', 'david.wilson@grenfell.mun.ca', '2023-01-15');

-- Confirmation query
SELECT * FROM students;

----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the professors table
INSERT INTO professors (first_name, last_name, department) VALUES
('Matthew', 'English', 'Computer Engineering'),
('Noman', 'Atique', 'English'),
('Qurrat-Ul-Ain', 'Malik', 'Math'),
('Maurice', 'Babin', 'Computer Science');

-- Confirmation query
SELECT * FROM professors;

----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the courses table
INSERT INTO courses (course_name, course_description, professor_id) VALUES
('Computer Engineering', 'Intro to Software Development', 1),
('Math 101', 'Intro to Math', 3),
('Physics 101', 'Intro to Physics', 1);

-- Confirmation query
SELECT * FROM courses;

----------------------------------------------------------------------------------------------------------------------------

-- Insert 5 different students into the enrollments table
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 10, '2024-01-15'),
(1, 11, '2024-01-15'),
(2, 10, '2024-01-16'),
(3, 12, '2024-01-17'),
(4, 11, '2024-01-18');

-- Confirmation query
SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.enrollment_date
FROM 
    enrollments e
JOIN 
    students s ON e.student_id = s.id
JOIN 
    courses c ON e.course_id = c.id;
