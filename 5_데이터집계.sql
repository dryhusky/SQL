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

-- 데이터 삽입
INSERT INTO tCity VALUES ('서울',605,974,'y','경기');
INSERT INTO tCity VALUES ('부산',765,342,'y','경상');
INSERT INTO tCity VALUES ('오산',42,21,'n','경기');
INSERT INTO tCity VALUES ('청주',940,83,'n','충청');
INSERT INTO tCity VALUES ('전주',205,65,'n','전라');
INSERT INTO tCity VALUES ('순천',910,27,'n','전라');
INSERT INTO tCity VALUES ('춘천',1116,27,'n','강원');
INSERT INTO tCity VALUES ('홍천',1819,7,'n','강원');

/* 회사 직원들에 대한 데이터를 저장하는 테이블이다.
작성자 : 김신영*/
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

-- 데이터 삽입
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

-- 데이터베이스에 반영
COMMIT;

/*
-데이터 집계-
1. 집계함수 : 복수개의 레코드에 대해 집합적인 계산을 수행하여 합계, 평균, 분산 같은 통계 값을 산출한다.
COUNT 
개수를 세는 함수
*/

-- COUNT 함수에 필드명을 * 를 지정하면 필드에 상관없이 조건에 맞는 레코드 개수를 리턴한다. 
-- 레코드의 갯수를 세는 것이기에 이때는 예외적으로 NULL도 포함이 된다. 통계를 낼 때 COUNT(*)를 사용한다면 조심해야한다..NULL의 상태값도 갯수로 포함했기에 통계가 왜곡될 수 있담
SELECT COUNT(*) FROM tStaff;

-- COUNT함수에 계산값은 열 이름이 COUNT인데 이를 변경해줄 수 있다.
SELECT COUNT(*) AS "총 직원수" FROM tStaff;

-- WHERE절을 줘서 조건에 맞는 갯수를 산출할 수 있다.
SELECT COUNT(*) FROM tStaff WHERE salary >= 400;

SELECT COUNT(*) FROM tStaff WHERE salary >= 10000; -- 해당 값이 없으면 0을 리턴해준다.

-- COUNT(*)로 조사한 개수에 해당하는 레코드를 알고 싶으면 원하는 필드명을 대신 적는다. 월급 400만원 이상인 직원 이름 산출
SELECT name FROM tStaff WHERE salary >= 400;

SELECT COUNT(name) FROM tStaff;

SELECT COUNT(depart) FROM tStaff;

-- DISTINCT를 주면 중복을 제거하여 갯수를 산출
SELECT COUNT(DISTINCT depart) FROM tStaff;

-- COUNT함수는 NULL은 레코드 갯수에서 제외한다.
SELECT COUNT(score) FROM tStaff;

-- NULL의 갯수를 세는 방법 1) 전체갯수에서 정상적으로 산출된 갯수를 빼기
SELECT COUNT(*) - COUNT(score) FROM tStaff;
-- NULL의 갯수를 세는 방법 2) IS NILL 활용
SELECT COUNT(*) FROM tStaff WHERE score IS NULL;

-- Q 실적도 없이 놀고 있는 두 직원은 누구인지 목록을 출력하는 쿼리를 작성하라.
SELECT name FROM tStaff WHERE score IS NULL;
-- SELECT name, score FROM tStaff WHERE score < 10 or score IS NULL; -- 확인
SELECT * FROM tStaff;
-- Q 성취도가 80점 이상인 직원이 몇 명이나 되는지 조사하라.
SELECT COUNT(score) AS "성취도높은 직원수" FROM tStaff WHERE score >= 80;

/*
-데이터 집계-
1. 집계함수 : 복수개의 레코드에 대해 집합적인 계산을 수행하여 합계, 평균, 분산 같은 통계 값을 산출한다.
SUM - 총합을 구한다
AVG - 평균을 구한다
MIN - 최소값을 구한다
MAX - 최대값을 구한다
STDDEV - 표준편차를 구한다. SQL Server는 함수명이  STDEV이다.
VARIANCE - 분산을 구한다 SQL Server는 함수명이 VAR이다.
*/
SELECT * FROM tCity;

SELECT SUM(popu), AVG(popu) FROM tCity;

SELECT MIN(area), MAX(area) FROM tCity;

