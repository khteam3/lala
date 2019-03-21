INSERT INTO MEMBER(
	ID,NAME,PWD,EMAIL,PHONE,ADDRESS,AUTH
) VALUES(
    'admin','master','admin','master@naver.com','01012345678','서울시역삼동삼도빌딩2층',1
)

INSERT INTO MEMBER(
	ID,NAME,PWD,EMAIL,PHONE,ADDRESS,AUTH
) VALUES(
    'ojh','오지훈','1111','alecsander@naver.com','01012345678','서울시역삼동삼도빌딩2층',0
)
  
-- 회원가입(멤버)
DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
    ID VARCHAR2(50) PRIMARY KEY,    -- 아이디
    NAME VARCHAR2(50) NOT NULL,     -- 이름
    PWD VARCHAR2(50) NOT NULL,      -- 비밀번호
    EMAIL VARCHAR2(50) NOT NULL,    -- 이메일
    PHONE VARCHAR2(20) NOT NULL,    -- 전화번호
    ADDRESS VARCHAR2(100) NOT NULL, -- 주소
    AUTH NUMBER(1) NOT NULL         -- 회원등급(관리자)
);

-- 고객후기
DROP TABLE REVIEW
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_REVIEW;

CREATE TABLE REVIEW(
    SEQ NUMBER(8) PRIMARY KEY,          -- 시퀀스
    ID VARCHAR2(50) NOT NULL,           -- 아이디
    TITLE VARCHAR2(200) NOT NULL,       -- 제목
    CONTENT VARCHAR2(4000) NOT NULL,    -- 내용
    FILENAME VARCHAR2(50) NOT NULL,     -- 첨부파일
    MANAGEMENT VARCHAR2(50) NOT NULL,   -- 관리내용
    SCORE NUMBER(2) NOT NULL,           -- 별점
    READCOUNT NUMBER(8) NOT NULL,       -- 조회수
    WDATE DATE NOT NULL,                -- 작성일
    TNAME VARCHAR2(50) NOT NULL,        -- 테이블네임
    REF NUMBER(8) NOT NULL,             -- 답글용(부모글)
    STEP NUMBER(8) NOT NULL,            -- 답글용    
    DEPTH NUMBER(8) NOT NULL            -- 답글용
);

CREATE SEQUENCE SEQ_REVIEW
START WITH 1
INCREMENT BY 1;

ALTER TABLE REVIEW
ADD CONSTRAINT FK_MEMBER_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);



-- 상담 글쓰기
DROP TABLE COMBINE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COMBINE;

CREATE TABLE COMBINE(
   SEQ NUMBER(8) PRIMARY KEY,           -- 시퀀스
   NAME VARCHAR2(50) NOT NULL,          -- 이름
   ID VARCHAR2(50) NOT NULL,            -- 아이디
   PHONE VARCHAR2(20) NOT NULL,         -- 전화번호
   EMAIL VARCHAR2(50) NOT NULL,         -- 이메일
   INQUIRE NUMBER(1) NOT NULL,          -- 문의항목
   GENDER NUMBER(1) NOT NULL,           -- 성별
   MEDICAL VARCHAR2(50) NOT NULL,       -- 시술항목
   ANSWERCHK NUMBER(1) NOT NULL,        -- 답변전송
   RDATE VARCHAR2(12) NOT NULL,         -- 예약날짜
   TITLE VARCHAR2(200) NOT NULL,        -- 글 제목
   CONTENT VARCHAR2(4000) NOT NULL,     -- 내용
   FILENAME VARCHAR2(50) NOT NULL,      -- 첨부파일
   TITLEPWD VARCHAR2(200) NOT NULL,     -- 글비밀번호
   PROGRESS NUMBER(1) NOT NULL,         -- 답변확인용
   WDATE DATE NOT NULL,                 -- 등록일
   TNAME VARCHAR2(50) NOT NULL,         -- 테이블네임
   REF NUMBER(8) NOT NULL,              -- 답글용
   STEP NUMBER(8) NOT NULL,             -- 답글용
   DEPTH NUMBER(8) NOT NULL             -- 답글용
);

CREATE SEQUENCE SEQ_COMBINE
START WITH 1
INCREMENT BY 1;

ALTER TABLE COMBINE
ADD CONSTRAINT FK_COMBINE_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

-- 고객 소리함
DROP TABLE CUSTOM
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CUSTOM;

CREATE TABLE CUSTOM(
   SEQ NUMBER(8) PRIMARY KEY,           -- 시퀀스
   ID VARCHAR2(50) NOT NULL,            -- 아이디
   PHONE VARCHAR2(20) NOT NULL,         -- 전화번호
   EMAIL VARCHAR2(50) NOT NULL,         -- 이메일
   
   TITLE VARCHAR2(200) NOT NULL,        -- 제목
   CONTENT VARCHAR2(4000) NOT NULL,     -- 내용
   FILENAME VARCHAR2(50) NOT NULL,      -- 첨부파일
   TITLEPWD VARCHAR2(200) NOT NULL,     -- 글비밀번호
   WDATE DATE NOT NULL,                 -- 등록일
   TNAME VARCHAR2(50) NOT NULL,         -- 테이블네임
   REF NUMBER(8) NOT NULL,              -- 답글용
   STEP NUMBER(8) NOT NULL,             -- 답글용
   DEPTH NUMBER(8) NOT NULL             -- 답글용
);

CREATE SEQUENCE SEQ_CUSTOM
START WITH 1
INCREMENT BY 1;

ALTER TABLE CUSTOM
ADD CONSTRAINT FK_CUSTOM_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

-- 자료게시판 
DROP TABLE DOWN
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_DOWN;

CREATE TABLE DOWN(
    SEQ NUMBER(8) PRIMARY KEY,           -- 시퀀스 
    ID VARCHAR2(50) NOT NULL,            -- 아이디
    TITLE VARCHAR2(200) NOT NULL,        -- 제목   
    CONTENT VARCHAR2(4000) NOT NULL,     -- 내용
    FILENAME VARCHAR2(50) NOT NULL,      -- 첨부파일
    WDATE DATE NOT NULL,                 -- 등록일
    TNAME VARCHAR2(50) NOT NULL,         -- 테이블네임
    REF NUMBER(8) NOT NULL,              -- 답글용
    STEP NUMBER(8) NOT NULL,             -- 답글용
    DEPTH NUMBER(8) NOT NULL             -- 답글용
);
CREATE SEQUENCE SEQ_DOWN
START WITH 1
INCREMENT BY 1;

ALTER TABLE DOWN
ADD CONSTRAINT FK_DOWN_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

select * from review


