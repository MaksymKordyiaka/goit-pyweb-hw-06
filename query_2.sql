SELECT s.student_id, s.first_name, s.last_name, AVG(g.grade_value) as average_grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.subject_id = 2
GROUP BY s.student_id
ORDER BY average_grade DESC
LIMIT 1;
