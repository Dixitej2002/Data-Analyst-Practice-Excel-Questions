SELECT * FROM studentmanagementsystem.students;
use studentmanagementsystem;
create table courses(
course_id int primary key,
course_name varchar(100),
department varchar(50),
credits int
);
create table enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
semester varchar(10),
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

create table marks(
mark_id int primary key,
enrollment_id int,
internal_marks decimal(5,2),
external_marks decimal(5,2),
total_marks decimal(5,2) generated always AS (internal_marks + external_marks),
grade char(2),
FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
);

create table attendance(
attendance_id int primary key,
enrollment_id int,
attendance_date date,
status varchar(10),
foreign key (enrollment_id) references enrollments(enrollment_id)
);

select * from courses;
select * from attendance;
INSERT INTO enrollments (enrollment_id, student_id, course_id, semester)
VALUES
(1, 1, 101, 'Sem1'),
(2, 1, 102, 'Sem1'),
(3, 2, 101, 'Sem1'),
(4, 2, 103, 'Sem1'),
(5, 3, 101, 'Sem1'),
(6, 3, 102, 'Sem1');

INSERT INTO attendance (attendance_id, enrollment_id, attendance_date, status) VALUES
(1, 1, '2025-01-01', 'Present'),
(2, 1, '2025-01-02', 'Absent'),
(3, 1, '2025-01-03', 'Present'),

(4, 2, '2025-01-01', 'Present'),
(5, 2, '2025-01-02', 'Present'),

(6, 3, '2025-01-01', 'Absent'),
(7, 3, '2025-01-02', 'Present'),

(8, 4, '2025-01-01', 'Present'),
(9, 4, '2025-01-02', 'Absent'),

(10, 5, '2025-01-01', 'Present'),
(11, 5, '2025-01-02', 'Present'),

(12, 6, '2025-01-01', 'Absent'),
(13, 6, '2025-01-02', 'Present');

INSERT INTO marks (mark_id, enrollment_id, internal_marks, external_marks, grade) VALUES
(1, 1, 23.00, 55.00, 'A'),
(2, 2, 20.00, 48.00, 'B'),
(3, 3, 18.00, 40.00, 'C'),
(4, 4, 25.00, 60.00, 'A'),
(5, 5, 22.00, 50.00, 'B'),
(6, 6, 19.00, 42.00, 'C');

select * from marks;


