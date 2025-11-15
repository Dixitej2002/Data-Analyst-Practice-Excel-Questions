-- student wise performance summary --
select s.student_id, s.first_name, s.last_name,
avg(m.total_marks) as avg_score,
count(m.mark_id) as Subject_count
from students s 
join enrollments e on s.student_id = e.student_id
join marks m on e.enrollment_id = m.enrollment_id
group by s.student_id;

-- Top 5 performing students --
SELECT s.student_id, s.first_name, s.last_name,
       AVG(m.total_marks) AS avg_score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN marks m ON e.enrollment_id = m.enrollment_id
GROUP BY s.student_id
ORDER BY avg_score DESC
LIMIT 5;

-- Student with low marks --
SELECT s.student_id, s.first_name, s.last_name, m.total_marks
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN marks m ON e.enrollment_id = m.enrollment_id
WHERE m.total_marks < 50;

-- Student attendance analysis --
use studentmanagementsystem;
select s.student_id, s.first_name, s.last_name, 
		Round(avg(a.status = 'Present') * 100, 2) as Present_percentage
        from students s 
        join enrollments e on s.student_id = e.student_id
        join attendance a on e.enrollment_id = a.enrollment_id
        group by s.student_id,s.first_name, s.last_name
        Limit 3;