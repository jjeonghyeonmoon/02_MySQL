-- constraints (제약 조건)
-- 테이블에 데이터가 입력 되거나 변경될 때 규칙을 정의한다.

-- not null
-- null 값 즉 비어있는 값을 허용하지 않는다. 라는 제약 조건

drop table if exists user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
		user_no INT NOT NULL,
        user_id VARCHAR(30) NOT NULL,
		user_pwd VARCHAR(40) NOT NULL,
        user_name VARCHAR(30) NOT NULL,
        gender VARCHAR(3),
        phone VARCHAR(30) NOT NULL,
        email VARCHAR(50)
)engine=innodb;

describe user_notnull;

insert into user_notnull values
(1,'user01',null,'조평훈','남','010-5518-2290','raccoon@gamil.com'),
(2,'user02','pass02','조평훈','남','010-5518-2299','racong@gamil.com');

-- unique 제약 조건
-- 중복 된 값을 허용하지 않는 제약조건
drop table if exists user_unique;
CREATE TABLE IF NOT EXISTS user_unique(
		user_no INT NOT NULL unique, 	-- NULL 허용 안하면서, 유일한 값
        user_id VARCHAR(30) NOT NULL,
		user_pwd VARCHAR(40) NOT NULL,
        user_name VARCHAR(30) NOT NULL,
        gender VARCHAR(3),
        phone VARCHAR(30) NOT NULL,
        email VARCHAR(50),
        unique(phone)  -- 이런 식으로도 제약조건 설정할 수 있다.
)engine=innodb;

describe user_unique;

-- not null + unique => primary key 가 되었네?
insert into user_unique values
(1,'user01','pass01','조평훈','남','010-5518-2290','raccoon@gamil.com'),
(2,'user02','pass02','조평순','여','010-5518-2290','raccoon@gamil.com');
-- unique 제약조건 에러 발생 (전화번호 중복됨email.)

-- primary key **
-- 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미한다.
-- 테이블에 대한 식별자 역할 -> 한 행을 식별할 수 있는 값을 의미한다.
-- unique , not null -> primary key
-- 한 테이블 당 한 개만 설정할 수 있음
-- 한개 컬럼에 설ㅈ어 할 수 있고, 여러 개의 컬럼을 묶어서 설정할 수 있다.
-- 복합키(여러 개의 pk)
select * from user_unique;

drop table if exists user_pk;
CREATE TABLE IF NOT EXISTS user_pk(
		-- user_no int primary key
        user_no INT,	-- NULL 허용 안하면서, 유일한 값
        user_id VARCHAR(30) NOT NULL,
		user_pwd VARCHAR(40) NOT NULL,
        user_name VARCHAR(30) NOT NULL,
        gender VARCHAR(3),
        phone VARCHAR(30) NOT NULL,
        email VARCHAR(50),
        PRIMARY KEY(user_no)  -- 이런 식으로도 제약조건 설정할 수 있다.
)engine=innodb;

describe user_pk;

-- foreign key (왜래키)
-- 참조(연관) 된 다른 테이블에서 제공하는 값만 사용할 수 있음
-- foreign key 제약조건에 의해 테이블 간의 관계가 형성이 될 수 있다.

-- 부모테이블 , 자식테이블
     drop table if exists user_grade;
CREATE TABLE IF NOT EXISTS user_grade(
		-- user_no int primary key
        grade_code INT primary key, 	
        grade_name VARCHAR(30) NOT NULL
		
)engine=innodb;

insert into user_grade values
(10,'일반회원'),
(20,'우수회원'),
(30,'특별회원');
select * from user_grade;

drop table if exists user_fk1;
CREATE TABLE IF NOT EXISTS user_fk1(
		-- user_no int primary key
        user_no INT PRIMARY KEY,  		
        user_id VARCHAR(30) NOT NULL,
		user_pwd VARCHAR(40) NOT NULL,
        user_name VARCHAR(30) NOT NULL,
        gender VARCHAR(3),
        phone VARCHAR(30) NOT NULL,
        email VARCHAR(50),
        grade_no INT,
        foreign key(grade_no)
        references user_grade (grade_code)
)engine=innodb;

describe user_fk1;

insert into user_fk1 values
(1,'user01','pass01','조평훈','남','010-5518-2290','raccoon@gamil.com',10),
(2,'user02','pass02','조평순','여','010-5518-2290','raccoon@gamil.com',20);
select * from user_fk1;

insert into user_fk1 values
-- error 1062 : 참조하고 있는 테이블(부모 테이블)에는 존재하지 않는 값을 집어넣을 때
-- 발생하는 에러 => foreign key
(3,'user01','pass01','조평훈','남','010-5518-2290','raccoon@gamil.com',25);

-- check 제약조건
-- 조건을 위반할 시 허용하지 않는 제약조건

drop table if exists user_check;

-- 술을 파는 사이트, 미성년자 들어오면 안된다.
-- 성별은 2가지 값만 받을 것이다. 남 or 여
CREATE TABLE IF NOT EXISTS user_check(
		-- user_no int primary key
        user_no INT AUTO_INCREMENT PRIMARY KEY,  		
        user_name VARCHAR(30) NOT NULL,
        gender VARCHAR(3) check(gender in ('남','여')),
		age INT check(age >= 19)
)engine=innodb;

describe user_check;

insert into user_check values
(null,'홍길동','남',25),
(null,'하츄핑','여',7);

describe user_check;

-- default
-- nullable 한 컬럼에 비어있는 값 대신 우리가 설정한 기본값 적용

drop table if exists user_country;
CREATE TABLE IF NOT EXISTS user_country(		
        country_code INT AUTO_INCREMENT PRIMARY KEY,  		
        country_name VARCHAR(255) default '한국',
        population VARCHAR(255) default '0명', 
		add_time DATETIME default(current_time()),
		add_day DATE default(current_date())
)engine=innodb;

insert into user_country value
(null,default,default,default,default);

select * from user_country;

