

--P55/34

CREATE TABLE TAB_A (
    COL1 NUMBER,
    COL2 NUMBER,
    COL3 NUMBER
);

INSERT INTO TAB_A VALUES (30, NULL, 20);
INSERT INTO TAB_A VALUES (NULL, 10, 40);
INSERT INTO TAB_A VALUES (50, NULL, NULL);


--P58/39

CREATE TABLE SVC_JOIN (
    CUST_ID VARCHAR2(10) NOT NULL,
    SVC_ID VARCHAR2(5) NOT NULL,
    JOIN_YMD VARCHAR(8) NOT NULL,
    JOIN_HH VARCHAR2(4) NOT NULL,
    SVC_START_DATE DATE,
    SVC_END_DATE DATE
);

INSERT INTO SVC_JOIN VALUES('aaaa', '10000', '20141130', '14', TO_DATE('20150101001000'), TO_DATE('20150131001000'));
INSERT INTO SVC_JOIN VALUES('bbbb', '10000', '20141201', '00', TO_DATE('20150101001000'), TO_DATE('20150131235959'));
INSERT INTO SVC_JOIN VALUES('cccc', '10000', '20141201', '00', TO_DATE('20150105001000'), TO_DATE('20150131235000'));
INSERT INTO SVC_JOIN VALUES('dddd', '10000', '20141201', '02', TO_DATE('20150110001000'), TO_DATE('20150131001000'));
INSERT INTO SVC_JOIN VALUES('eeee', '10000', '20141201', '00', TO_DATE('20150120001000'), TO_DATE('20150131001000'));
INSERT INTO SVC_JOIN VALUES('ffff', '10000', '20141201', '00', TO_DATE('20150101001000'), TO_DATE('20150210001000'));
INSERT INTO SVC_JOIN VALUES('gggg', '10000', '20141202', '00', TO_DATE('20150201001000'), TO_DATE('20150220001000'));
INSERT INTO SVC_JOIN VALUES('hhhh', '10000', '20141201', '00', TO_DATE('20150201001000'), TO_DATE('20150101000000'));

SELECT * FROM SVC_JOIN;

SELECT SVC_ID, COUNT(*) AS CNT
FROM SVC_JOIN
WHERE SVC_END_DATE >= TO_DATE('20150101000000', 'YYYYMMDDHH24MISS')
AND SV_END_DATE <= TO_DATE('20150131235959', 'YYYYMMDDHH24MISS')
AND CONCAT(JOIN_YMD, JOIN_HH) = '2014120100'
GROUP BY SVC_ID;

SELECT SVC_ID, COUNT(*) AS CNT
FROM SVC_JOIN
WHERE SVC_END_DATE >= TO_DATE('20150101', 'YYYYMMDDHH24MISS')
AND SV_END_DATE <= TO_DATE('20150201', 'YYYYMMDDHH24MISS')
AND CONCAT(JOIN_YMD, JOIN_HH) IN (('20141201', '00'))
GROUP BY SVC_ID;

SELECT SVC_ID, COUNT(*) AS CNT
FROM SVC_JOIN
WHERE '201501' = TO_CHAR(SVC_END_DATE, 'YYYYMM')
AND JOIN_YMD = '20141201'
AND JOIN_HH = '00'
GROUP BY SVC_ID;

SELECT SVC_ID, COUNT(*) AS CNT
FROM SVC_JOIN
WHERE TO_DATE('201501', 'YYYYMM') = SVC_END_DATE
AND JOIN_YMD || JOIN_HH = '2014120100'
GROUP BY SVC_ID;


--P60/41
CREATE TABLE TAB1(
    C1 VARCHAR2(10)
);

