INSERT INTO sports (sport_name)
VALUES ('필라테스')
RETURNING *;

SELECT * FROM sports;

CREATE TABLE contact_lists
(
    request_id  SERIAL      PRIMARY KEY,
    member_id   INT         NOT NULL,
    name        VARCHAR(20) NOT NULL,
    reason      VARCHAR(50) NOT NULL,
    request_date DATE       NOT NULL
);

SELECT * FROM contact_lists;

TRUNCATE contact_lists;

INSERT INTO contact_lists (member_id, name, reason, request_date)
SELECT member_id, name, '이메일 미등록' AS reason, CAST('2026-11-19' AS DATE) AS req_date
FROM members
WHERE email IS NULL
UNION
SELECT member_id, name, '휴대폰 미등록', '2026-11-19' ::DATE
FROM members
WHERE phone IS NULL
RETURNING *;

SELECT * FROM members WHERE member_id = 2;

UPDATE members
SET email = 'ljh@abc.com'
WHERE member_id = 2
RETURNING *;

SELECT * FROM courses;


UPDATE courses
SET class_days = '월수금', start_time = '20:00'
WHERE course_id = 9
RETURNING course_id, course_name, class_days, start_time;

SELECT * FROM courses WHERE sport_id = 1;

UPDATE courses
SET fee = fee * 1.05
WHERE sport_id = 1
RETURNING fee;

-- 서브쿼리 활용한 UPDATE

-- 2026-11 수강신청인원이 5명 이상인 경우 수강신청인원수 +5

UPDATE courses
SET capacity = capacity + 5
WHERE course_id IN (SELECT course_id
                    FROM enrollments
                    WHERE enroll_month = '2026-11'
                    GROUP BY course_id
                    HAVING COUNT(*) >= 5)
RETURNING course_id, course_name capacity;

-- DELETE

SELECT * FROM lockers;

DELETE FROM lockers
WHERE member_id = 38
RETURNING *;

SELECT m.member_id, m.name, m.join_date
FROM members m
WHERE NOT EXISTS (SELECT 1 FROM enrollments e where e.member_id = m.member_id);

DELETE FROM members m
WHERE NOT EXISTS (SELECT 1 FROM enrollments e where e.member_id = m.member_id)
RETURNING m.member_id, m.name;

-- DELETE 
-- TRUNCATE
-- DROP TABLE
-- 위 세가지 개념은 알고 있어야 한다

-- dh@gimdonghyeon-ui-MacBookAir SportsCenter % cd ..
-- dh@gimdonghyeon-ui-MacBookAir 02_database % ls
-- ShoppingCenter  SportsCenter    pg_lab
-- dh@gimdonghyeon-ui-MacBookAir 02_database % mkdir sportscenter_app
-- dh@gimdonghyeon-ui-MacBookAir 02_database % cd sportscenter_app 
-- dh@gimdonghyeon-ui-MacBookAir sportscenter_app % code .