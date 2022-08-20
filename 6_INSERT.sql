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

SELECT * FROM tCity;

-- Q ���� ��Ͽ� ������ �����϶�. ���� 293�� �α� 98���̵� �����ʹ� ���ǰ��� �ᵵ �������.
INSERT INTO tCity (NAME, AREA, POPU, METRO, REGION) VALUES
('����', 293, 98, 'n', '���');
-- SELECT * FROM tCity;
 
-- Q ���� ��Ͽ� �ڽ��� �Ż��� �����غ��ƶ�.
INSERT INTO tStaff(name, depart, gender, joindate, grade, salary, score) VALUES
('��ſ�','�λ��','��','22/08/19','���',333,66);
-- SELECT * FROM tStaff ORDER BY joindate DESC;

-- Q ���� ��Ͽ� ��õ(461Km, 21��)�� �뱸(883Km, 248��), ����(1127Km,4��)�� �����϶�.
/*
������ Ȯ��� INSERT������ MySQL�̳� MariaDB, SQL Server ���� �������ֳ�
Oracle�� Ȯ��� INSERT���� ���������� �ʾƼ� �� �� ����.

INSERT INTO tCity (NAME, AREA, POPU, METRO, REGION) VALUES
('��õ',461,21,'n','���'),
('�뱸',883,248,'y','���'),
('����',1127,4,'n','����');
*/
INSERT INTO tCity VALUES
('��õ',461,21,'n','���');

INSERT INTO tCity VALUES
('�뱸',883,248,'y','���');

INSERT INTO tCity VALUES
('����',1127,4,'n','����');

-- SELECT * FROM tCity;


/* 
INSERT SELECT

��������: 
INSERT INTO ������̺�(�ʵ���) SELECT �ʵ��� FROM �������̺�

������� VALUES �ڸ��ε� SELECT�� �������ν� ��ȸ�Ǵ� ���̺� �ڷ���� INSERT INTO�� �����ν� �ִ´�.

*/
INSERT INTO tStaff(name, depart, gender, joindate, grade, salary, score) SELECT
name, region, metro, '20220820','����', area, popu FROM tCity WHERE region='���';

-- SELECT * FROM tStaff ORDER BY joindate DESC;

/*
CREATE SELECT 
����: CREATE TABLE ������̺� AS SELECT �ʵ��� FROM �������̺�

INSERT SELECT�� �����ϵ� ���� ���̺� �����ϴ� �� �ƴ϶�
���ο� ���̺��� ���� ������� �����Ѵٴ� ���� �ٸ���.

�������� �纻�� ���� �� �ַ� ���ȴ�.
��, SELECT�� ��� �¸����δ� �⺻Ű�� ���� ������ ���� ���Ǳ��� �˾Ƴ� �� ���� ������
�纻�� �����͸� ���簡 �ȴ�.
*/

CREATE TABLE tSudo AS SELECT name, area, popu FROM tCity WHERE region='���';

SELECT * FROM tSudo;

--drop table tCity;
--drop table tStaff;
--drop table tSudo;

SELECT * INTO tCityCopy FROM tCity;

CREATE TABLE tStaff_save AS SELECT * FROM tStaff;
-- ���̺��� ����� �� ����� ��¥�� ����صγ� ���⼱ ���� �ʾҵ�

SELECT * FROM tStaff;
-- Q ���뵵�� 80�� �̻��� ������ ��� �̸��� ���޿� ���� ������ ������ ���̺�� �ۼ��϶�.
CREATE TABLE score80up_table_1 AS SELECT name AS "�̸�",salary AS "����" FROM tStaff WHERE score>=80;
SELECT * FROM score80up_table_1;
DROP TABLE score80up_table_1;

--pratice

CREATE TABLE test1_0820 AS SELECT name AS "�̸�", score FROM tStaff WHERE score>90;
SELECT * FROM test1_0820;
DROP TABLE test1_0820;
/*
�ַ� WHERE���� ���� ����ϸ� ���ڵ� ����
DELETE 

���̺� ����
DROP

DELETE FROM '���̺�'�� ��� ���ڵ带 ������ �ϳ��� ����� �α׵� ����⿡ ������. ���̺��� ���ڵ带 ��� �����ϴ� �Ŷ�� ���� ��ɾ ����
TRUNCATE

����: DELETE FROM ���̺� WHERE ���� 

INSERT�� ��ġ�� INTO�� ���µ� DELETE�� ��ġ�� FROM�� ����.
�ַ� Ư�� ������ �����ϴ� ���ڵ带 �����ϱ� ������ �ڿ� WHERE ������ �׻� �ڵ��� �´�.
*/

