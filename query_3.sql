SELECT grp.group_name, AVG(g.grade_value) as average_grade
FROM groups grp
JOIN students s ON grp.group_id = s.group_id
JOIN grades g ON s.student_id = g.student_id
WHERE g.subject_id = 3
GROUP BY grp.group_name;