INSERT INTO TAB1 VALUES(
'A
A');

INSERT INTO TAB1 VALUES (
'B
B
B');

SELECT SUM(CC)
FROM(
    SELECT(LENGTH(C1) - LENGTH(REPLACE(C1,CHR(10))) + 1) CC
    FROM TAB1
    );    


--P68/53
CREATE TABLE 주문 (
    회원ID    VARCHAR(10),
    주문금액   NUMBER 
);
CREATE TABLE 시스템사용이력(
    메뉴ID    VARCHAR(1),
    사용유형코드  VARCHAR(3),
    사용일시    DATE
);

INSERT INTO 주문 VALUES('서장훈', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('서장훈', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('서장훈', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('서장훈', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('김숙', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('김숙', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('김숙', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('김숙', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('한혜진', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('한혜진', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('한혜진', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('한혜진', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('한혜진', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('곽정은', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('곽정은', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('곽정은', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('주우재', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('주우재', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));
INSERT INTO 주문 VALUES('주우재', TRUNC(DBMS_RANDOM.VALUE(10000,99999)));

INSERT INTO 시스템사용이력 VALUES('1', '100', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('1', '300', SYSDATE-1);
INSERT INTO 시스템사용이력 VALUES('1', '300', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('1', '200', SYSDATE-3);
INSERT INTO 시스템사용이력 VALUES('2', '100', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('2', '300', SYSDATE-2);
INSERT INTO 시스템사용이력 VALUES('2', '300', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('2', '300', SYSDATE-1);
INSERT INTO 시스템사용이력 VALUES('3', '200', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('3', '200', SYSDATE-1);
INSERT INTO 시스템사용이력 VALUES('3', '100', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('3', '100', SYSDATE-2);
INSERT INTO 시스템사용이력 VALUES('3', '200', SYSDATE);
INSERT INTO 시스템사용이력 VALUES('3', '1100', SYSDATE-1);

SELECT 회원ID, SUM(주문금액) AS 합계
FROM 주문
GROUP BY 회원ID
HAVING COUNT(*) > 1;

SELECT SUM(주문금액) AS 합계
FROM 주문
FROM AVG(주문금액) > 100;

SELECT 메뉴ID, 사용유형코드, COUNT(*) AS CNT
FROM 시스템사용이력
WHERE 사용일시 BETWEEN SYSDATE-1 AND SYSDATE
GROUP BY 메뉴ID, 사용유형코드
HAVING 메뉴ID=3 AND 사용유형코드 = 100;

SELECT 메뉴ID, 사용유형코드, AVG(COUNT(*)) AS AVGCNT
FROM 시스템사용이력
GROUP BY 메뉴ID, 사용유형코드;

--P78/66
CREATE TABLE 고객 (
    고객ID    VARCHAR(6),
    고객명    VARCHAR(20),
    나이      NUMBER
);

CREATE TABLE 추천컨텐츠 (
    고객ID    VARCHAR2(6),
    컨텐츠ID   VARCHAR2(6),
    추천대상일자  VARCHAR(10)
);
CREATE TABLE 컨텐츠 (
    컨텐츠ID   VARCHAR(6),
    컨텐츠     VARCHAR(20)
);
CREATE TABLE 비선호컨텐츠 (
    고객ID    VARCHAR2(6),
    컨텐츠ID   VARCHAR2(6),
    등록일     VARCHAR2(10)
);
INSERT INTO 고객 VALUES('10001','오영주',30);
INSERT INTO 고객 VALUES('10002','김도균',33);
INSERT INTO 고객 VALUES('10003','임현주',29);
INSERT INTO 고객 VALUES('10004','정재호',30);
INSERT INTO 고객 VALUES('10005','김현우',35);
INSERT INTO 고객 VALUES('10006','정의동',27);
INSERT INTO 고객 VALUES('10007','이가흔',24);

INSERT INTO 추천컨텐츠 VALUES('100001', 10000A', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100001', 10000C', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100002', 10000B', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100003', 10000A', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100005', 10000A', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100005', 10000C', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100005', 10000D', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100006', 10000B', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100007', 10000A', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));
INSERT INTO 추천컨텐츠 VALUES('100007', 10000E', TO_CHAR(SYSDATE, 'YYYY.MM.DD'));

INSERT INTO 컨텐츠 VALUES('10000A', '하트시그널');
INSERT INTO 컨텐츠 VALUES('10000B', '리얼프렌즈');
INSERT INTO 컨텐츠 VALUES('10000C', '연애의참견');
INSERT INTO 컨텐츠 VALUES('10000D', '나혼자산다');
INSERT INTO 컨텐츠 VALUES('10000E', '미운오리새끼');

INSERT INTO 비선호컨텐츠 VALUES('100005', '10000D', '2021.05.05');
INSERT INTO 비선호컨텐츠 VALUES('100007', '10000A', '2021.05.09');

--P94/87  --계층쿼리
CREATE TABLE TAB1 (
 C1 VARCHAR2(1),
 C2 VARCHAR2(1),
 C3 VARCHAR2(1)
);

INSERT INTO TAB1 VALUES('1', NULL, 'A');
INSERT INTO TAB1 VALUES('2', '1', 'B');
INSERT INTO TAB1 VALUES('3', '1', 'C');
INSERT INTO TAB1 VALUES('4', '2', 'D');

SELECT * FROM TAB1;

SELECT *
FROM TAB1
START WITH C2 IS NULL
CONNECT BY PRIOR C1 = C2
ORDER SIBLINGS BY C3 DESC;


--P95/89  --계층쿼리
CREATE TABLE 사원(
    사원번호 VARCHAR(3),
    사원명 VARCHAR(10),
    입사일자 VARCHAR(10),
    매니저사원번호 VARCHAR(3),
    CONSTRAINT "사원_PK" PRIMARY KEY("사원번호"),
    CONSTRAINT "사원_FK" FOREIGN KEY("매니저사원번호")
    REFERENCES 사원(사원번호)
);

INSERT INTO 사원 VALUES('001', '홍길동', '2012-01-01', NULL);
INSERT INTO 사원 VALUES('002', '강감찬', '2012-01-01', '001');
INSERT INTO 사원 VALUES('003', '이순신', '2013-01-01', '001');
INSERT INTO 사원 VALUES('004', '이민정', '2013-01-01', '001');
INSERT INTO 사원 VALUES('005', '이병헌', '2013-01-01', NULL);
INSERT INTO 사원 VALUES('006', '안성기', '2014-01-01', '005');
INSERT INTO 사원 VALUES('007', '이수근', '2014-01-01', '005');
INSERT INTO 사원 VALUES('008', '김병만', '2014-01-01', '005');

SELECT * FORM 사원;

SELECT 사원번호, 사원명, 입사일자, 매니저사원번호
FROM 사원
START WITH 매니저사원번호  IS NULL
CONNECT BY PRIOR 사원번호 = 매니저사원번호
AND 입사일자 BETWEEN '2013-01-01' AND '2013-12-31'
ORDER SIBLINGS BY 사원번호;

--P98/93
CREATE TABLE 일자별매출 (
    일자 VARCHAR(10),
    매출액 NUMBER
);
INSERT INTO 일자별매출 VALUES ('2015.11.01', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.02', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.03', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.04', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.05', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.06', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.07', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.08', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.09', 1000);
INSERT INTO 일자별매출 VALUES ('2015.11.10', 1000);

------------







