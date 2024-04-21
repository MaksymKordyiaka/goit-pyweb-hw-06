DROP TABLE IF EXISTS students;
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    grade_value FLOAT NOT NULL,
    grade_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
