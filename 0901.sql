


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


SELECT * FROM 설비;

CREATE TABLE 설비 (
    설비ID NUMBER,
    설비명 VARCHAR2(20)
);

CREATE TABLE 에너지사용 (
    설비ID NUMBER,
    설비명 VARCHAR2(20),
    사용량 NUMBER
);

SELECT *FROM 설비;
SELECT *FROM 에너지사용;

INSERT INTO 설비 VALUES(1, '설비1');
INSERT INTO 설비 VALUES(2, '설비2');
INSERT INTO 설비 VALUES(3, '설비3');

INSERT INTO 에너지사용 VALUES(1, '논리왕전기', 100);
INSERT INTO 에너지사용 VALUES(1, '용수', 200);
INSERT INTO 에너지사용 VALUES(1, '바람', 300);
INSERT INTO 에너지사용 VALUES(2, '논리왕전기', 200);
INSERT INTO 에너지사용 VALUES(2, '용수', 300);
INSERT INTO 에너지사용 VALUES(3, '논리왕전기', 300);

ALTER TABLE 에너지사용 RENAME COLUMN 설비명 TO 에너지코드;

DESC 에너지사용;

COMMIT;

ALTER TABLE 에너지사용 RENAME COLUMN 에너지코드2 TO 에너지코드;


--1
SELECT A.설비ID, B.에너지코드, SUM(B.사용량) AS 사용량합계
FROM 설비 A INNER JOIN 에너지사용 B
ON (A.설비ID = B.설비ID)
GROUP BY CUBE((A.설비ID), (B.에너지코드), (A.설비ID, B.에너지코드))
ORDER BY A.설비ID, B.에너지코드;

--2
SELECT A.설비ID, B.에너지코드, SUM(B.사용량) AS 사용량합계
FROM 설비 A INNER JOIN 에너지사용 B
ON (A.설비ID = B.설비ID)
GROUP BY CUBE(A.설비ID, B.에너지코드)
ORDER BY A.설비ID, B.에너지코드;

--3
SELECT A.설비ID, B.에너지코드, SUM(B.사용량) AS 사용량합계
FROM 설비 A INNER JOIN 에너지사용 B
ON (A.설비ID = B.설비ID)
GROUP BY GROUPING SETS((A.설비ID), (B.에너지코드), (A.설비ID, B.에너지코드),())
ORDER BY A.설비ID, B.에너지코드;

--4
SELECT A.설비ID, B.에너지코드, SUM(B.사용량) AS 사용량합계
FROM 설비 A INNER JOIN 에너지사용 B
ON (A.설비ID = B.설비ID)
GROUP BY GROUPING SETS((A.설비ID), (B.에너지코드), (A.설비ID, B.에너지코드))
ORDER BY A.설비ID, B.에너지코드;






