import psycopg
from psycopg.rows import dict_row

# DSN : Data Source Name
DSN = "host=localhost port=5432 dbname=sportscenter user=postgres password=admin1234"

def main():
   with psycopg.connect(DSN, row_factory=dict_row) as conn:
    #    row = conn.execute("SELECT current_database(), current_user").fetchone()
    #    print("연결 성공:", row)
    rows = conn.execute("SELECT course_id, course_name, fee FROM courses LIMIT 5").fetchall()
    #   print(rows)
    for row in rows:
       print(row["course_name"], row["fee"])

if __name__ == "__main__":
    main()
