/* ���ѹα��� ���� ������ �����ϴ� ���̺��̴�.
�ۼ��� : ��ſ�*/
CREATE TABLE tCity
(
    name CHAR(10) PRIMARY KEY,  -- ������ �̸�
    area INT NULL,              -- ����. ����ų�ι��� ����
    popu INT NULL,              -- �α���. ���� ����
    metro CHAR(1) NOT NULL,     -- ������ ����. Y/N
    region CHAR(6) NOT NULL     -- �Ҽ� ����
);

-- ������ ����
INSERT INTO tCity VALUES ('����',605,974,'y','���');
INSERT INTO tCity VALUES ('�λ�',765,342,'y','���');
INSERT INTO tCity VALUES ('����',42,21,'n','���');
INSERT INTO tCity VALUES ('û��',940,83,'n','��û');
INSERT INTO tCity VALUES ('����',205,65,'n','����');
INSERT INTO tCity VALUES ('��õ',910,27,'n','����');
INSERT INTO tCity VALUES ('��õ',1116,27,'n','����');
INSERT INTO tCity VALUES ('ȫõ',1819,7,'n','����');

/* ȸ�� �����鿡 ���� �����͸� �����ϴ� ���̺��̴�.
�ۼ��� : ��ſ�*/
CREATE TABLE tStaff
(
    name CHAR (15) PRIMARY KEY, -- ������ �̸�
    depart CHAR (10) NOT NULL,  -- �μ�
    gender CHAR(3) NOT NULL,    -- ����
    joindate DATE NOT NULL,     -- �Ի� ��¥
    grade CHAR(10) NOT NULL,    -- ����
    salary INT NOT NULL,        -- ����
    score DECIMAL(5,2) NULL     -- ����
);

-- ������ ����
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2000-2-3','�̻�',420,88.8);
INSERT INTO tStaff VALUES ('������','������','��','2009-3-1','����',380,NULL);
INSERT INTO tStaff VALUES ('���߱�','�λ��','��','2012-5-5','�븮',256,76.5);
INSERT INTO tStaff VALUES ('������','������','��','2015-8-15','����',350,71.25);
INSERT INTO tStaff VALUES ('������','������','��','2018-10-9','���',320,56.0);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2010-9-16','�븮',370,89.5);
INSERT INTO tStaff VALUES ('�㳭����','�λ��','��','2020-1-5','���',285,44.5);
INSERT INTO tStaff VALUES ('�Ż��Ӵ�','������','��','2013-6-19','����',400,92.0);
INSERT INTO tStaff VALUES ('���﹮','������','��','2014-6-8','�븮',285,87.75);
INSERT INTO tStaff VALUES ('��','�λ��','��','2010-9-16','�븮',340,46.2);
INSERT INTO tStaff VALUES ('Ȳ����','�λ��','��','2012-5-5','���',275,52.5);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2016-3-8','����',385,65.4);
INSERT INTO tStaff VALUES ('�̻��','�ѹ���','��','2000-2-3','�븮',375,50);
INSERT INTO tStaff VALUES ('��âȣ','������','��','2015-8-15','���',370,74.2);
INSERT INTO tStaff VALUES ('��������','������','��','2019-6-29','���',330,NULL);
INSERT INTO tStaff VALUES ('�����','�ѹ���','��','2020-3-14','����',380,69.8);
INSERT INTO tStaff VALUES ('ȫ�浿','�λ��','��','2019-8-8','����',380,77.7);
INSERT INTO tStaff VALUES ('������','�ѹ���','��','2020-7-7','����',290,49.9);
INSERT INTO tStaff VALUES ('�庸��','�λ��','��','2005-4-1','����',440,58.3);
INSERT INTO tStaff VALUES ('��������','�λ��','��','2017-8-3','���',315,45.1);

-- �����ͺ��̽��� �ݿ�
COMMIT;

/*
-������ ����-
1. �����Լ� : �������� ���ڵ忡 ���� �������� ����� �����Ͽ� �հ�, ���, �л� ���� ��� ���� �����Ѵ�.
COUNT 
������ ���� �Լ�
*/

