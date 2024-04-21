SELECT s.student_id, s.first_name, s.last_name, g.group_name
FROM students s
JOIN groups g ON s.group_id = g.group_id
WHERE g.group_id = 2
ORDER BY s.last_name, s.first_name;