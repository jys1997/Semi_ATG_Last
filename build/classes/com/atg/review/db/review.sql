DROP SEQUENCE MYNOSEQ;
DROP TABLE REVIEW;

CREATE SEQUENCE MYNOSEQ;
CREATE TABLE REVIEW(
	MYNO NUMBER PRIMARY KEY,
	MYNAME VARCHAR2(1000) NOT NULL,
	MYTITLE VARCHAR2(2000) NOT NULL,
	MYCONTENT VARCHAR2(4000) NOT NULL,
	MYDATE DATE NOT NULL
);

INSERT INTO MYBOARD
VALUES (MYNOSEQ.NEXTVAL, '관리자', 'TEST 글입니다.', 'TEST1234', SYSDATE);

INSERT INTO MYBOARD
VALUES (MYNOSEQ.NEXTVAL, '쀼쀼', 'JSP 재밌다.', '진짜 재밌다.', SYSDATE);

SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE
FROM MYBOARD
ORDER BY MYNO DESC;