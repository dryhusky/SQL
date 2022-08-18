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

SELECT * FROM tCity;

COMMIT; --F11�� ������ �ȴٰ� �ϴµ� �ȵǴ� ��?
/*
�ּ� test
*/

ROLLBACK; --Ŀ�� �� ������ �������

DROP TABLE tCity;

SELECT * FROM tCity; -- �ѹ��� �����ع����⿡ �տ� sql�ڵ带 �����ؼ� �ٽ� ���������.

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
SELECT * FROM tStaff;
--DROP TABLE tStaff; -- ���̺� �߸� ������� �� ����

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

SELECT * FROM tStaff;

COMMIT; -- ���̺� �ݿ�
--ROBACK; --������ �ݿ��� ���̺� ������ ����

/*
���ǹ�
- �ʵ� ��
*/
 
-- �α��� 10���� �̸��� ������ �̸� ���
SELECT name AS "����" FROM tCity WHERE (POPU*10000)<100000;
-- ���󵵿� �ִ� ������ ������ ���
SELECT region, name, area, popu, metro FROM tCity WHERE region = '����';
-- ������ 400���� �̻��� ������ �̸��� ����϶�
SELECT name AS "���� �̸�" FROM tStaff WHERE salary>=400;

/*
���ǹ�
- NULL��
*/
SELECT * FROM tStaff WHERE score IS NULL; -- NULL�� ���� �ƴ� �����̱⿡ = �����ڷ� ���� �� ����. ���� IS NULL �����ڸ� ���� �������־� NULL�� ����� �� �ִ�.

SELECT * FROM tStaff WHERE score IS NOT NULL; -- IS NOT NULL�� NULL�� �ƴ� �������� ������ش�.

/*
���ǹ�
- �� ������
*/
SELECT * FROM tCity WHERE region = '���' AND popu >= 50 OR area >= 500;

SELECT * FROM tCity WHERE region = '���' AND (popu >= 50 OR area >= 500);

SELECT * FROM tStaff;

-- ���� ��Ͽ��� ������ 300 �̸��̸鼭 ���뵵�� 60 �̻��� ������ �������� �����϶�.
SELECT name AS "����" FROM tStaff WHERE SALARY<300 AND SCORE>=60;
-- �������� ������ �̸��� �����϶�.
SELECT NAME AS "������ ������" FROM tStaff WHERE GENDER = '��';

/*
���ǹ�
- LIKE
*/
SELECT * FROM tCity WHERE name LIKE '%õ%';

SELECT * FROM tCity WHERE name NOT LIKE '%õ%';

SELECT * FROM tCity WHERE TRIM(name) LIKE '%õ'; -- TRIM()�Լ��� ���ʿ��� ������ ����, tCity���̺��� name�� ó�� �������� �� �������� 10�� CHARŸ������ ������⿡ ���ʿ��� ������ ��������.
-- ���� ���������� VARCHAR Ÿ������ �����ߴٸ� �׷� �ʿ䰡 ����.


-- ���� ��Ͽ��� '��'���� �����϶�.
SELECT name AS "�̸��� '��'���� ���" FROM tStaff WHERE TRIM(name) LIKE '��%';
-- ���� �̸��� '��'�ڰ� ���Ե� ������ �����϶�.
SELECT name AS "�̸��� '��'�ڰ� ���Ե� ����" FROM tStaff WHERE name LIKE '%��%';

/*
���ǹ�
- BETWEEN
*/

--�α��� 50~100�� ������ ���ø� ���϶�
SELECT * FROM tCity WHERE popu>=50 and popu<=100;
SELECT * FROM tCity WHERE popu BETWEEN 50 AND 100;

-- ������ �̸��� �Ի��Ϸ� ���� �˻� ���� ����
SELECT * FROM tStaff WHERE name BETWEEN '��' AND '��';
SELECT * FROM tStaff WHERE joindate BETWEEN '20150101' AND '20180101';

-- ���� 500 ~ 1000 ������ ���� ����� �����Ͽ���
SELECT name AS "���� 500~1000���� ����" FROM tCity WHERE area BETWEEN 500 AND 1000;

-- ������ 200�������� ������ ����� ���϶�.
SELECT name AS "������ 200�������� ����" FROM tStaff WHERE salary BETWEEN 200 AND 299;
/*
BETWEEN �����ڴ� ���ӵ� ������ �˻��ϴµ� ���
IN �����ڴ� �ҿ������̰� �������� ���� ���� �����ϴµ� ���
�ش� �����ڸ� ����ϴ� ������ �ε�ȣ �����ں��� �������� �پ
���� �ݴ������� ����� �ֱⰡ ����.
*/

/*
���ǹ�
- IN
*/
SELECT * FROM tCity WHERE region IN ('���', '����');
SELECT * FROM tCity WHERE region ='���' OR region = '����';

