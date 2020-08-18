DROP TABLE MEMBER;
DROP TABLE ITEM;
DROP TABLE BASKET;
DROP TABLE PAYLIST;
DROP TABLE REVIEW;
DROP TABLE REVIEW_REPLY;
DROP TABLE WORKOUT;
DROP TABLE PROGRAM;
DROP TABLE NOTICE;
DROP TABLE QNA;
DROP TABLE CHAT;
DROP TABLE CALENDAR;


DROP SEQUENCE MEMBERSEQ;
DROP SEQUENCE ITEMSEQ;

DROP SEQUENCE REVIEWSEQ;

DROP SEQUENCE REPLYSEQ;
DROP SEQUENCE REPLYGROUPSEQ;


DROP SEQUENCE WORKOUTSEQ;
DROP SEQUENCE PROGRAMSEQ;
DROP SEQUENCE NOTICESEQ;
DROP SEQUENCE QNASEQ;
DROP SEQUENCE QNAGROUPSEQ;
DROP SEQUENCE CHATSEQ;
DROP SEQUENCE CALENDARSEQ;



CREATE SEQUENCE MEMBERSEQ;
CREATE SEQUENCE ITEMSEQ;
CREATE SEQUENCE REVIEWSEQ;

CREATE SEQUENCE REPLYSEQ;
CREATE SEQUENCE REPLYGROUPSEQ;

CREATE SEQUENCE WORKOUTSEQ;
CREATE SEQUENCE PROGRAMSEQ;
CREATE SEQUENCE NOTICESEQ;
CREATE SEQUENCE QNASEQ;
CREATE SEQUENCE QNAGROUPSEQ;
CREATE SEQUENCE CHATSEQ;
CREATE SEQUENCE CARENDARSEQ;

SELECT * FROM INBODY
CREATE TABLE MEMBER(
	MB_NO NUMBER,
	MB_ID VARCHAR2(20) NOT NULL,
	MB_PW VARCHAR2(50) NOT NULL,
	MB_NAME VARCHAR2(20) NOT NULL,
	MB_GENDER VARCHAR2(1) NOT NULL,
	MB_EMAIL VARCHAR2(50) NOT NULL,
	MB_ADDR VARCHAR2(200) NOT NULL,
	MB_GRADE VARCHAR2(20) NOT NULL,
	MB_PHOTO VARCHAR2(1000),
	CONSTRAINT MB_NO_PK PRIMARY KEY(MB_NO),
	CONSTRAINT MB_ID_UQ UNIQUE (MB_ID),
	CONSTRAINT MB_GENDER_CH CHECK(MB_GENDER IN ('M','F')),
	CONSTRAINT MB_PHONE_UQ UNIQUE (MB_PHONE)
);
SELECT * FROM MEMBER

DELETE 

CREATE TABLE ITEM(
	ITEM_NO NUMBER,
	ITEM_NAME VARCHAR2(100) NOT NULL,
	ITEM_PRICE NUMBER NOT NULL,
	ITEM_STOCK NUMBER NOT NULL,
	ITEM_SALCOUNT NUMBER NOT NULL,
	ITEM_GROUPNO NUMBER NOT NULL,
	CONSTRAINT ITEM_NO_PK PRIMARY KEY(ITEM_NO)
);
SELECT * FROM ITEM;

DELETE FROM ITEM WHERE ITEM_NO = 9;

INSERT INTO ITEM
VALUES (1, 1, '아령', 9000, 100, 0, 'resources/img/dumbbell_1.jpg');

INSERT INTO ITEM
VALUES (2, 1, '케틀벨', 20000, 100, 0, 'resources/img/kettlebell_1.jpg');

INSERT INTO ITEM
VALUES (3, 1, '바벨', 40000, 100, 0, 'resources/img/babel_1.jpg');

INSERT INTO ITEM
VALUES (4, 1, '턱걸이', 15000, 100, 0, 'resources/img/chin_blow_2.jpg');

INSERT INTO ITEM
VALUES (5, 2, '밴드', 10000, 100, 0, 'resources/img/band_1.jpg');

