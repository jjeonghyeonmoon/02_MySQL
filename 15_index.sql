create table phone (
	    phone_code INT PRIMARY KEY,
        phone_name VARCHAR(100),
        phone_price DECIMAL(10,2)
)engine=innodb;

-- decimal : spl 에서 숫자 값을 정밀하게 저장하기 위해서 사용한다.
-- 소숫점을 다룰 때 유용하다.
-- 1번째 인자 : 정밀도, 전체 숫자의 최대 자릿수를 의미 소숫점 앞뒤 포함
-- 2번째 인자 : 소숫점 아래 올 수 있는 최대 자리수 의미

INSERT INTO phone VALUES 
(1,'갤럭시S24울트라',1200000),
(2,'갤럭시Z폴트6',2250000),
(3,'갤럭시Z플립6',1400000);

SELECT * FROM phone;

-- explain (설명)
-- 우리가 작성한 쿼리문의 실행 계획을 출력해준다.
explain select * from phone where phone_name = '갤럭시S24울트라';
-- 인덱스가 없는 컬럼을 where 절의 조건으로 실행한 결과

-- index 생성 
CREATE INDEX idx_name
ON phone(phone_name);

show index from phone;

SELECT * FROM phone WHERE phone_name = '갤럭시Z폴드6';
-- 실행 계획 출력을 통해 인덱스를 통해 데이터를 빠르게 조회했는 지 확인
EXPLAIN SELECT * FROM phone WHERE phone_name = '갤럭시Z폴드6';

DROP INDEX idx_name on phone;
show index from phone;
 