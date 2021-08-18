--P103/100 --subquery
CREATE TABLE �μ� (
	�μ���ȣ	VARCHAR2(6),
	�μ���	VARCHAR2(20)
);

CREATE TABLE ��� (
	�����ȣ	VARCHAR2(6),
	�����	VARCHAR2(20),
	�Ի�⵵  VARCHAR2(4),
	�μ���ȣ	VARCHAR2(6)
);

CREATE TABLE �ξ簡�� (
	�����ȣ	VARCHAR2(6),
	����		VARCHAR2(10)
);


INSERT INTO �μ� VALUES('100001','������');
INSERT INTO �μ� VALUES('100002','ȫ��');
INSERT INTO �μ� VALUES('100003','��ȹ');
INSERT INTO �μ� VALUES('100004','�ѹ�');
INSERT INTO �μ� VALUES('100005','����');

INSERT INTO ��� VALUES('210001','������','2014','100001');
INSERT INTO ��� VALUES('210002','õ����','2014','100002');
INSERT INTO ��� VALUES('210003','�ɼ���','2014','100003');
INSERT INTO ��� VALUES('210004','�ִ���','2014','100004');
INSERT INTO ��� VALUES('210005','������','2014','100002');
INSERT INTO ��� VALUES('210006','�̱���','2014','100001');
INSERT INTO ��� VALUES('210007','����ö','2014','100002');
INSERT INTO ��� VALUES('210008','��γ�','2014','100003');
INSERT INTO ��� VALUES('210009','���ֱ�','2014','100004');
INSERT INTO ��� VALUES('210010','�ּ���','2014','100003');

INSERT INTO �ξ簡�� VALUES('210001','��');
INSERT INTO �ξ簡�� VALUES('210002','��');
INSERT INTO �ξ簡�� VALUES('210003','��');
INSERT INTO �ξ簡�� VALUES('210003','�Ƶ�');
INSERT INTO �ξ簡�� VALUES('210004','��');
INSERT INTO �ξ簡�� VALUES('210004','�Ƶ�');
INSERT INTO �ξ簡�� VALUES('210005','�Ƶ�');
INSERT INTO �ξ簡�� VALUES('210006','�Ƶ�');
INSERT INTO �ξ簡�� VALUES('210007','��');

--P104/101 --MAX, JOIN
CREATE TABLE ǰ�����׸� (
���׸�ID VARCHAR(1),
���׸�� VARCHAR(20)
);
CREATE TABLE �򰡰�� (

��ǰID VARCHAR(6),
��ȸ�� NUMBER,
���׸�ID VARCHAR(6),
�򰡵�� VARCHAR(5),
������ VARCHAR(8)

);
CREATE TABLE �򰡴���ǰ(

��ǰID VARCHAR(6),
��ǰ�� VARCHAR(25)

);

INSERT INTO ǰ�����׸� VALUES ('1','����');
INSERT INTO ǰ�����׸� VALUES ('2','����');
INSERT INTO ǰ�����׸� VALUES ('3','���浵');
INSERT INTO �򰡰�� VALUES ('200001',1,'1','1+','20210501');
INSERT INTO �򰡰�� VALUES ('200001',2,'1','1++','20210503');
INSERT INTO �򰡰�� VALUES ('200001',1,'2','3','20210501');
INSERT INTO �򰡰�� VALUES ('200001',1,'3','1++','20210501');
INSERT INTO �򰡰�� VALUES ('200002',1,'1','1','20210502');
INSERT INTO �򰡰�� VALUES ('200002',2,'1','1++','20210505');
INSERT INTO �򰡰�� VALUES ('200002',1,'2','2','20210504');
INSERT INTO �򰡰�� VALUES ('200002',2,'2','1','20210506');
INSERT INTO �򰡰�� VALUES ('200002',1,'3','1+','20210503');
INSERT INTO �򰡰�� VALUES ('200002',2,'3','1','20210506');
INSERT INTO �򰡰�� VALUES ('200003',1,'1','1++','20210501');
INSERT INTO �򰡰�� VALUES ('200003',1,'2','1+','20210501');
INSERT INTO �򰡰�� VALUES ('200003',1,'3','2','20210501');
INSERT INTO �򰡰�� VALUES ('200003',2,'3','1','20210506');
INSERT INTO �򰡰�� VALUES ('200003',3,'3','1+','20210508');
INSERT INTO �򰡴���ǰ VALUES ('200001','Ⱦ�������ѿ�');
INSERT INTO �򰡴���ǰ VALUES ('200002','����൹�ѿ�');
INSERT INTO �򰡴���ǰ VALUES ('200003','�����׸��ѿ�');

--#1
SELECT B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��, A.��ȸ��,
        A.�򰡵��, A.������
FROM �򰡰�� A, �򰡴���ǰ B, ǰ�����׸� C
    (SELECT MAX(��ȸ��) AS ��ȸ�� FROM �򰡰��) D
WHERE A.��ǰID = B.��ǰID
AND A.���׸�ID = C.���׸�ID
AND A.��ȸ�� = D.��ȸ��;

--#2
SELECT B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��, A.��ȸ��,
        A.�򰡵��, A.������
FROM �򰡰�� A, �򰡴���ǰ B, ǰ�����׸� C
WHERE A.��ǰID = B.��ǰID
AND A.���׸�ID = C.���׸�ID
AND A.��ȸ�� = (SELECT MAX(X.��ȸ��)
                FROM �򰡰�� X
                WHERE X.��ǰID = B.��ǰID
                AND X.���׸�ID = C.���׸�ID);
                