SELECT SUM(score), AVG(score) FROM tStaff WHERE depart = '인사과';
SELECT MIN(salary), MAX(salary) FROM tStaff WHERE depart = '영업부';

-- 집계 함수 중에 SUM()과 AVG()는 문자열 필드에 사용할 수 없다.
-- MIN()과 MAX()는 문자열이나 날짜에 대해 사용이 가능하다.

-- 다음 명령은 직원 이름중 가장 순서가 빠른 강감찬을 리턴한다.
SELECT MIN(name) FROM tStaff;
SELECT * FROM tStaff;

-- Q 여직원 중 최고 월급은 얼마인지 조사하라.
SELECT MAX(salary) AS "최고월급" FROM tStaff;

-- Q 총무부 직원이 최초로 입사한 날짜를 구하라.
SELECT MIN(joindate) AS "총무부 직원 최초입사날짜" FROM tStaff;

/*
-데이터 집계-
1. 집계함수 : 복수개의 레코드에 대해 집합적인 계산을 수행하여 합계, 평균, 분산 같은 통계 값을 산출한다.
NULL - 값을 알 수 없는 특수한 상태이다. 그래서 모든 집계 함수는 NULL을 무시하고 통계를 계산한다. 단, 예외적으로 레코드의 갯수를 세는 COUNT(*)는 NULL도 포함한다.
       어쨋거나 NULL도 레코드 자체는 존재하기 때문이다. COUNT도 인수로 필드를 지정하면 이때는 NULL을 세지 않는다.
       집계함수는 NULL을 무시한다는 것을 잘 숙지해야 엉뚱한 실수가 나오는 것을 방지할 수 있다.
       0과 NULL은 엄연히 다르다. 0은 계산을 했더니(숫자를 세었다거나) 0의 결과값이 나온 것이고
       NULL은 대상이 없어 계산을 못했거나 이것도 저것도 아닌 결정할 수 없는 상태임을 분명히 표시하는 것이 NULL이다.
*/

SELECT AVG(salary) FROM tStaff;
SELECT SUM(salary)/COUNT(*) FROM tStaff;

-- score에는 NULL값이 2개가 있다.
-- COUNT(*)는 레코드를 세기때문에 예외적으로 NULL도 갯수로 포함이 된다.
-- 따라서 계산에 포함할 수 없는 NULL이 통계에 포함이 되어 왜곡이 일어났다! 
SELECT AVG(score) FROM tStaff;
SELECT SUM(score)/COUNT(*) FROM tStaff;

-- WHERE조건에 맞는 것이 0개라 0을 반환
SELECT COUNT(*) FROM tStaff WHERE depart ='비서실';

-- WHERE조건에 맞는 MAX()함수를 계산할 수가 없기에 null이 반환
SELECT MAX(salary) FROM tStaff WHERE depart = '비서실'; --NULL은 대상이 없어 계산을 못했거나 이것도 저것도 아닌 결정할 수 없는 상태임을 분명히 표시하는 것이 NULL이다.

/*
2. 그룹핑
- GROUP BY
 앞서 집계함수는 조건에 맞는 그룹에 대한 통계를 낸다.
 그러나 부서 목록을 조사하여 각 부서마다 명령을 일일이 실행해야 하고 결과도 따로 출력되어 보기 불편하다.
 또한 집계함수와 일반 필드를 같이 적을 수 없어 필드 목록에 부서명을 한 번 더 적어야 한다.
 
 GROUP BY 함수는 기준이 되는 필드를 뒤에 적어 주면 기준 필드가 같은 레코드를 모아 통계값을 구한다.
 게다가 기준 필드는 집계 함수와 같이 쓸 수 있어 목록도 보기 좋게 출력할 수 있따.
 부서별 평균 월급을 구하려면 depart 필드 기준으로 그룹핑 한다.
*/

SELECT '영업부', AVG(salary), FROM tStaff WHERE depart = '영업부';
SELECT '총무부', AVG(salary), FROM tStaff WHERE depart = '총무부';
SELECT '인사과', AVG(salary), FROM tStaff WHERE depart = '인사과';

-- 부서별 평균 월급을 구하는데 depart 필드를 기준으로 그룹핑을 해준다.
SELECT depart, AVG(salary) FROM tStaff GROUP BY depart;