INSERT INTO ITEM
VALUES (6, 2, '스태퍼', 50000, 100, 0, 'resources/img/staper_1.jpg');

INSERT INTO ITEM
VALUES (7, 2, '매트', 7000, 100, 0, 'resources/img/mat_1.jpg');

INSERT INTO ITEM
VALUES (8, 2, '짐볼', 13000, 100, 0, 'resources/img/gymball_1.jpg');

INSERT INTO ITEM
VALUES (9, 1, '싸이클', 148000, 100, 0, 'resources/img/싸이클_1.jpg');


CREATE TABLE BASKET(
	MB_NO NUMBER REFERENCES MEMBER (MB_NO),
	ITEM_NO NUMBER REFERENCES ITEM (ITEM_NO),
	BAS_COUNT NUMBER NOT NULL,
	CONSTRAINT MB_NO_PK_BAS PRIMARY KEY(MB_NO)
);
SELECT * FROM BASKET;
DELETE FROM BASKET;

CREATE TABLE PAYLIST(
	MB_NO NUMBER REFERENCES MEMBER (MB_NO),
	ITEM_NO NUMBER REFERENCES ITEM (ITEM_NO),
	PL_COUNT NUMBER NOT NULL,
	PL_DATE DATE NOT NULL,
	CONSTRAINT MB_NO_PK_PAY PRIMARY KEY(MB_NO)
);	

CREATE TABLE REVIEW(
	RV_NO NUMBER,
	RV_TITLE VARCHAR2(1000) NOT NULL,
	RV_CONTENT VARCHAR2(4000) NOT NULL,
	RV_DATE DATE NOT NULL,
	RV_PHOTO VARCHAR2(1000) NOT NULL,
	RV_RATE VARCHAR2(10) NOT NULL,
	MB_ID VARCHAR2(20) REFERENCES MEMBER (MB_ID),
	CONSTRAINT RV_NO_PK PRIMARY KEY(RV_NO)
);

SELECT * FROM REVIEW

CREATE TABLE REVIEW_REPLY(
	RR_NO NUMBER PRIMARY KEY,
	RV_NO NUMBER NOT NULL,	
	RR_GROUPSEQ NUMBER NOT NULL,
	RR_TAB NUMBER NOT NULL,
	MB_ID VARCHAR2(20) NOT NULL,
	RR_CONTENT VARCHAR2(2000) NOT NULL,
	RR_DATE DATE NOT NULL,	
	
	FOREIGN KEY(RV_NO) REFERENCES REVIEW (RV_NO),
	FOREIGN KEY(MB_ID) REFERENCES MEMBER (MB_ID)
);

DROP TABLE REVIEW_REPLY
SELECT * FROM REVIEW_REPLY
DELETE FROM REVIEW_REPLY
ALTER TABLE REVIEW_REPLY DROP PRIMARY KEY
ALTER TABLE REVIEW_REPLY ADD RR_NO NUMBER
ALTER TABLE REVIEW_REPLY ADD CONSTRAINT REVIEW_REPLY_FK FOREIGN KEY()
CREATE TABLE WORKOUT(
	WK_NO NUMBER,
	WK_NAME VARCHAR2(100) NOT NULL,
	WK_TARGET VARCHAR2(500) NOT NULL,
	CONSTRAINT WK_NO_PK PRIMARY KEY(WK_NO)
);
SELECT * FROM WORKOUT
CREATE TABLE PROGRAM(
	PR_NO NUMBER,
	PR_NAME VARCHAR2(100) NOT NULL,
	WK_NO NUMBER REFERENCES WORKOUT(WK_NO),
	
	CONSTRAINT PR_NO_PK PRIMARY KEY(PR_NO)
);
SELECT * FROM PROGRAM
CREATE TABLE NOTICE(
	NT_NO NUMBER,
	NT_TITLE VARCHAR2(1000) NOT NULL,
	NT_CONTENT VARCHAR2(4000) NOT NULL,
	NT_DATE DATE NOT NULL,
	CONSTRAINT NT_NO_PK PRIMARY KEY(NT_NO)
);