--#3
SELECT B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��,
        MAX(A.��ȸ��) AS ��ȸ��
        ,MAX(A. �򰡵��) AS �򰡵��
        ,MAX(A.������) AS ������
FROM �򰡰�� A, �򰡴���ǰ B, ǰ�����׸� C
WHERE A.��ǰID = B.��ǰID
AND A.���׸�ID = C.���׸�ID
GROUP BY B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��;



--P108/105 --ROLLUP, GROUPING
CREATE TABLE ���� (
	����ID		VARCHAR2(3) PRIMARY KEY,
	���񽺸�		VARCHAR2(10)
);

CREATE TABLE ���񽺰��� (
	ȸ����ȣ		VARCHAR2(1),
	����ID		VARCHAR2(3),
	��������		VARCHAR2(10),
	CONSTRAINTS ���񽺰���PK PRIMARY KEY (ȸ����ȣ, ����ID)
);

INSERT INTO ���� VALUES('001','����1');
INSERT INTO ���� VALUES('002','����2');
INSERT INTO ���� VALUES('003','����3');
INSERT INTO ���� VALUES('004','����4');

INSERT INTO ���񽺰��� VALUES('1','001','2013-01-01');
INSERT INTO ���񽺰��� VALUES('1','002','2013-01-02');
INSERT INTO ���񽺰��� VALUES('2','001','2013-01-01');
INSERT INTO ���񽺰��� VALUES('2','002','2013-01-02');
INSERT INTO ���񽺰��� VALUES('2','003','2013-01-03');
INSERT INTO ���񽺰��� VALUES('3','001','2013-01-01');
INSERT INTO ���񽺰��� VALUES('3','002','2013-01-02');
INSERT INTO ���񽺰��� VALUES('3','003','2013-01-03');

[SQL]
SELECT CASE WHEN GROUPING(A.����ID) = 0 THEN A.����ID
        ELSE '�հ�' END AS ����ID,
        CASE WHEN GROUPING(B.��������) = 0
            THEN NVL(B.��������, '-') ELSE '�Ұ�' END AS ��������,
        COUNT(B.ȸ����ȣ) AS ���԰Ǽ�
FROM ���� A LEFT OUTER JOIN ���񽺰��� B
ON( A.����ID = B.����ID
    AND B.�������� BETWEEN '2013-01-01' AND '2013-01-31')
GROUP BY ROLLUP (A.����ID, B.��������);
         
--P115/111 --GROUPING SETS
CREATE TABLE ��������2 (
	��ǰID	VARCHAR(4),
	��		VARCHAR(7),
	�����	NUMBER
);

INSERT INTO ��������2 VALUES ('P001','2014.10',1500);
INSERT INTO ��������2 VALUES ('P001','2014.11',1500);
INSERT INTO ��������2 VALUES ('P001','2014.12',2500);
INSERT INTO ��������2 VALUES ('P002','2014.10',1000);
INSERT INTO ��������2 VALUES ('P002','2014.11',2000);
INSERT INTO ��������2 VALUES ('P002','2014.12',1500);
INSERT INTO ��������2 VALUES ('P003','2014.10',2000);
INSERT INTO ��������2 VALUES ('P003','2014.11',1000);
INSERT INTO ��������2 VALUES ('P003','2014.12',1000);

--[SQL]
SELECT ��ǰID, ��, SUM(�����) AS �����
FROM ��������2
WHERE �� BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS((��ǰID,  ��));

--P116/113 RANK �Լ�, SUM, GROUP BY
CREATE TABLE �� (
	����ȣ		VARCHAR(3),
	����		VARCHAR(20)
);

CREATE TABLE �������� (
	��		VARCHAR(6),
	����ȣ	VARCHAR(3),
	�����	NUMBER
);

INSERT INTO �� VALUES('001','ȫ�浿');
INSERT INTO �� VALUES('002','�̼���');
INSERT INTO �� VALUES('003','������');
INSERT INTO �� VALUES('004','�̻�ȭ');
INSERT INTO �� VALUES('005','�̱���');

INSERT INTO �������� VALUES('201301','001',200);
INSERT INTO �������� VALUES('201301','002',300);
INSERT INTO �������� VALUES('201301','003',250);
INSERT INTO �������� VALUES('201301','004',300);
INSERT INTO �������� VALUES('201301','005',250);
INSERT INTO �������� VALUES('201302','001',150);
INSERT INTO �������� VALUES('201302','002',150);
INSERT INTO �������� VALUES('201302','004',200);
INSERT INTO �������� VALUES('201302','005',100);
INSERT INTO �������� VALUES('201303','002',100);
INSERT INTO �������� VALUES('201303','003',100);
INSERT INTO �������� VALUES('201303','004',200);
INSERT INTO �������� VALUES('201303','005',350);

SELECT * FROM ��;
SELECT * FROM ��������;

SELECT ����ȣ, ����, �����,
        RANK() OVER(ORDER BY  ����� DESC) AS ����
FROM (  SELECT A.����ȣ,
                MAX(A.����) AS ����,
                SUM(B.�����) AS �����
        FROM �� A INNER JOIN �������� B
            ON (A.����ȣ = B.����ȣ)
        GROUP BY A.����ȣ
      )
ORDER BY ����;




