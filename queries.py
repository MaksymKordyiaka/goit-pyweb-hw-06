import sqlite3

def execute_query_from_file(conn, filename):
    cursor = conn.cursor()
    with open(filename, 'r') as file:
        query = file.read()
        try:
            cursor.execute(query)
            rows = cursor.fetchall()
            conn.commit()
            print(f"Query from {filename} executed successfully.")
            return rows
        except sqlite3.Error as e:
            print(f"Error executing query from {filename}: {e}")
            return None