-- 그룹핑을 해줄 때 필드목록에 여러개의 집계함수를 동시에 사용할 수도 있다.
SELECT depart, COUNT(*), MAX(joindate), AVG(score) FROM tStaff GROUP BY depart;

-- Q 도시 목록에서 지역별 인구수를 구하라.
SELECT region, sum(popu) FROM tCity GROUP BY region;

/* 2. 그룹핑
- 기준필드
 
 먼저 GROUP BY의 기준 필드는 중복값이 있을 때만 의미가 있다. 레코드별로 고유한 값을 가지는 필드는 그룹핑 기준으로 부적합하며 구분이나 분류 필드가 적합하다.
 GROUP BY의 적절한 예는 학생 명부에서 학과를 기준으로 평균 나이를 계산하거나 성적 테이블에서 과목별 총점을 구하는 경우가 적절하다.
                      같은 학과에 소속된 학생이 여러 명 있고 한 과목에 대해 여러 명이 시험을 치므로 그룹 통계가 의미가 있다. 성별로 중복값이어서 그룹핑 필드로 적합하다.
*/

SELECT gender, AVG(salary) FROM tStaff GROUP BY gender;

SELECT name, SUM(salary) FROM tStaff GROUP BY name;
SELECT name FROM tStaff;

SELECT depart, gender, COUNT(*) FROM tStaff GROUP BY depart, gender;

SELECT gender, depart, COUNT(*) FROM tStaff GROUP BY gender, depart;


SELECT depart, gender, COUNT(*) FROM tStaff GROUP BY depart, gender ORDER BY depart, gender; -- ORDER BY 의 기본 Default는 ASC(오름차순)


/* 2. 그룹핑
- GROUP BY의 필드 목록

쿼리: SELECT 기준필드, 집계함수() FROM 테이블 GROUP BY 기준필드;
*/

SELECT depart, salary FROM tStaff GROUP BY depart;

SELECT SUM(salary) FROM tStaff GROUP BY depart;

SELECT depart, SUM(salary) FROM tStaff;

SELECT depart, SUM(salary) FROM tStaff GROUP BY depart;
SELECT SUM(salary) FROM tStaff;

/*그룹핑
4. HAVING

GROUP BY 앞뒤로 WHERE와 HAVING이 오고 ORDER BY는 마지막이다. 항상 이 순서를 지켜야 한다.
SELECT ... FROM ... WHERE .. GROUP BY .. HAVING ... ORDER BY
*/

SELECT depart, AVG(salary) FROM tStaff GROUP BY depart HAVING AVG(salary) >= 340;

SELECT depart, AVG(salary) FROM tStaff GROUP BY depart HAVING AVG(salary) >= 340 ORDER BY AVG(salary);

SELECT depart, AVG(salary) FROM tStaff WHERE salary > 300 GROUP BY depart;

SELECT depart, AVG(salary) FROM tStaff WHERE salary > 300 GROUP BY depart HAVING AVG(salary) >= 360 ORDER BY depart;

-- WHERE 절과 HAVING 절의 차이점 예시
SELECT depart, MAX(salary) FROM tStaff WHERE depart IN('인사과','영업부') GROUP BY depart;
SELECT depart, MAX(salary) FROM tStaff GROUP BY depart HAVING IN('인사과','영업부');
-- 두 쿼리 모두 인사과와 영업부의 최대 월급을 조사한다. 조건을 적용하는 시점은 다르지만 조건의 내용이 같아 결과가 같다.
-- 그러나 내부적인 실행 과정의 차이가 있다. WHERE 절은 집계 전에 총무부를 제외하여 꼭 필요한 계산만 한다.
-- 반면 HAVING 절은 모든 부서의 집계를 다 끝낸 후에 총무부를 제거하는 식이라 헛수고를 하는 셈이다..

-- Q 각 지역에서 가장 넓은 면적을 구하되 단 인구가 50만 이상인 도시만 대상으로 한다.
SELECT region, MAX(area) FROM tCity WHERE popu>=50 GROUP BY region;

-- Q 각 지역별 평균 면적을 구하되 평균 면적이 1000이상인 지역만 출력하라.
SELECT region, avg(area) FROM tCity GROUP BY region HAVING avg(area)>=1000;

SELECT * FROM tCity;
-- SELECT * FROM tStaff;
-- SELECT name, SUM(salary) FROM tStaff GROUP BY name;

-- SELECT SUM(salary) FROM tStaff;
















