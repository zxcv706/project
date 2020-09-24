CREATE TABLE member_tbl (
  member_id VARCHAR2(20) CONSTRAINT member_tbl_id_pk PRIMARY KEY,
  member_nickname VARCHAR2(50) CONSTRAINT member_tbl_nickname_nn NOT NULL,
  member_name VARCHAR2(100) CONSTRAINT member_tbl_name_nn NOT NULL,
  member_gender char(1) CONSTRAINT member_tbl_gender_nn NOT NULL,
  member_email VARCHAR2(50) CONSTRAINT member_tbl_email_nn_un NOT NULL UNIQUE,
  member_phone VARCHAR2(13) CONSTRAINT member_tbl_phone_nn_un NOT NULL UNIQUE,
  member_birth date,
  member_zip VARCHAR2(5),
  member_address_basic VARCHAR2(600),
  member_address_detail VARCHAR2(600)
  --member_joindate DATE default sysdate
  );
    
  
comment ON COLUMN member_id IS '아이디';
comment ON COLUMN member_nickname IS '별명';
comment ON COLUMN member_name IS '이름';
comment ON COLUMN member_gender IS '성별';
comment ON COLUMN member_email IS '이메일';
comment ON COLUMN member_phone IS '연락처';
comment ON COLUMN member_birth IS '생년월일';
comment ON COLUMN member_zip IS '우편번호';
comment ON COLUMN member_address_basic IS '기본주소';
comment ON COLUMN member_address_detail IS '상세주소';

