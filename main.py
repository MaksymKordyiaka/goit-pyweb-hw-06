import sqlite3
from faker import Faker
database = 'education.db'

def create_connection():
    conn = sqlite3.connect(database)
    return conn

def create_tables(conn):
    cursor = conn.cursor()
    with open('education.sql', 'r') as file:
        sql_queries = file.read().split(';')
        for query in sql_queries:
            if query.strip():
                cursor.execute(query)

    conn.commit()

if __name__ == '__main__':
    conn = create_connection()
    create_tables(conn)
    conn.close()
