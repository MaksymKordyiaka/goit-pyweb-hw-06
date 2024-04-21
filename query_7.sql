SELECT s.student_id, s.first_name, s.last_name, g.grade_value, g.grade_date
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE s.group_id = 1 AND g.subject_id = 5
ORDER BY s.last_name, s.first_name, g.grade_date;