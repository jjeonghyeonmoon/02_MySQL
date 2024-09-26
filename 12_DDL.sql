-- DDL(Date Definitinon Language)
-- 데이터를 정의하는 언어
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용되는 SQL 의 부분이다.

-- CREATE
-- 테이블을 생성하기 위한 구문
-- IF NOT EXISTS <- 만약에 존재하지 않는다면
-- 위에 구문을 적용하면 기존에 존재하는 테이블이 있더라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 표현식
-- column_name / data_type(length) [NOT NULL] [DEFAULT VALUE] [AUTO_INCREMENT] column_constraint;

-- tb1 테이블 생성

CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    
)engine=InnoDB;

describe tb1;
-- engine=innodb
-- 해당하는 테이블을 InnoDB 라는 스토리지 엔진으로 만든다는 의미를 가지고 있다.
-- MySQL 에서 가장 많이 사용하는 엔진으로서
-- 데이터의 무결성,안전성, 동시성 제어를 하는 것에 적합하다.

-- 만든 테이블에 값 insert 테스트
-- insert into tb1 value(null,10,'Y'); pk 컬럼은 null 을 허용하지 않음
-- insert into tb1 value(1,null,'G'); col1 컬럼은 'Y','N' 값 외에는 허용하지 않음
insert into tb1 value(1,10,'Y');
select * from tb1; 

-- tb2 테이블 생성

CREATE TABLE IF NOT EXISTS tb2 (
	pk INT auto_increment PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    
)engine=InnoDB;

-- 잘 못 생선한 테이블 삭제하는 구문 drop
drop table tb2;

describe tb2;

-- auto_increment
-- insert 시에 pk 라고 하는 컬럼에 자동으로 번호를 발생시킨다.
-- 중복되지 않는 값을 발생시킨다.
insert into tb2 values(null,10,'Y');
insert into tb2 values(null,20,'Y');
select * from tb2; 

-- ALTER 
-- 테이블에 추가 / 변경 / 수정 / 삭제 하는 모든것은 ALTER 명령어를
-- 사용해서 적용할 수 있다.

-- 열 추가 -> 컬럼을 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
describe tb2;

-- 열 삭제 - > 컬럼 삭제
ALTER TABLE tb2 DROP column col2;
describe tb2;

-- 열 이름 변경 및 데이터 타입 변경
-- AlTER TABLE 변경할 테이블 CHANGE 기존 컬럼명 바꿀컬럼명 컬럼정의(데이터타입, 제약조건)
-- tb2 의 fk 컬럼을 change_fk로 변경, 제약조건을 not null 바꿔라

ALTER TABLE tb2 CHANGE column fk change_fk INT NOT NULL; 
describe tb2;
-- 열의 제약 조건 추가 및 삭제\
-- ALTER TABLE 테이블명 DROP 제약조건
ALTER TABLE tb2 DROP primary key;

-- auto_increment 가 걸려있는 컬럼은 primary key 제거가 되지 않는다.
-- 따라서 auto_increment 속성은 modify 로 제거한다.
-- modify는 컬럼의 정의를 바꾸는것이다.
ALTER TABLE tb2 modify pk int;
describe tb2;
ALTER TABLE tb2 DROP primary key;

-- tb3 테이블 생성

CREATE TABLE IF NOT EXISTS tb3 (
	pk INT auto_increment PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    )engine=InnoDB;
    
-- tb3 삭제
-- if exists 안전한 식을 만들 수 있다.
DROP TABLE IF EXISTS tb3;

-- tb4,5 테이블 생성

CREATE TABLE IF NOT EXISTS tb4 (
	pk INT auto_increment PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    )engine=InnoDB;
    
CREATE TABLE IF NOT EXISTS tb5 (
	pk INT auto_increment PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    )engine=InnoDB;
    
-- 동시에 테이블 삭제
DROP TABLES IF EXISTS tb4,tb5;

-- truncate // delete 
-- delete 구문을 작성을 하면
-- where 조건절로 행을 삭제
-- 조건 없이 delete 를 하면 전체 행 삭제
-- truncate 구문은 행마다 하나씩 지워주는 것이 아닌
-- 테이블 drop 후 재생성을 해주는 초기화의 개념을 가지고 있다.
-- delete 는 우리가 제어판에서 하나씩 삭제한다라고 치면
-- truncate 는 pc 초기화의 느낌이다.   

CREATE TABLE IF NOT EXISTS tb6 (
	pk INT auto_increment primary KEY,
    fk INT,
    col1 VARCHAR(255), -- 문자열 길이 지정
    CHECK(col1 IN('Y','N'))
    )engine=InnoDB; 
    
-- 초기화 확인 용 더미데이터
insert into tb6 values (null,10,'Y');
insert into tb6 values (null,20,'Y');
insert into tb6 values (null,30,'Y');
insert into tb6 values (null,40,'Y');

SELECT * FROM tb6;

-- 테이블 초기화
truncate table tb6;

SELECT * FROM tb6;

-- truncate 가 데이터를 수정하는 DML 이 아니냐 라고 할 수 있는데
-- 이 친구는 TABLE DROP 하고 CREATE 하기 때문에 테이블 구조를 변경 한 것이다.1
