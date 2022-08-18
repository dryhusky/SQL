/* 대한민국의 도시 정보를 저장하는 테이블이다.
작성자 : 김신영*/
CREATE TABLE tCity
(
    name CHAR(10) PRIMARY KEY,  -- 도시의 이름
    area INT NULL,              -- 면적. 제곱킬로미터 단위
    popu INT NULL,              -- 인구수. 만명 단위
    metro CHAR(1) NOT NULL,     -- 광역시 여부. Y/N
    region CHAR(6) NOT NULL     -- 소속 지역
);

SELECT * FROM tCity;

COMMIT; --F11을 눌러도 된다곤 하는데 안되는 듯?
/*
주석 test
*/

ROLLBACK; --커밋 한 내용을 취소해줌

DROP TABLE tCity;

SELECT * FROM tCity; -- 한번에 삭제해버리기에 앞에 sql코드를 복붙해서 다시 만들어주자.

CREATE TABLE tStaff
(
    name CHAR (15) PRIMARY KEY, -- 직원의 이름
    depart CHAR (10) NOT NULL,  -- 부서
    gender CHAR(3) NOT NULL,    -- 성별
    joindate DATE NOT NULL,     -- 입사 날짜
    grade CHAR(10) NOT NULL,    -- 직급
    salary INT NOT NULL,        -- 월급
    score DECIMAL(5,2) NULL     -- 실적
);
SELECT * FROM tStaff;
--DROP TABLE tStaff; -- 테이블 잘못 만들었을 때 삭제

INSERT INTO tStaff VALUES ('김유신','총무부','남','2000-2-3','이사',420,88.8);
INSERT INTO tStaff VALUES ('유관순','영업부','여','2009-3-1','과장',380,NULL);
INSERT INTO tStaff VALUES ('안중근','인사과','남','2012-5-5','대리',256,76.5);
INSERT INTO tStaff VALUES ('윤봉길','영업부','남','2015-8-15','과장',350,71.25);
INSERT INTO tStaff VALUES ('강감찬','영업부','남','2018-10-9','사원',320,56.0);
INSERT INTO tStaff VALUES ('정몽주','총무부','남','2010-9-16','대리',370,89.5);
INSERT INTO tStaff VALUES ('허난설헌','인사과','여','2020-1-5','사원',285,44.5);
INSERT INTO tStaff VALUES ('신사임당','영업부','여','2013-6-19','부장',400,92.0);
INSERT INTO tStaff VALUES ('성삼문','영업부','남','2014-6-8','대리',285,87.75);
INSERT INTO tStaff VALUES ('논개','인사과','여','2010-9-16','대리',340,46.2);
INSERT INTO tStaff VALUES ('황진이','인사과','여','2012-5-5','사원',275,52.5);
INSERT INTO tStaff VALUES ('이율곡','총무부','남','2016-3-8','과장',385,65.4);
INSERT INTO tStaff VALUES ('이사부','총무부','남','2000-2-3','대리',375,50);
INSERT INTO tStaff VALUES ('안창호','영업부','남','2015-8-15','사원',370,74.2);
INSERT INTO tStaff VALUES ('을지문덕','영업부','남','2019-6-29','사원',330,NULL);
INSERT INTO tStaff VALUES ('정약용','총무부','남','2020-3-14','과장',380,69.8);
INSERT INTO tStaff VALUES ('홍길동','인사과','남','2019-8-8','차장',380,77.7);
INSERT INTO tStaff VALUES ('대조영','총무부','남','2020-7-7','차장',290,49.9);
INSERT INTO tStaff VALUES ('장보고','인사과','남','2005-4-1','부장',440,58.3);
INSERT INTO tStaff VALUES ('선덕여왕','인사과','여','2017-8-3','사원',315,45.1);

SELECT * FROM tStaff;

COMMIT; -- 테이블에 반영
--ROBACK; --직전에 반영한 테이블 정보를 제거

/*
조건문
- 필드 비교
*/
 
-- 인구가 10만명 미만인 도시의 이름 출력
SELECT name AS "도시" FROM tCity WHERE (POPU*10000)<100000;
-- 전라도에 있는 도시의 정보를 출력
SELECT region, name, area, popu, metro FROM tCity WHERE region = '전라';
-- 월급이 400만원 이상인 직원의 이름을 출력하라
SELECT name AS "직원 이름" FROM tStaff WHERE salary>=400;

