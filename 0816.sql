--P101/97
CREATE TABLE 회원 (
    회원번호 NUMBER,
    회원명 VARCHAR(20)
);

CREATE TABLE 동의항목 (
    회원번호    NUMBER,
    약관항목코드  VARCHAR(2),
    동의여부    VARCHAR(1),
    동의일시    DATE
);

INSERT INTO 회원 VALUES(1, '박보검');
INSERT INTO 회원 VALUES(2, '서예지');
INSERT INTO 회원 VALUES(3, '조승우');
INSERT INTO 회원 VALUES(4, '김희선');
INSERT INTO 회원 VALUES(5, '김수현');

INSERT INTO 동의항목 VALUES(1, '10', 'Y', SYSDATE-10);
INSERT INTO 동의항목 VALUES(1, '20', 'N', SYSDATE-11);
INSERT INTO 동의항목 VALUES(1, '30', 'Y', SYSDATE-13);
INSERT INTO 동의항목 VALUES(2, '10', 'Y', SYSDATE-12);
INSERT INTO 동의항목 VALUES(2, '20', 'Y', SYSDATE-44);
INSERT INTO 동의항목 VALUES(3, '10', 'N', SYSDATE-15);
INSERT INTO 동의항목 VALUES(4, '10', 'Y', SYSDATE-22);
INSERT INTO 동의항목 VALUES(4, '20', 'Y', SYSDATE-25);
INSERT INTO 동의항목 VALUES(4, '30', 'Y', SYSDATE-31);
INSERT INTO 동의항목 VALUES(5, '10', 'Y', SYSDATE-20);
INSERT INTO 동의항목 VALUES(5, '20', 'N', SYSDATE-14);
INSERT INTO 동의항목 VALUES(5, '30', 'N', SYSDATE-31);
INSERT INTO 동의항목 VALUES(5, '40', 'Y', SYSDATE-2);

SELECT * FROM 회원;
SELECT * FROM 동의항목;

SELECT A.회원번호, A.회원명
FROM 회원 A, 동의항목 B
WHERE A.회원번호 = B.회원번호
GROUP BY A.회원번호, A.회원명
HAVING COUNT(CASE WHEN B.동의여부='N' THEN 0 ELSE NULL END) >= 1
ORDER BY A.회원번호;

----------------------------------
--#1
SELECT A.회원번호, A.회원명
FROM 회원 A
WHERE EXISTS (SELECT 1 FROM 동의항목 B
                WHERE A.회원번호 = B.회원번호
                AND B.동의여부 = 'N')
GROUP BY A.회원번호;

--#2
SELECT A.회원번호, A.회원명
FROM 회원 A
WHERE A.회원번호 IN (SELECT B.회원번호 FROM 동의항목 B
                    WHERE B.동의여부 = 'N')
ORDER BY A.회원번호;

--#3
SELECT A.회원번호, A.회원명
FROM 회원 A
WHERE 0 < (SELECT COUNT(*)
            FROM 동의항목 B WHERE B.동의여부 = 'N')
ORDER BY A.회원번호;

--#4
SELECT A.회원번호, A.회원명
FROM 회원 A, 동의항목 B
WHERE A.회원번호 = B.회원번호 AND B.동의여부 = 'N'
GROUP BY A.회원번호 , A.회원명
ORDER BY A.회원번호;

















