-- 1번 문제 
SELECT  EMP_NAME AS 사원명
		,substring(EMP_NO,1,2) AS 생년
        ,substring(EMP_NO,3,2)AS 생월
        ,substring(EMP_NO,5,2)AS 생일
FROM employee;

-- 2번 문제
SELECT   substring(HIRE_DATE,1,4) AS 입사년도
		,substring(HIRE_DATE,6,2) AS 입사월
        ,substring(HIRE_DATE,9,2) AS 입사일
FROM employee;        

-- 3번 문제
SELECT *
FROM employee
WHERE substring(EMP_NO,8,1) = 2;

-- 4번 문제
SELECT   EMP_NAME
		, REPLACE(EMP_NO,substring(EMP_NO,8,7),'*******')
FROM employee;

-- 5번문제
SELECT  EMP_NAME
	   ,SUBSTRING_INDEX(EMAIL,'@',1)
FROM employee;

-- 6번 문제

SELECT   EMP_NAME
		,ADDDATE(HIRE_DATE, INTERVAL 6 MONTH)
FROM  employee;       
        
-- 7번 문제

SELECT EMP_NAME
FROM  employee  
WHERE DATEDIFF(NOW(),HIRE_DATE) >= 7300;

-- 8번 문제
SELECT   EMP_NAME
		,HIRE_DATE
		,DATEDIFF(LAST_DAY(HIRE_DATE),HIRE_DATE) + 1 AS '입사한 월의 근무일수'
FROM employee;      