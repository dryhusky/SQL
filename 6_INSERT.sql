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

SELECT * FROM tCity;

-- Q 도시 목록에 용인을 삽입하라. 면적 293에 인구 98만이되 데이터는 임의값을 써도 상관없다.
INSERT INTO tCity (NAME, AREA, POPU, METRO, REGION) VALUES
('용인', 293, 98, 'n', '경기');
-- SELECT * FROM tCity;
 
-- Q 직원 목록에 자신의 신상을 삽입해보아라.
INSERT INTO tStaff(name, depart, gender, joindate, grade, salary, score) VALUES
('김신영','인사부','남','22/08/19','사원',333,66);
-- SELECT * FROM tStaff ORDER BY joindate DESC;

-- Q 도시 목록에 이천(461Km, 21만)과 대구(883Km, 248만), 영월(1127Km,4만)을 삽입하라.
/*
다음은 확장된 INSERT문으로 MySQL이나 MariaDB, SQL Server 등이 지원해주나
Oracle은 확장된 INSERT문을 지원해주지 않아서 쓸 수 없다.

INSERT INTO tCity (NAME, AREA, POPU, METRO, REGION) VALUES
('이천',461,21,'n','경기'),
('대구',883,248,'y','경상'),
('영월',1127,4,'n','강원');
*/
INSERT INTO tCity VALUES
('이천',461,21,'n','경기');

INSERT INTO tCity VALUES
('대구',883,248,'y','경상');

INSERT INTO tCity VALUES
('영월',1127,4,'n','강원');

-- SELECT * FROM tCity;


/* 
INSERT SELECT

쿼리형식: 
INSERT INTO 대상테이블(필드목록) SELECT 필드목록 FROM 원본테이블

원래라면 VALUES 자리인데 SELECT를 넣음으로써 조회되는 테이블 자료들을 INSERT INTO의 값으로써 넣는다.

*/
INSERT INTO tStaff(name, depart, gender, joindate, grade, salary, score) SELECT
name, region, metro, '20220820','신입', area, popu FROM tCity WHERE region='경기';

-- SELECT * FROM tStaff ORDER BY joindate DESC;

/*
CREATE SELECT 
쿼리: CREATE TABLE 대상테이블 AS SELECT 필드목록 FROM 원본테이블

INSERT SELECT와 유사하되 기존 테이블에 삽입하는 게 아니라
새로운 테이블을 만들어서 결과셋을 삽입한다는 점이 다르다.

데이터의 사본을 만들 때 주로 사용된다.
단, SELECT의 결과 셋만으로는 기본키에 대한 정보나 제약 조건까지 알아낼 수 없기 때문에
사본은 데이터만 복사가 된다.
*/

CREATE TABLE tSudo AS SELECT name, area, popu FROM tCity WHERE region='경기';

SELECT * FROM tSudo;

--drop table tCity;
--drop table tStaff;
--drop table tSudo;

SELECT * INTO tCityCopy FROM tCity;

CREATE TABLE tStaff_save AS SELECT * FROM tStaff;
-- 테이블을 백업할 때 관행상 날짜를 명시해두나 여기선 하지 않았따

SELECT * FROM tStaff;
-- Q 성취도가 80점 이상인 직원만 골라 이름과 월급에 대한 보고서를 별도의 테이블로 작성하라.
CREATE TABLE score80up_table_1 AS SELECT name AS "이름",salary AS "월급" FROM tStaff WHERE score>=80;
SELECT * FROM score80up_table_1;
DROP TABLE score80up_table_1;

--pratice

CREATE TABLE test1_0820 AS SELECT name AS "이름", score FROM tStaff WHERE score>90;
SELECT * FROM test1_0820;
DROP TABLE test1_0820;
/*
주로 WHERE절과 같이 사용하며 레코드 삭제
DELETE 

테이블 삭제
DROP

DELETE FROM '테이블'로 모든 레코드를 삭제시 하나씩 지우고 로그도 남기기에 느리다. 테이블의 레코드를 모두 삭제하는 거라면 다음 명령어가 빠름
TRUNCATE

쿼리: DELETE FROM 테이블 WHERE 조건 

INSERT는 전치사 INTO를 쓰는데 DELETE는 전치사 FROM을 쓴다.
주로 특정 조건을 만족하는 레코드를 삭제하기 때문에 뒤에 WHERE 조건이 항상 뒤따라 온다.
*/

