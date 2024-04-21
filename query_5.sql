SELECT t.first_name, t.last_name, s.subject_name
FROM teachers t
JOIN subjects s ON t.teacher_id = s.teacher_id
WHERE t.teacher_id = 4
ORDER BY s.subject_name;
