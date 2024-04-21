from datetime import date
from faker import Faker
import random

fake = Faker()

def generate_data(conn):
    cursor = conn.cursor()

    students = 50
    groups = 3
    subjects = 5
    teachers = 5

    def generate_students(num_students):
        cursor.execute("SELECT COUNT(*) FROM students")
        count = cursor.fetchone()[0]
        if count < num_students:
            for _ in range(num_students - count):
                first_name = fake.first_name()
                last_name = fake.last_name()
                group_id = random.randint(1, 3)
                cursor.execute("INSERT OR IGNORE INTO students (first_name, last_name, group_id) VALUES (?, ?, ?)",
                               (first_name, last_name, group_id))

    def generate_groups(num_groups):
        cursor.execute("SELECT COUNT(*) FROM groups")
        count = cursor.fetchone()[0]
        if count < num_groups:
            for i in range(count + 1, num_groups + 1):
                group_name = f'Group {i}'
                cursor.execute("INSERT OR IGNORE INTO groups (group_name) VALUES (?)",
                               (group_name, ))

    def generate_subjects(num_subjects, num_teachers):
        cursor.execute("SELECT COUNT(*) FROM subjects")
        count = cursor.fetchone()[0]
        if count < num_subjects:
            subjects_per_teacher = num_subjects // num_teachers
            for teacher_id in range(1, num_teachers + 1):
                for _ in range(subjects_per_teacher):
                    subject_name = fake.catch_phrase()
                    cursor.execute("INSERT OR IGNORE INTO subjects (subject_name, teacher_id) VALUES (?, ?)",
                                   (subject_name, teacher_id))

    def generate_teachers(num_teachers):
        cursor.execute("SELECT COUNT(*) FROM teachers")
        count = cursor.fetchone()[0]
        if count < num_teachers:
            for _ in range(num_teachers - count):
                first_name = fake.first_name()
                last_name = fake.last_name()
                cursor.execute("INSERT OR IGNORE INTO teachers (first_name, last_name) VALUES (?, ?)",
                               (first_name, last_name))

    def generate_grades(num_students, num_subjects):
        cursor.execute("SELECT COUNT(*) FROM grades")
        count = cursor.fetchone()[0]
        if count < num_students * 20:
            for student_id in range(1, num_students + 1):
                for _ in range(20):
                    subject_id = random.randint(1, num_subjects)
                    grade_value = random.randint(51, 100)
                    grade_date = fake.date_between(start_date=date(2023, 9, 1), end_date='today')
                    cursor.execute("""
                        INSERT OR IGNORE INTO grades (student_id, first_name, last_name, subject_id, grade_value, grade_date) 
                        SELECT ?, s.first_name, s.last_name, ?, ?, ?
                        FROM students s
                        WHERE s.student_id = ?
                    """, (student_id, subject_id, grade_value, grade_date, student_id))

    generate_students(students)
    generate_groups(groups)
    generate_teachers(teachers)
    generate_subjects(subjects, teachers)
    generate_grades(students, subjects)