-- COUNT �Լ��� �ʵ���� * �� �����ϸ� �ʵ忡 ������� ���ǿ� �´� ���ڵ� ������ �����Ѵ�. 
-- ���ڵ��� ������ ���� ���̱⿡ �̶��� ���������� NULL�� ������ �ȴ�. ��踦 �� �� COUNT(*)�� ����Ѵٸ� �����ؾ��Ѵ�..NULL�� ���°��� ������ �����߱⿡ ��谡 �ְ�� �� �ִ�
SELECT COUNT(*) FROM tStaff;

-- COUNT�Լ��� ��갪�� �� �̸��� COUNT�ε� �̸� �������� �� �ִ�.
SELECT COUNT(*) AS "�� ������" FROM tStaff;

-- WHERE���� �༭ ���ǿ� �´� ������ ������ �� �ִ�.
SELECT COUNT(*) FROM tStaff WHERE salary >= 400;

SELECT COUNT(*) FROM tStaff WHERE salary >= 10000; -- �ش� ���� ������ 0�� �������ش�.

-- COUNT(*)�� ������ ������ �ش��ϴ� ���ڵ带 �˰� ������ ���ϴ� �ʵ���� ��� ���´�. ���� 400���� �̻��� ���� �̸� ����
SELECT name FROM tStaff WHERE salary >= 400;

SELECT COUNT(name) FROM tStaff;

SELECT COUNT(depart) FROM tStaff;

-- DISTINCT�� �ָ� �ߺ��� �����Ͽ� ������ ����
SELECT COUNT(DISTINCT depart) FROM tStaff;

-- COUNT�Լ��� NULL�� ���ڵ� �������� �����Ѵ�.
SELECT COUNT(score) FROM tStaff;

-- NULL�� ������ ���� ��� 1) ��ü�������� ���������� ����� ������ ����
SELECT COUNT(*) - COUNT(score) FROM tStaff;
-- NULL�� ������ ���� ��� 2) IS NILL Ȱ��
SELECT COUNT(*) FROM tStaff WHERE score IS NULL;

-- Q ������ ���� ��� �ִ� �� ������ �������� ����� ����ϴ� ������ �ۼ��϶�.
SELECT name FROM tStaff WHERE score IS NULL;
-- SELECT name, score FROM tStaff WHERE score < 10 or score IS NULL; -- Ȯ��
SELECT * FROM tStaff;
-- Q ���뵵�� 80�� �̻��� ������ �� ���̳� �Ǵ��� �����϶�.
SELECT COUNT(score) AS "���뵵���� ������" FROM tStaff WHERE score >= 80;

/*
-������ ����-
1. �����Լ� : �������� ���ڵ忡 ���� �������� ����� �����Ͽ� �հ�, ���, �л� ���� ��� ���� �����Ѵ�.
SUM - ������ ���Ѵ�
AVG - ����� ���Ѵ�
MIN - �ּҰ��� ���Ѵ�
MAX - �ִ밪�� ���Ѵ�
STDDEV - ǥ�������� ���Ѵ�. SQL Server�� �Լ�����  STDEV�̴�.
VARIANCE - �л��� ���Ѵ� SQL Server�� �Լ����� VAR�̴�.
*/
SELECT * FROM tCity;

SELECT SUM(popu), AVG(popu) FROM tCity;

SELECT MIN(area), MAX(area) FROM tCity;

SELECT SUM(score), AVG(score) FROM tStaff WHERE depart = '�λ��';
SELECT MIN(salary), MAX(salary) FROM tStaff WHERE depart = '������';

-- ���� �Լ� �߿� SUM()�� AVG()�� ���ڿ� �ʵ忡 ����� �� ����.
-- MIN()�� MAX()�� ���ڿ��̳� ��¥�� ���� ����� �����ϴ�.

-- ���� ����� ���� �̸��� ���� ������ ���� �������� �����Ѵ�.
SELECT MIN(name) FROM tStaff;
SELECT * FROM tStaff;

-- Q ������ �� �ְ� ������ ������ �����϶�.
SELECT MAX(salary) AS "�ְ����" FROM tStaff;

-- Q �ѹ��� ������ ���ʷ� �Ի��� ��¥�� ���϶�.
SELECT MIN(joindate) AS "�ѹ��� ���� �����Ի糯¥" FROM tStaff;

