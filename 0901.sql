


SELECT * FROM SQLD_21_01;

DELETE SQLD_21_01 WHERE v1 = 'B';

ROLLBACK;

SELECT * FROM SQLD_21_02;

DELETE SQLD_21_02 WHERE v1 = 'B';

COMMIT;


SELECT *
FROM SQLD_21_01 A LEFT OUTER JOIN SQLD_21_02 B 
ON (A.n1 = B.n1);

SELECT *
FROM SQLD_21_01 A ,SQLD_21_02 B 
WHERE A.n1 = B.n1(+)
;

SELECT *
FROM SQLD_21_01 A ,SQLD_21_02 B 
WHERE A.n1(+) = B.n1
;

SELECT *
FROM SQLD_21_01 A RIGHT OUTER JOIN SQLD_21_02 B 
ON (A.n1 = B.n1);


SELECT * FROM sqld_21_01
WHERE v1 NOT IN (SELECT V1 FROM sqld_21_02);


SELECT * FROM sqld_21_01
WHERE v1 NOT IN (SELECT V1 FROM sqld_21_02);

SELECT * FROM EMP;


SELECT * FROM ����;

CREATE TABLE ���� (
    ����ID NUMBER,
    ����� VARCHAR2(20)
);

CREATE TABLE ��������� (
    ����ID NUMBER,
    ����� VARCHAR2(20),
    ��뷮 NUMBER
);

SELECT *FROM ����;
SELECT *FROM ���������;

INSERT INTO ���� VALUES(1, '����1');
INSERT INTO ���� VALUES(2, '����2');
INSERT INTO ���� VALUES(3, '����3');

INSERT INTO ��������� VALUES(1, '��������', 100);
INSERT INTO ��������� VALUES(1, '���', 200);
INSERT INTO ��������� VALUES(1, '�ٶ�', 300);
INSERT INTO ��������� VALUES(2, '��������', 200);
INSERT INTO ��������� VALUES(2, '���', 300);
INSERT INTO ��������� VALUES(3, '��������', 300);

ALTER TABLE ��������� RENAME COLUMN ����� TO �������ڵ�;

DESC ���������;

COMMIT;

ALTER TABLE ��������� RENAME COLUMN �������ڵ�2 TO �������ڵ�;


--1
SELECT A.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM ���� A INNER JOIN ��������� B
ON (A.����ID = B.����ID)
GROUP BY CUBE((A.����ID), (B.�������ڵ�), (A.����ID, B.�������ڵ�))
ORDER BY A.����ID, B.�������ڵ�;

--2
SELECT A.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM ���� A INNER JOIN ��������� B
ON (A.����ID = B.����ID)
GROUP BY CUBE(A.����ID, B.�������ڵ�)
ORDER BY A.����ID, B.�������ڵ�;

--3
SELECT A.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM ���� A INNER JOIN ��������� B
ON (A.����ID = B.����ID)
GROUP BY GROUPING SETS((A.����ID), (B.�������ڵ�), (A.����ID, B.�������ڵ�),())
ORDER BY A.����ID, B.�������ڵ�;

--4
SELECT A.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM ���� A INNER JOIN ��������� B
ON (A.����ID = B.����ID)
GROUP BY GROUPING SETS((A.����ID), (B.�������ڵ�), (A.����ID, B.�������ڵ�))
ORDER BY A.����ID, B.�������ڵ�;






