CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

CREATE TABLE groups (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers (
    teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE subjects (
    subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(100) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    subject_id INTEGER,
    grade_value FLOAT NOT NULL,
    grade_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (first_name,last_name) REFERENCES students(first_name, last_name),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
