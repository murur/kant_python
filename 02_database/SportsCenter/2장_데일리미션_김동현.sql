-- 1번 · 연락처 점검 대상 회원

SELECT  
    member_id   AS 회원번호,
    name        AS 이름,
    birth_year  AS 출생연도,
    region      AS 거주지역,
    phone       AS 전화번호
FROM members 
WHERE birth_year BETWEEN 1970 AND 1989 AND email IS NULL
ORDER BY birth_year ASC, member_id ASC;

-- 2번 · 지역·성별 회원 현황

SELECT
    region AS 거주지역,
    CASE WHEN gender = 'F' THEN '여'
         WHEN gender = 'M' THEN '남'
    END AS 성별,
    COUNT(*) AS 회원수,
    ROUND(AVG(birth_year)) AS 평균출생연도
FROM members
GROUP BY region, gender
HAVING COUNT(*) >= 5
ORDER BY 거주지역 ASC, 성별 ASC;

-- 3번 · 10월 수강 취소 명단

SELECT
    m.name AS 회원명,
    m.phone AS 전화번호,
    c.course_name AS 강좌명,
    e.enroll_month AS 수강월
FROM enrollments e
LEFT JOIN members m ON e.member_id = m.member_id
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE e.enroll_month = '2026-10'
    AND e.status = '취소'
ORDER BY m.name ASC;

-- 4번 · 종목별 월 매출




-- 5번 · 강사별 담당 강좌와 이번 달 신청