/*
-������ ����-
1. �����Լ� : �������� ���ڵ忡 ���� �������� ����� �����Ͽ� �հ�, ���, �л� ���� ��� ���� �����Ѵ�.
NULL - ���� �� �� ���� Ư���� �����̴�. �׷��� ��� ���� �Լ��� NULL�� �����ϰ� ��踦 ����Ѵ�. ��, ���������� ���ڵ��� ������ ���� COUNT(*)�� NULL�� �����Ѵ�.
       ��¶�ų� NULL�� ���ڵ� ��ü�� �����ϱ� �����̴�. COUNT�� �μ��� �ʵ带 �����ϸ� �̶��� NULL�� ���� �ʴ´�.
       �����Լ��� NULL�� �����Ѵٴ� ���� �� �����ؾ� ������ �Ǽ��� ������ ���� ������ �� �ִ�.
       0�� NULL�� ������ �ٸ���. 0�� ����� �ߴ���(���ڸ� �����ٰų�) 0�� ������� ���� ���̰�
       NULL�� ����� ���� ����� ���߰ų� �̰͵� ���͵� �ƴ� ������ �� ���� �������� �и��� ǥ���ϴ� ���� NULL�̴�.
*/

SELECT AVG(salary) FROM tStaff;
SELECT SUM(salary)/COUNT(*) FROM tStaff;

-- score���� NULL���� 2���� �ִ�.
-- COUNT(*)�� ���ڵ带 ���⶧���� ���������� NULL�� ������ ������ �ȴ�.
-- ���� ��꿡 ������ �� ���� NULL�� ��迡 ������ �Ǿ� �ְ��� �Ͼ��! 
SELECT AVG(score) FROM tStaff;
SELECT SUM(score)/COUNT(*) FROM tStaff;

-- WHERE���ǿ� �´� ���� 0���� 0�� ��ȯ
SELECT COUNT(*) FROM tStaff WHERE depart ='�񼭽�';

-- WHERE���ǿ� �´� MAX()�Լ��� ����� ���� ���⿡ null�� ��ȯ
SELECT MAX(salary) FROM tStaff WHERE depart = '�񼭽�'; --NULL�� ����� ���� ����� ���߰ų� �̰͵� ���͵� �ƴ� ������ �� ���� �������� �и��� ǥ���ϴ� ���� NULL�̴�.

/*
2. �׷���
- GROUP BY
 �ռ� �����Լ��� ���ǿ� �´� �׷쿡 ���� ��踦 ����.
 �׷��� �μ� ����� �����Ͽ� �� �μ����� ����� ������ �����ؾ� �ϰ� ����� ���� ��µǾ� ���� �����ϴ�.
 ���� �����Լ��� �Ϲ� �ʵ带 ���� ���� �� ���� �ʵ� ��Ͽ� �μ����� �� �� �� ����� �Ѵ�.
 
 GROUP BY �Լ��� ������ �Ǵ� �ʵ带 �ڿ� ���� �ָ� ���� �ʵ尡 ���� ���ڵ带 ��� ��谪�� ���Ѵ�.
 �Դٰ� ���� �ʵ�� ���� �Լ��� ���� �� �� �־� ��ϵ� ���� ���� ����� �� �ֵ�.
 �μ��� ��� ������ ���Ϸ��� depart �ʵ� �������� �׷��� �Ѵ�.
*/

SELECT '������', AVG(salary), FROM tStaff WHERE depart = '������';
SELECT '�ѹ���', AVG(salary), FROM tStaff WHERE depart = '�ѹ���';
SELECT '�λ��', AVG(salary), FROM tStaff WHERE depart = '�λ��';

-- �μ��� ��� ������ ���ϴµ� depart �ʵ带 �������� �׷����� ���ش�.
SELECT depart, AVG(salary) FROM tStaff GROUP BY depart;

-- �׷����� ���� �� �ʵ��Ͽ� �������� �����Լ��� ���ÿ� ����� ���� �ִ�.
SELECT depart, COUNT(*), MAX(joindate), AVG(score) FROM tStaff GROUP BY depart;

-- Q ���� ��Ͽ��� ������ �α����� ���϶�.
SELECT region, sum(popu) FROM tCity GROUP BY region;

