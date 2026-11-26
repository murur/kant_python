import psycopg
from psycopg.rows import dict_row

# DSN : Data Source Name
DSN = "host=localhost port=5432 dbname=sportscenter user=postgres password=admin1234"

MONTH = "2026-11"

LIST_SQL = """
SELECT DISTINCT c.course_id, s.sport_name, c.course_name, c.class_days, c.fee
FROM courses c
JOIN sports s ON c.sport_id =s.sport_id
LEFT JOIN enrollments e on c.course_id = e.course_id
                        AND e.enroll_month = %s
ORDER BY c.course_id
"""

#  수강 신청가능 목록 조회
def list_courses(conn):
   for c in conn.execute(LIST_SQL, (MONTH,)):
      print(f"{c['course_id']:>3} | {c['sport_name']} | {c['course_name']} | {c['class_days']} | {c['fee']}원")

# TODO : 입력 로직 구현

MEMBER_ID = 10
COURSE_ID = 1


# 수강 신청
def enroll(conn, member_id, course_id):
    # TODO : 신청한 강좌의 수강료 추출
    fee = 0
   
    conn.execute(
      "INSERT INTO enrollments (member_id, course_id, enroll_month, status, pay_amount)"
      "VALUES (%s, %s, %s, '수강중',git %s)" , 
      (member_id, course_id, MONTH, fee)
   )
    print("수강신청 완료되었습니다.")


def main():
   with psycopg.connect(DSN, row_factory=dict_row) as conn:
    # 수강 목록
    list_courses(conn)
    # 수강 신청
    enroll(conn, MEMBER_ID, COURSE_ID)

    #   list_courses(conn)

    # #    row = conn.execute("SELECT current_database(), current_user").fetchone()
    # #    print("연결 성공:", row)
    # rows = conn.execute("SELECT course_id, course_name, fee FROM courses LIMIT 5").fetchall()
    # #   print(rows)
    # for row in rows:
    #    print(row["course_name"], row["fee"])

if __name__ == "__main__":
    main()