SELECT * FROM tCity WHERE region NOT IN ('���','����');


--SELECT * FROM tStaff WHERE name LIKE IN ('��%', '��%'); -- LIKE�� IN�� ���� ���� �ش� ������ ���������� ����. �� ���� ������ �ǹ����� �� �Ⱦ��δٴ� ����

SELECT * FROM tStaff WHERE name LIKE '��%' or name LIKE '��%';

SELECT * FROM tStaff;
--�ѹ��γ� �����ο� �ٹ��ϴ� ������ ����� �����϶�.
SELECT name AS "����" FROM tStaff WHERE DEPART IN ('�ѹ���','������');
-- �λ���� �����ο� �ٹ��ϴ� �븮�� ����� �����϶�.
SELECT name, grade FROM tStaff WHERE DEPART IN ('�λ��','������') AND GRADE = '�븮';
--����� �̻��� ������ ����� �����϶�.
SELECT name, gender FROM tStaff WHERE GRADE NOT IN('���','�븮') AND GENDER = '��';

/*
����
- ORDER BY
*/

-- ���� ����� ������ ���� ������� ������� ����ϵ� ������ ���ٸ� ���뵵�� ���� ����� ���� ����϶�.
SELECT name AS "����" FROM tStaff ORDER BY SALARY,SCORE ASC;
--SELECT * FROM Tstaff;
-- ������ ������ ���� �Ի��� ������� �����϶�
SELECT name AS "����",  JOINDATE AS "�Ի��� ��¥" FROM tStaff WHERE DEPART = '������' ORDER BY JOINDATE ASC; --WHERE�� ���� ���� ������ ORDER BY�� �������� �´�

SELECT ALL depart FROM tStaff; -- ALLŰ����� ����Ʈ�� ���� ���� �ʴ´�.

/*
����
- DISTINCT
*/

SELECT DISTINCT depart FROM tStaff; -- �ʵ带 �Է����� �� DISTINCT�� ���� �ߺ��Ǵ� �ʵ带 �������ش�.

-- 2020�� ���� ���� ����� ���� ���� �ִ� �μ� ����� �����϶�.
SELECT DISTINCT depart AS "�μ�" FROM tStaff WHERE JOINDATE>='20/01/01' ORDER BY depart;
SELECT DISTINCT depart AS "�μ�", joindate FROM tStaff WHERE JOINDATE>='20/01/01' ORDER BY depart; -- joindate�� ���������ϱ� ������ DISTINCT�� �ߺ����� ���������� �ߺ��� �Ͼ��. �ϳ��� �˰� ���� �� ����ϸ� ��

/*
����
- �ǻ�Į��(����Ŭ�� ���� ����)
  TOP, LIMIT�� SQL Server�� MariaDB������ �����ظ� ��� ����� ��������
*/

SELECT name, rowid, rownum FROM tCity; -- ������ �ʾƵ� ����Ŭ�� ��¥ Į���� �߰��� ����� ���´�
-- ROWID�� �ึ�� ���̴� ������ ��, ROWNUM�� ������� ���̴� ���ȣ�̴�. �̸� �����Ͽ� �Ϻ� ���ڵ常 ����� �� �ִ�.

SELECT * FROM tCity WHERE rownum <= 4;

SELECT * FROM tCity WHERE rownum <= 4 ORDER BY area DESC;
-- Ư�� �������� ������ ���� �� �� �� ���� ��󳻴� ������ rownum �ǻ� �÷������δ� Ǯ �� ���⿡ ���� ���� ����� ����ϸ� �ȴ�.

-- ���� �������� ������ ���� �����Ͽ� ������� ����� �� �߿� 4���� ����.
SELECT * FROM (SELECT * FROM tCity ORDER BY area DESC) WHERE rownum <= 4;

/*
����
- OFFSET FETCH
: ORDER BY �����ʵ� OFFSET �ǳʶ���� ROWS FETCH NEXT �������� ROWS ONLY
�Ϻκ��� Ư���ҷ��� ������ �����Ǿ�� �ϹǷ� ORDER BY���� �ݵ�� �־���Ѵ�. OFFSET FETCH�� ������ ������ �ƴ϶� ORDER BY�� �ɼ��̴�.
*/

SELECT * FROM tCity ORDER BY area DESC OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY;
-- OFFSET �� ROW�� �����Ͽ� ���� �� ���� �ǳ� ���� ������ �� ������
-- FETCH �� ROW�� �����Ͽ� �� ���� �������� ������ �� �ִ�.

--������ ���޼����� ������ �� 12������ 16������ ����϶�.
SELECT name AS"�̸�", salary AS"����" FROM tStaff ORDER BY salary DESC OFFSET 11 ROWS FETCH NEXT 5 ROWS ONLY;

--SELECT name AS"�̸�", salary AS"����" FROM tStaff ORDER BY salary DESC; -- Ȯ��








