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