-- DELETE FROM tCity WHERE region = '경기';
SELECT * FROM tCity;

-- Q 영업부 직원을 전부 해고시켜 보자.
CREATE TABLE tStaff_sample_DB AS SELECT * FROM tStaff; -- 혹시모르니 임시 DB생성
SELECT * FROM tStaff_sample_DB; -- 임시 DB확인
-- DELETE FROM tStaff_sample_DB WHERE depart = '영업부'; -- 임시DB의 영업부 전부 해고

SELECT * FROM tStaff_sample_DB; -- 임시DB 결과 확인

-- DELETE는 레코드를 삭제해주는 명령이지만 DB 테이블 이름을 주게 되면 해당 테이블을 삭제시켜버린다. 항상 WHERE로 조건을 주지만 혹시나 사용할 때 주의가 필요함
-- 따라서 SELECT로 삭제할 데이터 조회를 먼저 하고 해당 데이터가 맞다면 DELETE로 삭제하는 것이 안전하다
-- 그리고 DELETE문은 항상 주석이나 삭제해놓는 것이 안전하다. 혹여나 모든 쿼리를 실행해버리는 바람에 의도치않게 삭제가 될 수 있기 때문이다

-- TIP) 다음과 같이 쿼리를 선언하여 드레그하여 실행하면 안전하다.

-- DELETE
-- SELECT *
FROM tStaff_sample_DB WHERE grade = '과장';

/* TRANCATE 

DELETE FROM 테이블 로 모든 레코드를 삭제시 하나씩 지우고 로그도 남기기에 느리다. 테이블의 레코드를 모두 삭제하는 거라면 다음 명령어가 빠름
임시영역에 로그를 남기지 않아 빠르지만 ROLLBACK으로도 취소할 수 없다.
테이블을 초기화할 때 주로 사용.. 그 후 create로 테이블을 만들지 않고 insert into 로 새로 데이터를 넣어주기만 하면 된다

쿼리 : TRUNCATE TABLE 테이블
*/

/* 갱신
UPDATE

레코드의 필드 값을 변경할 때는 UPDATE 명령을 사용한다.

쿼리 : UPDATE 테이블 SET 필드 = 값 [,필드 = 값] WHERE 조건
SET 뒤에 필드=값을 쓰고 ,로 복수개의 대입문을 적어 한꺼번에 변경해줄 수 있다.

WHERE절에는 비교 연산자, BETWEEN, IN, LIKE 등의 연산자를 모두 사용할 수 있다.

*/
SELECT * FROM tCity;
/*INSERT INTO tCity VALUES ('서울',605,974,'y','경기');
INSERT INTO tCity VALUES ('오산',42,21,'n','경기');*/

UPDATE tCity SET popu=1000, region ='충청' WHERE name = '서울';
commit;

-- 만약 다음처럼 WHERE절을 주지 않으면 전체 도시와 인구수가 한꺼번에 바꿔버린다. 조심해야함
-- UPDATE tCity SET popu=1000, region ='충청'; 
-- rollback;

-- SET 문에는 보통 필드 상수를 입력하는데 필드끼리의 연산도 가능하다.
UPDATE tCity SET popu = popu*2 WHERE name = '오산';
SELECT * FROM tCity;

-- Q 여자 사원급을 모두 대리로 진급시켜라
SELECT * FROM tStaff;
UPDATE tStaff SET grade='대리' WHERE gender='여' AND grade = '사원';
SELECT * FROM tStaff WHERE gender='여';

-- Q 영업부 직원의 월급을 10%씩 인상하라.
UPDATE tStaff SET salary = salary+(salary*0.1) WHERE depart = '영업부';

/*CRUD

데이터를 관리하는 4개의 쿼리를 CRUD라고 한다.

SELECT 필드목록 FROM 테이블 WHERE 조건 ORDER BY 정렬기준
INSERT INTO 테이블 (필드목록) VALUES (값목록)
DELETE FROM 테이블 WHERE 조건
UPDATE 테이블 SET 필드=값, 필드=값, ... WHERE 조건


*/