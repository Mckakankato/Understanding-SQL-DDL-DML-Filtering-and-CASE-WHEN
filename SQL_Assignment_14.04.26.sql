-- PART 1

-- SECTIONA – Building the Database (DDL)

-- Q1 Create a schema called nairobi_academy and make sure SQL is using it before you do anything else.

create schema if not exists nairobi_academy;

set search_path = nairobi_academy;

-- Q2. Create the students table with the following columns:

create table students (
student_id INT primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(50)
);

-- Q3. Create the subjects table with the following columns:

create table subjects (
subject_id INT primary key,
subject_name VARCHAR(100) not null unique,
department VARCHAR(50),
teacher_name VARCHAR(100),
credits INT
);

-- Q4. Create the exam_results table with the following columns:

create table  exam_results (
result_id INT primary key,
student_id INT not null,
subject_id INT not null,
marks INT not null,
exam_date date,
grade VARCHAR(2)
);

-- Q5. After creating the students table, the school realises they forgot to include a phone number column. Use ALTER TABLE to add a column called phone_number with data type VARCHAR(20).

alter table students
add column phone_id VARCHAR(20);

-- Q6. The column credits in the subjects table needs to be renamed to credit_hours. Write the SQL to rename it.

alter table subjects
rename column credits to credit_hours;

-- Q7. The school decides they no longer need the phone_number column you added in Q5. Write the SQL to remove it completely from the students table.

alter table students
drop column phone_id;

-- Q8. Insert all 10 students into the students table

set search_path = nairobi_academy;

INSERT INTO students  
(student_id, first_name, last_name, gender, date_of_birth, class, city) 
VALUES 
(1, 'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form3', 'Nairobi'), 
(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form4', 'Mombasa'), 
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form3', 'Kisumu'), 
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form4', 'Nairobi'), 
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form2', 'Nakuru'), 
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form2', 'Eldoret'), 
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form3', 'Nairobi'), 
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form4', 'Mombasa'), 
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form2', 'Nakuru'), 
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form3', 'Nairobi');

-- Q9. Insert all 10 subjects into the subjects table.

INSERT INTO subjects
(subject_id, subject_name, department, teacher_name, credit_hours)
  VALUES 
(1, 'Mathematics', 'Sciences', 'Mr.Njoroge', 4),
(2, 'English', 'Languages', 'Ms.Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms.Otieno', 4),
(4, 'History', 'Humanities', 'Mr.Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms.Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr.Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms.Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms.Muthoni', 4),
(9, 'ComputerStudies', 'Sciences', 'Mr.Oduya', 3),
(10, 'BusinessStudies', 'Humanities', 'Ms.Wangar', 3);

-- Q10. Insert all 10 exam results into the exam_results table

INSERT INTO exam_results
(result_id, student_id, subject_id, marks, exam_date, grade)
  VALUES
(1, 1, 1, 78, '2024-03-15', 'B'),
(2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4, 2, 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 9, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

-- Q11. After inserting the data, run a SELECT query to confirm all 10 rows exist in each of the three tables.

select * from students;

select * from subjects;

select * from exam_results;

-- Q12. Esther Akinyi has moved from Nakuru to Nairobi. Write an UPDATE statement to change her city. (Her student_id is 5)

update students
set city ='Nairobi'
where student_id = 5;

-- Q13. The marks for result_id 5 were entered incorrectly - the correct marks are 59, not 49. Write an UPDATE to fix this.

update exam_results
set marks = 59
where result_id = 5;

-- Q14. The exam result with result_id 9 has been cancelled by the school. Write a DELETE statement to remove it from the exam_results table.

delete from exam_results
where result_id = 9;

-- Q15. Write a query to find all students who are in Form 4.

select first_name, last_name
from students
where class = 'Form4';

-- Q16. Write a query to find all subjects in the Sciences department.

select subject_name
from subjects
where department = 'Sciences';

-- Q17. Write a query to find all exam results where the marks are greater than or equal to 70.

select result_id
from exam_results
where marks >= 70;

-- Q18. Write a query to find all female students only. (Hint: gender = 'F')

select first_name, last_name
from students
where gender = 'F';

-- Q19. Write a query to find all students who are in Form 3 AND from Nairobi.

select first_name, last_name
from students
where (class = 'Form4'and city = 'Nairobi');

-- Q20. Write a query to find all students who are in Form 2 OR Form 4.

select first_name, last_name
from students
where class = 'Form4'or class = 'Form2';

-- PART 2

-- Q1. Write a query to find all exam results where marks are between 50 and 80 (inclusive).

select result_id, student_id, subject_id
from exam_results
where marks between 50 and 80;

-- Q2. Write a query to find all exams that took place between 15th March 2024 and 18th March 2024.

select result_id, student_id, subject_id
from exam_results
where exam_date between '2024-03-15' and '2024-03-18';

-- Q3. Write a query to find all students who live in Nairobi, Mombasa, or Kisumu - use IN.

select first_name, last_name
from students
where city in ('Nairobi', 'Mombasa', 'Kisumu');

-- Q4. Write a query to find all students who are NOT in Form 2 or Form 3 - use NOT IN.

select first_name, last_name
from students
where class not in ('Form2', 'Form3');

-- Q5. Write a query to find all students whose first name starts with the letter 'A' or 'E' - use LIKE.

select first_name, last_name
from students
where first_name like 'A%' or first_name like 'E%';

-- Q6. Write a query to find all subjects whose subject name contains the word 'Studies'.

select subject_id, department
from subjects
where subject_name like '%Studies';

-- Q7. How many students are currently in Form 3? Write the query.

select count(*) as Form3_students
from students
where class = 'Form3';

-- Q8. How many exam results have a mark of 70 or above? Write the query.

select count(*) as marks_above_70
from exam_results
where marks >= 70;

-- Q9. Write a query using CASE WHEN to label each exam result with a grade description:

select result_id, student_id, subject_id,
case 
	when marks >= 80 then 'Distinction'
	when marks > 59 then 'Merit'
	when marks > 39 then 'Pass'
	else 'Fail'
end as performance 
from exam_results;

-- Q10. Write a query using CASE WHEN to label each student as:

select student_id, first_name, last_name, class,
case 
	when class = 'Form4'or class = 'Form3' then 'Senior'
	else 'Junior'
end as student_level 
from students;


