import sqlite3
from generate_data import generate_data
from queries import execute_query_from_file


def create_connection():
    conn = sqlite3.connect('education.db')
    return conn


if __name__ == '__main__':
    conn = create_connection()

    with conn:
        cursor = conn.cursor()

        with open('education.sql', 'r') as file:
            sql_queries = file.read().split(';')

            for query in sql_queries:
                if query.strip():
                    try:
                        cursor.execute(query)
                    except sqlite3.OperationalError as e:
                        print(f"Skipped executing query: {query} - {e}\n")
            conn.commit()

        generate_data(conn)

        for i in range(1, 11):
            filename = f"query_{i}.sql"
            result = execute_query_from_file(conn, filename)

            if result:
                print(f"Results from {filename}:")
                for row in result:
                    print(row)
                print('-' * 50)

    conn.close()



