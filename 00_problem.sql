-- 1번 문제
select *
from employee;

-- 2번 문제
select  EMP_ID,
		EMP_NAME
from	employee;

-- 3번 문제
select *
from employee
where DEPT_CODE = 'D9';

-- 4번 문제
select  EMP_ID,
		EMP_NAME,
        DEPT_CODE,
        SALARY
from	employee
where SALARY >='3000000';

-- 5번 문제
select  EMP_NAME,
        DEPT_CODE,
        SALARY
from employee
where DEPT_CODE = 'D6' AND SALARY > '2000000';

-- 6번 문제
select  EMP_ID,
		EMP_NAME,
        SALARY,
        BONUS
from employee
where BONUS IS NULL;

-- 7번 문제
SELECT  EMP_ID,
		EMP_NAME,
		SALARY,
        DEPT_CODE,
        JOB_CODE
FROM employee
where SALARY between '3500000' AND '5500000';

-- 8번 문제
select  EMP_ID,
		EMP_NAME,
        HIRE_DATE
from	employee
where EMP_NAME like '김%' ;

-- 9번 문제
select  EMP_NAME,
		EMP_NO,
        DEPT_CODE
from employee
where EMP_NAME like '%하%';

-- 10번 문제
select  EMP_ID,
		EMP_NAME,
		PHONE
 from employee
 where PHONE like '___9%';
 
 -- 11번 문제 
 select  EMP_ID,
		 EMP_NAME,
		 PHONE
from employee
where PHONE like '___9_______';

-- 12번 문제 
select  EMP_NAME,
		DEPT_CODE,
        SALARY
from 	employee
where	DEPT_CODE IN ('D6','D8');

-- 13 문제
select  EMP_ID,
		EMP_NAME,
		EMAIL
from	employee
where EMP_NAME NOT like '이%';

-- 14번 문제        
 select EMP_NAME,
		SALARY,
        JOB_CODE
from	employee
where JOB_CODE IN ('J2') AND SALARY > '2000000' OR JOB_CODE IN ('J7');

-- 15번 문제
select  EMP_NAME,
		SALARY,
        JOB_CODE
from	employee
where	JOB_CODE IN ('J2') OR JOB_CODE IN ('J7') AND SALARY > '2000000';        
		

        
	
        
        