CREATE TABLE QNA(
	QA_NO NUMBER,
	QA_TITLE VARCHAR2(1000) NOT NULL,
	QA_CONTENT VARCHAR2(4000) NOT NULL,	
	QA_WRITER VARCHAR2(100),
	
	CONSTRAINT QA_NO_PK PRIMARY KEY(QA_NO)
);
SELECT * FROM QNA
INSERT INTO QNA
VALUES (QNASEQ.NEXTVAL, '결제취소는 어떻게 하나요?', '고객센터로 문의바랍니다. (tel)02-9999-9999', '관리자')

CREATE TABLE CHAT(
	CH_NO NUMBER,
	CH_TITLE VARCHAR2(1000) NOT NULL,
	CH_DATE DATE NOT NULL,
	CH_HASH VARCHAR2(500) NOT NULL,
	CH_COUNT NUMBER NOT NULL,
	CONSTRAINT CH_NO_PK PRIMARY KEY(CH_NO)	
);
SELECT * FROM CHAT
CREATE TABLE CALENDAR(
	CA_NO NUMBER,
	CA_TITLE VARCHAR2(1000) NOT NULL,
	CA_CONTENT VARCHAR2(4000) NOT NULL,
	CA_MDATE VARCHAR2(20) NOT NULL,
	CA_REGDATE DATE NOT NULL,
	MB_ID VARCHAR2(20) REFERENCES MEMBER (MB_ID),
	CONSTRAINT CA_NO_PK PRIMARY KEY(CA_NO)
);
SELECT * FROM CALENDAR
SELECT * FROM NOTICE
CREATE TABLE INBODY(
	IB_NO NUMBER PRIMARY KEY,
	MB_NO NUMBER NOT NULL,
	WEIGHT NUMBER NOT NULL,
	HEIGHT NUMBER NOT NULL,
	BMI NUMBER NOT NULL,
	IB_DATE DATE DEFAULT SYSDATE,
	
	CONSTRAINTS INBODY_MB_NO FOREIGN KEY (MB_NO) REFERENCES MEMBER(MB_NO)
);
DROP TABLE INBODY


SELECT * FROM NOTICE;


SELECT * FROM INBODY
ALTER TABLE INBODY ADD IB_DATE DATE
ALTER TABLE INBODY MODIFY (IB_DATE DATE DEFAULT SYSDATE NOT NULL)
ALTER TABLE INBODY MODIFY (IB_DATE DATE DEFAULT SYSDATE)

INSERT INTO INBODY 
VALUES (1, 1, 60, 173, 20.05, SYSDATE);
INSERT INTO INBODY 
VALUES (2, 1, 65, 173, 21.72, SYSDATE);
INSERT INTO INBODY 
VALUES (3, 1, 69, 173, 23.05, SYSDATE);
INSERT INTO INBODY 
VALUES (4, 1, 65, 173, 21.72, SYSDATE);

INSERT INTO NOTICE VALUES(NOTICESEQ.NEXTVAL, 'TEST글', 'TEST글 잘 올라가나', SYSDATE);
INSERT INTO NOTICE VALUES(NOTICESEQ.NEXTVAL, 'ㅅㅂ', '왜 안돼!!!!!!!!!!!!!', SYSDATE);
SELECT * FROM NOTICE;


SELECT * FROM CHAT;

ALTER TABLE REVIEW MODIFY RV_RATE NUMBER

SELECT * FROM REVIEW
DELETE FROM REVIEW
SELECT * FROM REVIEW_REPLY
DELETE FROM REVIEW_REPLY
INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL, 'admin', 'admin1234', '관리자', 'M', '010-0000-0000', '서울', 'ADMIN', '');
SELECT * FROM MEMBER;



SELECT * FROM MEMBER
ORDER BY MB_NO;

ALTER TABLE MEMBER MODIFY MB_PHOTO DEFAULT 'resources/img/1.jpg'

update MEMBER SET MB_PHOTO = 'resources/img/1.jpg'

DELETE FROM MEMBER WHERE MB_NO = 88;

