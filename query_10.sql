SELECT t.first_name AS teacher_first_name, t.last_name AS teacher_last_name, s.subject_name
FROM students st
JOIN grades g ON st.student_id = g.student_id
JOIN subjects s ON g.subject_id = s.subject_id
JOIN teachers t ON s.teacher_id = t.teacher_id
WHERE st.student_id = 49 AND t.teacher_id = 5
GROUP BY t.teacher_id, s.subject_name;
