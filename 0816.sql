--P101/97
CREATE TABLE ȸ�� (
    ȸ����ȣ NUMBER,
    ȸ���� VARCHAR(20)
);

CREATE TABLE �����׸� (
    ȸ����ȣ    NUMBER,
    ����׸��ڵ�  VARCHAR(2),
    ���ǿ���    VARCHAR(1),
    �����Ͻ�    DATE
);

INSERT INTO ȸ�� VALUES(1, '�ں���');
INSERT INTO ȸ�� VALUES(2, '������');
INSERT INTO ȸ�� VALUES(3, '���¿�');
INSERT INTO ȸ�� VALUES(4, '����');
INSERT INTO ȸ�� VALUES(5, '�����');

INSERT INTO �����׸� VALUES(1, '10', 'Y', SYSDATE-10);
INSERT INTO �����׸� VALUES(1, '20', 'N', SYSDATE-11);
INSERT INTO �����׸� VALUES(1, '30', 'Y', SYSDATE-13);
INSERT INTO �����׸� VALUES(2, '10', 'Y', SYSDATE-12);
INSERT INTO �����׸� VALUES(2, '20', 'Y', SYSDATE-44);
INSERT INTO �����׸� VALUES(3, '10', 'N', SYSDATE-15);
INSERT INTO �����׸� VALUES(4, '10', 'Y', SYSDATE-22);
INSERT INTO �����׸� VALUES(4, '20', 'Y', SYSDATE-25);
INSERT INTO �����׸� VALUES(4, '30', 'Y', SYSDATE-31);
INSERT INTO �����׸� VALUES(5, '10', 'Y', SYSDATE-20);
INSERT INTO �����׸� VALUES(5, '20', 'N', SYSDATE-14);
INSERT INTO �����׸� VALUES(5, '30', 'N', SYSDATE-31);
INSERT INTO �����׸� VALUES(5, '40', 'Y', SYSDATE-2);

SELECT * FROM ȸ��;
SELECT * FROM �����׸�;

SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ�� A, �����׸� B
WHERE A.ȸ����ȣ = B.ȸ����ȣ
GROUP BY A.ȸ����ȣ, A.ȸ����
HAVING COUNT(CASE WHEN B.���ǿ���='N' THEN 0 ELSE NULL END) >= 1
ORDER BY A.ȸ����ȣ;

----------------------------------
--#1
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ�� A
WHERE EXISTS (SELECT 1 FROM �����׸� B
                WHERE A.ȸ����ȣ = B.ȸ����ȣ
                AND B.���ǿ��� = 'N')
GROUP BY A.ȸ����ȣ;

--#2
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ�� A
WHERE A.ȸ����ȣ IN (SELECT B.ȸ����ȣ FROM �����׸� B
                    WHERE B.���ǿ��� = 'N')
ORDER BY A.ȸ����ȣ;

--#3
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ�� A
WHERE 0 < (SELECT COUNT(*)
            FROM �����׸� B WHERE B.���ǿ��� = 'N')
ORDER BY A.ȸ����ȣ;

--#4
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ�� A, �����׸� B
WHERE A.ȸ����ȣ = B.ȸ����ȣ AND B.���ǿ��� = 'N'
GROUP BY A.ȸ����ȣ , A.ȸ����
ORDER BY A.ȸ����ȣ;