/*
조건문
- NULL비교
*/
SELECT * FROM tStaff WHERE score IS NULL; -- NULL은 값이 아닌 상태이기에 = 연산자로 비교할 수 없다. 따라서 IS NULL 연산자를 따로 제공해주어 NULL을 출력할 수 있다.

SELECT * FROM tStaff WHERE score IS NOT NULL; -- IS NOT NULL은 NULL이 아닌 나머지를 출력해준다.

/*
조건문
- 논리 연산자
*/
SELECT * FROM tCity WHERE region = '경기' AND popu >= 50 OR area >= 500;

SELECT * FROM tCity WHERE region = '경기' AND (popu >= 50 OR area >= 500);

SELECT * FROM tStaff;

-- 직원 목록에서 월급이 300 미만이면서 성취도는 60 이상인 직원이 누구인지 조사하라.
SELECT name AS "직원" FROM tStaff WHERE SALARY<300 AND SCORE>=60;
-- 영업부의 여직원 이름을 조사하라.
SELECT NAME AS "영업부 여직원" FROM tStaff WHERE GENDER = '여';

/*
조건문
- LIKE
*/
SELECT * FROM tCity WHERE name LIKE '%천%';

SELECT * FROM tCity WHERE name NOT LIKE '%천%';

SELECT * FROM tCity WHERE TRIM(name) LIKE '%천'; -- TRIM()함수로 불필요한 공백을 삭제, tCity테이블의 name을 처음 선언해줄 때 고정길이 10인 CHAR타입으로 만들었기에 불필요한 공백을 삭제해줌.
-- 만약 가변길이인 VARCHAR 타입으로 선언했다면 그럴 필요가 없음.


-- 직원 목록에서 '정'씨를 조사하라.
SELECT name AS "이름이 '정'씨인 사람" FROM tStaff WHERE TRIM(name) LIKE '정%';
-- 직원 이름에 '신'자가 포함된 직원을 조사하라.
SELECT name AS "이름에 '신'자가 포함된 직원" FROM tStaff WHERE name LIKE '%신%';

/*
조건문
- BETWEEN
*/

--인구가 50~100만 사이인 도시를 구하라
SELECT * FROM tCity WHERE popu>=50 and popu<=100;
SELECT * FROM tCity WHERE popu BETWEEN 50 AND 100;

-- 직원의 이름과 입사일로 범위 검색 수행 가능
SELECT * FROM tStaff WHERE name BETWEEN '가' AND '사';
SELECT * FROM tStaff WHERE joindate BETWEEN '20150101' AND '20180101';

-- 면적 500 ~ 1000 사이인 도시 목록을 조사하여라
SELECT name AS "면적 500~1000사이 도시" FROM tCity WHERE area BETWEEN 500 AND 1000;

-- 월급이 200만원대인 직원의 목록을 구하라.
SELECT name AS "월급이 200만원대인 직원" FROM tStaff WHERE salary BETWEEN 200 AND 299;
/*
BETWEEN 연산자는 연속된 범위만 검색하는데 사용
IN 연산자는 불연속적이고 임의적인 여러 값을 조사하는데 사용
해당 연산자를 사용하는 이유는 부등호 연산자보다 가독성이 뛰어남
또한 반대조건을 만들어 넣기가 쉽다.
*/

/*
조건문
- IN
*/
SELECT * FROM tCity WHERE region IN ('경상', '전라');
SELECT * FROM tCity WHERE region ='경상' OR region = '전라';

SELECT * FROM tCity WHERE region NOT IN ('경상','전라');


--SELECT * FROM tStaff WHERE name LIKE IN ('이%', '안%'); -- LIKE와 IN을 같이 쓰는 해당 쿼리는 지원해주지 않음. 이 둘의 조합은 실무에서 잘 안쓰인다는 방증

SELECT * FROM tStaff WHERE name LIKE '이%' or name LIKE '안%';