/* 2. �׷���
- �����ʵ�
 
 ���� GROUP BY�� ���� �ʵ�� �ߺ����� ���� ���� �ǹ̰� �ִ�. ���ڵ庰�� ������ ���� ������ �ʵ�� �׷��� �������� �������ϸ� �����̳� �з� �ʵ尡 �����ϴ�.
 GROUP BY�� ������ ���� �л� ��ο��� �а��� �������� ��� ���̸� ����ϰų� ���� ���̺��� ���� ������ ���ϴ� ��찡 �����ϴ�.
                      ���� �а��� �Ҽӵ� �л��� ���� �� �ְ� �� ���� ���� ���� ���� ������ ġ�Ƿ� �׷� ��谡 �ǹ̰� �ִ�. ������ �ߺ����̾ �׷��� �ʵ�� �����ϴ�.
*/

SELECT gender, AVG(salary) FROM tStaff GROUP BY gender;

SELECT name, SUM(salary) FROM tStaff GROUP BY name;
SELECT name FROM tStaff;

SELECT depart, gender, COUNT(*) FROM tStaff GROUP BY depart, gender;

SELECT gender, depart, COUNT(*) FROM tStaff GROUP BY gender, depart;


SELECT depart, gender, COUNT(*) FROM tStaff GROUP BY depart, gender ORDER BY depart, gender; -- ORDER BY �� �⺻ Default�� ASC(��������)


/* 2. �׷���
- GROUP BY�� �ʵ� ���

����: SELECT �����ʵ�, �����Լ�() FROM ���̺� GROUP BY �����ʵ�;
*/

SELECT depart, salary FROM tStaff GROUP BY depart;

SELECT SUM(salary) FROM tStaff GROUP BY depart;

SELECT depart, SUM(salary) FROM tStaff;

SELECT depart, SUM(salary) FROM tStaff GROUP BY depart;
SELECT SUM(salary) FROM tStaff;

/*�׷���
4. HAVING

GROUP BY �յڷ� WHERE�� HAVING�� ���� ORDER BY�� �������̴�. �׻� �� ������ ���Ѿ� �Ѵ�.
SELECT ... FROM ... WHERE .. GROUP BY .. HAVING ... ORDER BY
*/

SELECT depart, AVG(salary) FROM tStaff GROUP BY depart HAVING AVG(salary) >= 340;

SELECT depart, AVG(salary) FROM tStaff GROUP BY depart HAVING AVG(salary) >= 340 ORDER BY AVG(salary);

SELECT depart, AVG(salary) FROM tStaff WHERE salary > 300 GROUP BY depart;

SELECT depart, AVG(salary) FROM tStaff WHERE salary > 300 GROUP BY depart HAVING AVG(salary) >= 360 ORDER BY depart;

-- WHERE ���� HAVING ���� ������ ����
SELECT depart, MAX(salary) FROM tStaff WHERE depart IN('�λ��','������') GROUP BY depart;
SELECT depart, MAX(salary) FROM tStaff GROUP BY depart HAVING IN('�λ��','������');
-- �� ���� ��� �λ���� �������� �ִ� ������ �����Ѵ�. ������ �����ϴ� ������ �ٸ����� ������ ������ ���� ����� ����.
-- �׷��� �������� ���� ������ ���̰� �ִ�. WHERE ���� ���� ���� �ѹ��θ� �����Ͽ� �� �ʿ��� ��길 �Ѵ�.
-- �ݸ� HAVING ���� ��� �μ��� ���踦 �� ���� �Ŀ� �ѹ��θ� �����ϴ� ���̶� ����� �ϴ� ���̴�..

-- Q �� �������� ���� ���� ������ ���ϵ� �� �α��� 50�� �̻��� ���ø� ������� �Ѵ�.
SELECT region, MAX(area) FROM tCity WHERE popu>=50 GROUP BY region;

-- Q �� ������ ��� ������ ���ϵ� ��� ������ 1000�̻��� ������ ����϶�.
SELECT region, avg(area) FROM tCity GROUP BY region HAVING avg(area)>=1000;

SELECT * FROM tCity;
-- SELECT * FROM tStaff;
-- SELECT name, SUM(salary) FROM tStaff GROUP BY name;

-- SELECT SUM(salary) FROM tStaff;
