-- DELETE FROM tCity WHERE region = '���';
SELECT * FROM tCity;

-- Q ������ ������ ���� �ذ���� ����.
CREATE TABLE tStaff_sample_DB AS SELECT * FROM tStaff; -- Ȥ�ø𸣴� �ӽ� DB����
SELECT * FROM tStaff_sample_DB; -- �ӽ� DBȮ��
-- DELETE FROM tStaff_sample_DB WHERE depart = '������'; -- �ӽ�DB�� ������ ���� �ذ�

SELECT * FROM tStaff_sample_DB; -- �ӽ�DB ��� Ȯ��

-- DELETE�� ���ڵ带 �������ִ� ��������� DB ���̺� �̸��� �ְ� �Ǹ� �ش� ���̺��� �������ѹ�����. �׻� WHERE�� ������ ������ Ȥ�ó� ����� �� ���ǰ� �ʿ���
-- ���� SELECT�� ������ ������ ��ȸ�� ���� �ϰ� �ش� �����Ͱ� �´ٸ� DELETE�� �����ϴ� ���� �����ϴ�
-- �׸��� DELETE���� �׻� �ּ��̳� �����س��� ���� �����ϴ�. Ȥ���� ��� ������ �����ع����� �ٶ��� �ǵ�ġ�ʰ� ������ �� �� �ֱ� �����̴�

-- TIP) ������ ���� ������ �����Ͽ� �巹���Ͽ� �����ϸ� �����ϴ�.

-- DELETE
-- SELECT *
FROM tStaff_sample_DB WHERE grade = '����';

/* TRANCATE 

DELETE FROM ���̺� �� ��� ���ڵ带 ������ �ϳ��� ����� �α׵� ����⿡ ������. ���̺��� ���ڵ带 ��� �����ϴ� �Ŷ�� ���� ��ɾ ����
�ӽÿ����� �α׸� ������ �ʾ� �������� ROLLBACK���ε� ����� �� ����.
���̺��� �ʱ�ȭ�� �� �ַ� ���.. �� �� create�� ���̺��� ������ �ʰ� insert into �� ���� �����͸� �־��ֱ⸸ �ϸ� �ȴ�

���� : TRUNCATE TABLE ���̺�
*/

/* ����
UPDATE

���ڵ��� �ʵ� ���� ������ ���� UPDATE ����� ����Ѵ�.

���� : UPDATE ���̺� SET �ʵ� = �� [,�ʵ� = ��] WHERE ����
SET �ڿ� �ʵ�=���� ���� ,�� �������� ���Թ��� ���� �Ѳ����� �������� �� �ִ�.

WHERE������ �� ������, BETWEEN, IN, LIKE ���� �����ڸ� ��� ����� �� �ִ�.

*/
SELECT * FROM tCity;
/*INSERT INTO tCity VALUES ('����',605,974,'y','���');
INSERT INTO tCity VALUES ('����',42,21,'n','���');*/

UPDATE tCity SET popu=1000, region ='��û' WHERE name = '����';
commit;

-- ���� ����ó�� WHERE���� ���� ������ ��ü ���ÿ� �α����� �Ѳ����� �ٲ������. �����ؾ���
-- UPDATE tCity SET popu=1000, region ='��û'; 
-- rollback;

-- SET ������ ���� �ʵ� ����� �Է��ϴµ� �ʵ峢���� ���굵 �����ϴ�.
UPDATE tCity SET popu = popu*2 WHERE name = '����';
SELECT * FROM tCity;

-- Q ���� ������� ��� �븮�� ���޽��Ѷ�
SELECT * FROM tStaff;
UPDATE tStaff SET grade='�븮' WHERE gender='��' AND grade = '���';
SELECT * FROM tStaff WHERE gender='��';

-- Q ������ ������ ������ 10%�� �λ��϶�.
UPDATE tStaff SET salary = salary+(salary*0.1) WHERE depart = '������';

/*CRUD

�����͸� �����ϴ� 4���� ������ CRUD��� �Ѵ�.

SELECT �ʵ��� FROM ���̺� WHERE ���� ORDER BY ���ı���
INSERT INTO ���̺� (�ʵ���) VALUES (�����)
DELETE FROM ���̺� WHERE ����
UPDATE ���̺� SET �ʵ�=��, �ʵ�=��, ... WHERE ����


*/