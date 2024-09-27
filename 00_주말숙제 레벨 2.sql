-- 1번 문제
SELECT   STUDENT_NO AS 학번
		,STUDENT_NAME AS 이름
        ,ENTRANCE_DATE AS 입학년도
FROM tb_student A JOIN tb_department B ON A.DEPARTMENT_NO = B.DEPARTMENT_NO 
WHERE B.DEPARTMENT_NAME = '영어영문학과' AND B.DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

-- 2번 문제
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM tb_professor
WHERE PROFESSOR_NAME NOT like '___';

-- 3번 문제
SELECT  PROFESSOR_NAME AS 교수이름,
(YEAR(CURDATE()) - YEAR(STR_TO_DATE(CONCAT('19', SUBSTRING(PROFESSOR_SSN, 1, 6)), '%Y%m%d'))) -1 AS 만나이  -- CURDATE: 현재 날짜 , CONCAT : 문자열합치기, STR_TO_DATE:(문자열,변환할 DATE 형식)
FROM tb_professor
WHERE PROFESSOR_SSN like '_______1%'
ORDER BY 만나이;

-- 4번 문제
SELECT SUBSTRING(PROFESSOR_NAME,2,2) AS 이름
FROM tb_professor;

-- 5번 문제 
-- SUBSTRING(ENTRANCE_DATE, 1, 4)-CONCAT('19', 'SUBSTRING(STUDENT_SSN, 1, 2') > 19 ;

SELECT STUDENT_NO,
       STUDENT_NAME
FROM tb_student
WHERE (CAST(SUBSTRING(ENTRANCE_DATE, 1, 4) AS UNSIGNED) - 
       CASE 
           WHEN SUBSTRING(STUDENT_SSN, 8, 1) IN ('1', '2') THEN CAST(CONCAT('19', SUBSTRING(STUDENT_SSN, 1, 2)) AS UNSIGNED)
           WHEN SUBSTRING(STUDENT_SSN, 8, 1) IN ('3', '4') THEN CAST(CONCAT('20', SUBSTRING(STUDENT_SSN, 1, 2)) AS UNSIGNED)
       END) > 19;

-- 6번 문제
SELECT DAYNAME('2020-12-25') AS 크마요;

-- 7번 문제
SELECT STR_TO_DATE('99/10/11', '%y/%m/%d'), STR_TO_DATE('49/10/11', '%y/%m/%d');

-- 8번 문제
SELECT STR_TO_DATE('70/10/11', '%y/%m/%d'), STR_TO_DATE('69/10/11', '%y/%m/%d');

-- 9번 문제

SELECT ROUND(AVG(POINT),1) AS 평점 
FROM tb_grade
WHERE STUDENT_NO = 'A517178';

-- 10번 문제
SELECT  DEPARTMENT_NO AS 학과번호
		,COUNT(STUDENT_NAME) AS 학생수
FROM tb_student
GROUP BY DEPARTMENT_NO;

-- 11번 문제
SELECT COUNT(STUDENT_NAME) AS 'COUNT(*)'
FROM tb_student
WHERE COACH_PROFESSOR_NO IS NULL; 

-- 12번 문제

SELECT SUBSTRING(TERM_NO,1,4) AS 년도, ROUND(AVG(POINT),1) AS 학점평균
FROM tb_grade
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTRING(TERM_NO, 1, 4);

-- 13번 문제

SELECT d.DEPARTMENT_NO AS 학과코드명,
       COUNT(s.STUDENT_NAME) AS 휴학생수
FROM tb_department d
LEFT JOIN tb_student s
    ON d.DEPARTMENT_NO = s.DEPARTMENT_NO
   AND s.ABSENCE_YN = 'Y'
GROUP BY d.DEPARTMENT_NO;

-- 14번 문제
SELECT STUDENT_NAME, COUNT(STUDENT_NAME) AS 동명이인수
FROM tb_student
GROUP BY STUDENT_NAME 
HAVING COUNT(STUDENT_NAME) > 1;

-- 15 문제

-- SELECT SUBSTRING(TERM_NO,1,4) AS 년도,SUBSTRING(TERM_NO,5,2) AS 학기,ROUND(AVG(POINT),1) AS 학점평균
-- FROM tb_grade
-- WHERE STUDENT_NO ='A112113' 
-- GROUP BY SUBSTRING(TERM_NO,1,4),SUBSTRING(TERM_NO,5,2);

WITH Grade_Avg AS (
    -- 1. 학기별 학점 평균을 계산
    SELECT 
        SUBSTRING(TERM_NO, 1, 4) AS 년도,
        SUBSTRING(TERM_NO, 5, 2) AS 학기,
        ROUND(AVG(POINT), 1) AS 학점평균
    FROM tb_grade
    WHERE STUDENT_NO = 'A112113'
    GROUP BY SUBSTRING(TERM_NO, 1, 4), SUBSTRING(TERM_NO, 5, 2)
),
Yearly_Avg AS (
    -- 2. 년도별 학기 평균의 평균을 계산
    SELECT 
        년도,
        NULL AS 학기,
        ROUND(AVG(학점평균), 1) AS 학점평균
    FROM Grade_Avg
    GROUP BY 년도
),
Total_Avg AS (
    -- 3. 전체 학점 평균을 계산
    SELECT 
        NULL AS 년도,
        NULL AS 학기,
        ROUND(AVG(학점평균), 1) AS 학점평균
    FROM Grade_Avg
)

-- 4. 모든 결과를 결합하여 출력
SELECT 년도, 학기, 학점평균
FROM Grade_Avg

UNION ALL

-- 년도별 총평점 (학기 없이 출력)
SELECT 년도, 학기, 학점평균
FROM Yearly_Avg

UNION ALL

-- 전체 총평점 (년, 학기 없이 출력)
SELECT 년도, 학기, 학점평균
FROM Total_Avg

ORDER BY 년도, 학기;





