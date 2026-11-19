SELECT DISTINCT c.course_id, s.sport_id, c.course_id, c.class_days, c.fee
FROM courses c
JOIN sports s ON c.sport_id =s.sport_id
LEFT JOIN enrollments e on c.course_id = e.course_id
                        AND e.enroll_month = '2026-11'
ORDER BY c.course_id