SELECT * FROM tStaff;
--총무부나 영업부에 근무하는 직원의 목록을 조사하라.
SELECT name AS "직원" FROM tStaff WHERE DEPART IN ('총무부','영업부');
-- 인사과나 영업부에 근무하는 대리의 목록을 조사하라.
SELECT name, grade FROM tStaff WHERE DEPART IN ('인사과','영업부') AND GRADE = '대리';
--차장급 이상의 여직원 목록을 조사하라.
SELECT name, gender FROM tStaff WHERE GRADE NOT IN('사원','대리') AND GENDER = '여';

/*
정렬
- ORDER BY
*/

-- 직원 목록을 월급이 적은 사람부터 순서대로 출력하되 월급이 같다면 성취도가 높은 사람을 먼저 출력하라.
SELECT name AS "직원" FROM tStaff ORDER BY SALARY,SCORE ASC;
--SELECT * FROM Tstaff;
-- 영업부 직원을 먼저 입사한 순서대로 정렬하라
SELECT name AS "직원",  JOINDATE AS "입사한 날짜" FROM tStaff WHERE DEPART = '영업부' ORDER BY JOINDATE ASC; --WHERE을 먼저 쓰고 정렬인 ORDER BY는 마지막에 온다

SELECT ALL depart FROM tStaff; -- ALL키워드는 디폴트로 거의 쓰지 않는다.

/*
정렬
- DISTINCT
*/

SELECT DISTINCT depart FROM tStaff; -- 필드를 입력해줄 때 DISTINCT를 쓰면 중복되는 필드를 제거해준다.

-- 2020년 이후 신입 사원을 받은 적이 있는 부서 목록을 조사하라.
SELECT DISTINCT depart AS "부서" FROM tStaff WHERE JOINDATE>='20/01/01' ORDER BY depart;
SELECT DISTINCT depart AS "부서", joindate FROM tStaff WHERE JOINDATE>='20/01/01' ORDER BY depart; -- joindate를 출력해줘야하기 때문에 DISTINCT로 중복제거 해줬음에도 중복이 일어난다. 하나만 알고 싶을 때 사용하면 됨

/*
정렬
- 의사칼럼(오라클의 고유 문법)
  TOP, LIMIT는 SQL Server나 MariaDB에서만 제공해며 출력 행수를 제한해줌
*/

SELECT name, rowid, rownum FROM tCity; -- 만들지 않아도 오라클은 가짜 칼럼을 추가로 만들어 놓는다
-- ROWID는 행마다 붙이는 고유한 값, ROWNUM은 순서대로 붙이는 행번호이다. 이를 참고하여 일부 레코드만 출력할 수 있다.

SELECT * FROM tCity WHERE rownum <= 4;

SELECT * FROM tCity WHERE rownum <= 4 ORDER BY area DESC;
-- 특정 기준으로 정렬해 놓고 그 중 몇 개를 골라내는 문제는 rownum 의사 컬럼만으로는 풀 수 없기에 서브 쿼리 기법을 사용하면 된다.

-- 서브 쿼리에서 정렬을 먼저 수행하여 결과셋을 만들고 그 중에 4개를 고른다.
SELECT * FROM (SELECT * FROM tCity ORDER BY area DESC) WHERE rownum <= 4;

/*
정렬
- OFFSET FETCH
: ORDER BY 기준필드 OFFSET 건너뛸행수 ROWS FETCH NEXT 출력할행수 ROWS ONLY
일부분을 특정할려면 순서가 지정되어야 하므로 ORDER BY문이 반드시 있어야한다. OFFSET FETCH는 별도의 구문이 아니라 ORDER BY의 옵션이다.
*/

SELECT * FROM tCity ORDER BY area DESC OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY;
-- OFFSET 에 ROW를 지정하여 상위 몇 개를 건너 뛸지 지정할 수 있으며
-- FETCH 에 ROW를 지정하여 몇 개를 조사할지 정해줄 수 있다.

--직원을 월급순으로 정렬한 후 12위에서 16위까지 출력하라.
SELECT name AS"이름", salary AS"월급" FROM tStaff ORDER BY salary DESC OFFSET 11 ROWS FETCH NEXT 5 ROWS ONLY;

--SELECT name AS"이름", salary AS"월급" FROM tStaff ORDER BY salary DESC; -- 확인








