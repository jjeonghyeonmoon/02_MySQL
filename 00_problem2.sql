use employee;
-- 1번 문제
select   E.EMP_ID
		,E.EMP_NAME
        ,J.JOB_NAME
        ,D.DEPT_TITLE
        ,L.LOCAL_NAME
        ,E.SALARY
from job J join employee E on J.JOB_CODE = E.JOB_CODE
	  		join department D on E.DEPT_CODE = D.DEPT_ID
			join location L on D.LOCATION_ID = L.LOCAL_CODE
where J.JOB_NAME ='대리' and L.LOCAL_NAME like '%ASIA%'; 

-- 2번 문제
select E.EMP_NAME
	  ,E.EMP_NO
      ,D.DEPT_TITLE
      ,J.JOB_NAME
from  job J join employee E on J.JOB_CODE = E.JOB_CODE
	  		join department D on E.DEPT_CODE = D.DEPT_ID
where E.EMP_NO like '7%' and E.EMP_NO like '_______2%' and EMP_NAME like '전%';

-- 3번 문제
select E.EMP_ID
	  ,E.EMP_NAME
      ,J.JOB_NAME
from job J join employee E on J.JOB_CODE = E.JOB_CODE
where EMP_NAME like '%형%';

-- 4번 문제
select  E.EMP_NAME
		,J.JOB_NAME
		,E.DEPT_CODE
		,D.DEPT_TITLE
from job J join employee E on J.JOB_CODE = E.JOB_CODE
	  		join department D on E.DEPT_CODE = D.DEPT_ID
where D.DEPT_TITLE like '%해외영업%';

-- 5번문제

select  E.EMP_NAME
		,E.BONUS
        ,D.DEPT_TITLE
        ,L.LOCAL_NAME
from   employee E join department D on E.DEPT_CODE = D.DEPT_ID
			      join location L on D.LOCATION_ID = L.LOCAL_CODE   
where BONUS IS NOT NULL;

-- 6번 문제
select  E.EMP_NAME
		,J.JOB_NAME
	    ,D.DEPT_TITLE
        ,L.LOCAL_NAME
from job J join employee E on J.JOB_CODE = E.JOB_CODE
	  		join department D on E.DEPT_CODE = D.DEPT_ID
			join location L on D.LOCATION_ID = L.LOCAL_CODE
where DEPT_ID = 'D2';

-- 7번 문제




