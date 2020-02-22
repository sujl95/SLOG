--------------------------------------------------------
--  ������ ������ - ������-2��-10-2020   
--------------------------------------------------------
DROP SEQUENCE "BLOG_B_SEQ";
DROP SEQUENCE "BLOG_CT_SEQ";
DROP SEQUENCE "BLOG_REPLY_SEQ";
DROP SEQUENCE "BLOG_SEQ";
DROP SEQUENCE "BM_SEQ";
DROP SEQUENCE "B_SEQ";
DROP SEQUENCE "MEM_SEQ";
DROP SEQUENCE "TEST_SEQ";
DROP TABLE "B" cascade constraints;
DROP TABLE "BLOG_B" cascade constraints;
DROP TABLE "BLOG_BM" cascade constraints;
DROP TABLE "BLOG_CT" cascade constraints;
DROP TABLE "BLOG_REPLY" cascade constraints;
DROP TABLE "BM" cascade constraints;
DROP TABLE "CLASS" cascade constraints;
DROP TABLE "COURSES" cascade constraints;
DROP TABLE "GOODS_IN" cascade constraints;
DROP TABLE "MEM" cascade constraints;
DROP TABLE "OPENCLASS" cascade constraints;
DROP TABLE "PROF" cascade constraints;
DROP TABLE "SELL" cascade constraints;
DROP TABLE "STUDENT" cascade constraints;
DROP TABLE "SUBJECT" cascade constraints;
DROP TABLE "TEST" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence BLOG_B_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_B_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999 INCREMENT BY 1 START WITH 122 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BLOG_CT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_CT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BLOG_REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_REPLY_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BLOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BM_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence B_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1 START WITH 31 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MEM_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TEST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table B
--------------------------------------------------------

  CREATE TABLE "B" 
   (	"B_NO" NUMBER, 
	"B_TITLE" VARCHAR2(100), 
	"B_CON" VARCHAR2(500), 
	"B_DT" DATE, 
	"B_HIT" NUMBER, 
	"DEL_YN" NUMBER, 
	"BM_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_B
--------------------------------------------------------

  CREATE TABLE "BLOG_B" 
   (	"B_NO" NUMBER, 
	"B_TITLE" VARCHAR2(100), 
	"B_CON" VARCHAR2(2000), 
	"B_DT" DATE, 
	"B_HIT" NUMBER, 
	"DEL_YN" NUMBER, 
	"BM_NO" NUMBER, 
	"CT_NAME" VARCHAR2(20)
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_BM
--------------------------------------------------------

  CREATE TABLE "BLOG_BM" 
   (	"BM_NO" NUMBER, 
	"BM_ID" VARCHAR2(20), 
	"BM_PW" VARCHAR2(24), 
	"BM_NM" VARCHAR2(20), 
	"BM_JOIN" DATE DEFAULT SYSDATE, 
	"DEL_YN" NUMBER DEFAULT 1
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_CT
--------------------------------------------------------

  CREATE TABLE "BLOG_CT" 
   (	"CT1" VARCHAR2(20), 
	"CT2" VARCHAR2(20), 
	"CT3" VARCHAR2(20), 
	"CT4" VARCHAR2(20), 
	"CT5" VARCHAR2(20), 
	"BM_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_REPLY
--------------------------------------------------------

  CREATE TABLE "BLOG_REPLY" 
   (	"REPLY_NO" NUMBER, 
	"B_NO" NUMBER, 
	"REPLY_CONTENTS" VARCHAR2(400), 
	"REPLY_DT" DATE, 
	"BM_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BM
--------------------------------------------------------

  CREATE TABLE "BM" 
   (	"BM_NO" NUMBER, 
	"BM_ID" VARCHAR2(20), 
	"BM_PW" VARCHAR2(24), 
	"BM_NM" VARCHAR2(20), 
	"BM_JOIN" DATE DEFAULT SYSDATE, 
	"DEL_YN" NUMBER DEFAULT 1
   ) ;
--------------------------------------------------------
--  DDL for Table CLASS
--------------------------------------------------------

  CREATE TABLE "CLASS" 
   (	"CLASS_NO" NUMBER, 
	"CLASS_NAME" VARCHAR2(100)
   ) ;

   COMMENT ON COLUMN "CLASS"."CLASS_NO" IS '�а���ȣ';
   COMMENT ON COLUMN "CLASS"."CLASS_NAME" IS '�а���';
--------------------------------------------------------
--  DDL for Table COURSES
--------------------------------------------------------

  CREATE TABLE "COURSES" 
   (	"STUD_NO" NUMBER, 
	"OPCLASS_NO" NUMBER, 
	"COUR_GRADE" NUMBER
   ) ;

   COMMENT ON COLUMN "COURSES"."STUD_NO" IS '�й�';
   COMMENT ON COLUMN "COURSES"."OPCLASS_NO" IS '�����ڵ�';
   COMMENT ON COLUMN "COURSES"."COUR_GRADE" IS '����';
--------------------------------------------------------
--  DDL for Table GOODS_IN
--------------------------------------------------------

  CREATE TABLE "GOODS_IN" 
   (	"IN_NO" NUMBER(*,0), 
	"��ǰ��" VARCHAR2(20), 
	"����" NUMBER(*,0), 
	"����" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MEM
--------------------------------------------------------

  CREATE TABLE "MEM" 
   (	"MEM_NO" NUMBER, 
	"MEM_ID" VARCHAR2(100), 
	"MEM_PW" VARCHAR2(400), 
	"MEM_NM" VARCHAR2(100)
   ) ;

   COMMENT ON COLUMN "MEM"."MEM_NO" IS 'ȸ����ȣ';
   COMMENT ON COLUMN "MEM"."MEM_ID" IS 'ȸ�����̵�';
   COMMENT ON COLUMN "MEM"."MEM_PW" IS 'ȸ����й�ȣ';
   COMMENT ON COLUMN "MEM"."MEM_NM" IS 'ȸ���̸�';
--------------------------------------------------------
--  DDL for Table OPENCLASS
--------------------------------------------------------

  CREATE TABLE "OPENCLASS" 
   (	"OPCLASS_NO" NUMBER, 
	"PROF_NO" NUMBER, 
	"SUB_NO" NUMBER, 
	"OPCLASS_SM" VARCHAR2(20)
   ) ;

   COMMENT ON COLUMN "OPENCLASS"."OPCLASS_NO" IS '�����ڵ�';
   COMMENT ON COLUMN "OPENCLASS"."PROF_NO" IS '������ȣ';
   COMMENT ON COLUMN "OPENCLASS"."SUB_NO" IS '�����ڵ�';
   COMMENT ON COLUMN "OPENCLASS"."OPCLASS_SM" IS '�б�';
--------------------------------------------------------
--  DDL for Table PROF
--------------------------------------------------------

  CREATE TABLE "PROF" 
   (	"PROF_NO" NUMBER, 
	"PROF_NAME" VARCHAR2(100), 
	"CLASS_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "PROF"."PROF_NO" IS '������ȣ';
   COMMENT ON COLUMN "PROF"."PROF_NAME" IS '������';
   COMMENT ON COLUMN "PROF"."CLASS_NO" IS '�а���ȣ';
--------------------------------------------------------
--  DDL for Table SELL
--------------------------------------------------------

  CREATE TABLE "SELL" 
   (	"SELL_NO" NUMBER(*,0), 
	"ITEM_NAME" VARCHAR2(20), 
	"COUNT" NUMBER(*,0), 
	"SELL_DT" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "STUDENT" 
   (	"STUD_NO" NUMBER, 
	"STUD_NAME" NUMBER, 
	"STUD_SEX" VARCHAR2(20), 
	"STUD_BIRTH" DATE, 
	"STUD_ADDR" VARCHAR2(20), 
	"CLASS_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "STUDENT"."STUD_NO" IS '�й�';
   COMMENT ON COLUMN "STUDENT"."STUD_NAME" IS '�̸�';
   COMMENT ON COLUMN "STUDENT"."STUD_SEX" IS '����';
   COMMENT ON COLUMN "STUDENT"."STUD_BIRTH" IS '�������';
   COMMENT ON COLUMN "STUDENT"."STUD_ADDR" IS '�ּ�';
   COMMENT ON COLUMN "STUDENT"."CLASS_NO" IS '�а���ȣ';
--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUB_NO" NUMBER, 
	"SUB_NAME" VARCHAR2(100)
   ) ;

   COMMENT ON COLUMN "SUBJECT"."SUB_NO" IS '�����ڵ�';
   COMMENT ON COLUMN "SUBJECT"."SUB_NAME" IS '����';
--------------------------------------------------------
--  DDL for Table TEST
--------------------------------------------------------

  CREATE TABLE "TEST" 
   (	"NO" NUMBER, 
	"TITLE" VARCHAR2(100), 
	"CON" VARCHAR2(4000), 
	"DT" DATE DEFAULT SYSDATE, 
	"WRITER" VARCHAR2(100), 
	"HIT" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "NO" IS '�۹�ȣ';
   COMMENT ON COLUMN "TITLE" IS '����';
   COMMENT ON COLUMN "CON" IS '����';
   COMMENT ON COLUMN "DT" IS '�ۼ���';
   COMMENT ON COLUMN "WRITER" IS '�ۼ���';
   COMMENT ON COLUMN "HIT" IS '��ȸ��';
REM INSERTING into B
SET DEFINE OFF;
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (12,'test1','test1',to_date('19/12/05','RR/MM/DD'),5,1,2);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (13,'test2','test23',to_date('19/12/05','RR/MM/DD'),7,1,2);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (14,'test3','test3',to_date('19/12/05','RR/MM/DD'),11,1,2);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (18,'1231','1231',to_date('19/12/05','RR/MM/DD'),1,0,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (19,'1234','1234',to_date('19/12/05','RR/MM/DD'),1,0,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (20,'asdf','asdf',to_date('19/12/05','RR/MM/DD'),5,1,4);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (25,'etst','sets',to_date('19/12/11','RR/MM/DD'),3,0,8);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (26,'test11231','<span style="color:#e74c3c"><span style="font-size:48px">test123123</span></span>',to_date('19/12/20','RR/MM/DD'),11,1,9);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (27,'testimage','<img alt="" src="resources/upload/20191227100250480650background.jpg" style="height:1279px; width:1920px" />test',to_date('19/12/27','RR/MM/DD'),20,1,9);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (28,'123123123','123123123',to_date('20/01/06','RR/MM/DD'),2,1,9);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (29,'testestes','testestes',to_date('20/01/06','RR/MM/DD'),1,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (21,'�ӱ��','�ӱ���',to_date('19/12/10','RR/MM/DD'),11,1,8);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (1,'TEST1','TEST1',to_date('19/12/04','RR/MM/DD'),13,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (2,'TEST2','TEST2',to_date('19/12/04','RR/MM/DD'),8,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (3,'TEST3','TEST3',to_date('19/12/04','RR/MM/DD'),6,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (4,'TEST4','TEST4',to_date('19/12/04','RR/MM/DD'),3,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (5,'TEST5','TEST5',to_date('19/12/04','RR/MM/DD'),1,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (6,'TEST6','TEST6',to_date('19/12/04','RR/MM/DD'),0,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (7,'TEST7','TEST7',to_date('19/12/04','RR/MM/DD'),0,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (8,'TEST8','TEST8',to_date('19/12/04','RR/MM/DD'),0,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (9,'TEST9','TEST9',to_date('19/12/04','RR/MM/DD'),1,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (10,'TEST10','TEST10',to_date('19/12/04','RR/MM/DD'),3,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (11,'TEST11','TEST11',to_date('19/12/04','RR/MM/DD'),5,1,1);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (22,'���T','TEst',to_date('19/12/10','RR/MM/DD'),12,1,8);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (23,'asdf','asdf',to_date('19/12/10','RR/MM/DD'),5,0,8);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (24,'1111','1111',to_date('19/12/11','RR/MM/DD'),25,0,8);
Insert into B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO) values (30,'123412341234','123412341234',to_date('20/01/08','RR/MM/DD'),4,1,8);
REM INSERTING into BLOG_B
SET DEFINE OFF;
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (27,'�ƺ�ġ��','����',to_date('20/01/13','RR/MM/DD'),1,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (31,'��','��',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (33,'��������','��������',to_date('20/01/13','RR/MM/DD'),1,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (24,'SERVER2','SERVER2',to_date('20/01/13','RR/MM/DD'),5,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (34,'������','��������',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (38,'�ù�','��',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (40,'�� �Ǽ���','��',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (41,'����','����',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (45,'as','dfasdf',to_date('20/01/13','RR/MM/DD'),11,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (74,'123','123',to_date('20/01/14','RR/MM/DD'),132,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (76,'����','��������',to_date('20/01/15','RR/MM/DD'),1,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (78,'��������','����������',to_date('20/01/15','RR/MM/DD'),1,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (79,'��������','��������',to_date('20/01/15','RR/MM/DD'),1,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (80,'test','test',to_date('20/01/15','RR/MM/DD'),2,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (85,'����','����',to_date('20/01/15','RR/MM/DD'),5,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (26,'server','serer',to_date('20/01/13','RR/MM/DD'),9,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (63,'�������� ','��',to_date('20/01/14','RR/MM/DD'),36,1,1,'2');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (64,'��','��',to_date('20/01/14','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (65,'1','1',to_date('20/01/14','RR/MM/DD'),6,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (66,'d','d',to_date('20/01/14','RR/MM/DD'),4,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (67,'1','1',to_date('20/01/14','RR/MM/DD'),3,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (68,'12','12',to_date('20/01/14','RR/MM/DD'),3,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (69,'2','2',to_date('20/01/14','RR/MM/DD'),15,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (70,'3','3',to_date('20/01/14','RR/MM/DD'),6,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (71,'3','3',to_date('20/01/14','RR/MM/DD'),7,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (72,'1','12',to_date('20/01/14','RR/MM/DD'),16,0,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (73,'ra','ar',to_date('20/01/14','RR/MM/DD'),29,0,1,'3');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (75,'�׽�Ʈ','�±�<img alt="" src="resources/upload/20200115111450509338background2.png" style="height:300px; width:966px" />',to_date('20/01/15','RR/MM/DD'),8,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (77,'��������','��������',to_date('20/01/15','RR/MM/DD'),2,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (81,'sd','dsds',to_date('20/01/15','RR/MM/DD'),0,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (82,'gdgd','gdgd',to_date('20/01/15','RR/MM/DD'),4,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (83,'testtest','testest',to_date('20/01/15','RR/MM/DD'),2,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (84,'gdgd','gdgd',to_date('20/01/15','RR/MM/DD'),4,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (86,'����','������������',to_date('20/01/15','RR/MM/DD'),5,1,22,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (87,'�׽�Ʈ12','�׽�Ʈ3123',to_date('20/01/16','RR/MM/DD'),46,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (88,'cate1','cate1',to_date('20/01/16','RR/MM/DD'),3,1,23,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (103,'SQL TEST','�ۼ���',to_date('20/01/20','RR/MM/DD'),4,0,24,'3');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (104,'ffff','dddd',to_date('20/01/20','RR/MM/DD'),3,0,25,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (105,'cccc','cc',to_date('20/01/20','RR/MM/DD'),1,1,25,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (11,'TITLE11','CON11',to_date('20/01/20','RR/MM/DD'),9,1,4,'2');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (12,'TITLE12','CON12',to_date('20/01/20','RR/MM/DD'),77,1,4,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (13,'TITLE13test','etestes',to_date('20/01/08','RR/MM/DD'),81,1,1,'4');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (14,'TITLE14','CON14',to_date('19/12/24','RR/MM/DD'),36,1,1,'2');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (15,'12341234','1234estestAAA',to_date('20/01/08','RR/MM/DD'),3885,1,1,'5');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (16,'TITLE16','CON16',to_date('19/12/24','RR/MM/DD'),31,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (17,'TITLE17','CON17',to_date('19/12/24','RR/MM/DD'),5,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (18,'TITLE18','CON18',to_date('19/12/24','RR/MM/DD'),128,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (19,'TITLE19','CON19',to_date('19/12/24','RR/MM/DD'),8,1,3,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (20,'TITLE20','CON20',to_date('19/12/24','RR/MM/DD'),6,1,3,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (21,'TITLE21','CON21',to_date('19/12/24','RR/MM/DD'),29,1,3,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (1,'TITLE1','CON1',to_date('19/12/20','RR/MM/DD'),48,1,1,'3');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (2,'TITLE2','CON2',to_date('19/12/20','RR/MM/DD'),45,1,1,'3');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (3,'TITLE3','CON3',to_date('19/12/20','RR/MM/DD'),54,0,1,'5');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (4,'TITLE4','CON4',to_date('19/12/20','RR/MM/DD'),49,1,1,'5');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (5,'TITLE5','CON5',to_date('19/12/20','RR/MM/DD'),3,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (6,'TITLE6','CON6',to_date('19/12/20','RR/MM/DD'),3,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (7,'TITLE7','CON7',to_date('19/12/20','RR/MM/DD'),2,1,2,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (8,'TITLE8','CON8',to_date('19/12/20','RR/MM/DD'),1,1,3,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (9,'TITLE9','CON9',to_date('19/12/20','RR/MM/DD'),2,1,3,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (10,'TITLE10','CON10',to_date('20/01/20','RR/MM/DD'),26,1,4,'3');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (62,'�ɶ��ƴ�','����',to_date('20/01/14','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (102,'4�׽�Ʈ','�׽�Ʈ',to_date('20/01/20','RR/MM/DD'),5,1,4,'4');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (23,'SERVER1','SERVER1',to_date('20/01/13','RR/MM/DD'),2,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (25,'Android1','Android1',to_date('20/01/13','RR/MM/DD'),55,1,1,'4');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (28,'���Ŷ�','��',to_date('20/01/13','RR/MM/DD'),53,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (22,'�����','�ȳ�',to_date('20/01/13','RR/MM/DD'),842,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (29,'testes','tes',to_date('20/01/13','RR/MM/DD'),6,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (30,'servertest','test',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (32,'���Ǽ���','��',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (35,'12341234','12341234',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (36,'�����̷��׷�;������;�Ӥ����;','��������������������',to_date('20/01/13','RR/MM/DD'),2,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (37,'��','����',to_date('20/01/13','RR/MM/DD'),6,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (39,'����','�Ǽ���',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (42,'�ǽʽô٤�','����',to_date('20/01/13','RR/MM/DD'),3,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (43,'�־ȵǴ°ų�','��?',to_date('20/01/13','RR/MM/DD'),0,1,1,'1');
Insert into BLOG_B (B_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,BM_NO,CT_NAME) values (44,'����','����',to_date('20/01/13','RR/MM/DD'),10,1,1,'1');
REM INSERTING into BLOG_BM
SET DEFINE OFF;
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (2,'123123','IkzgcrFmzLoB6NEoIfa+Lg==','123123',to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (3,'1232','PZxnm14+FXjdZ8REwsvyGA==','1232',to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (4,'1233','JMiN4PI9IzwxUZ7mkMZa8Q==','1233',to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (22,'test2','m/RvEY2EIPPWJOafzDHF3Q==','TheWing',to_date('20/01/15','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (25,'aaaa','m/RvEY2EIPPWJOafzDHF3Q==','cccc',to_date('20/01/20','RR/MM/DD'),0);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (21,'test1','m/RvEY2EIPPWJOafzDHF3Q==','TheWing',to_date('20/01/15','RR/MM/DD'),0);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (23,'asdf','/31x/Nq9bEubbfgghT4q6g==','����',to_date('20/01/16','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (24,'12345','eFNudVfdmtDHtuKZm4hLIg==','12345�г�',to_date('20/01/20','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (5,'test','ScodMx7+jRWMxJOLoEXWZQ==','test�̸�',to_date('20/01/04','RR/MM/DD'),1);
Insert into BLOG_BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (1,'1234','m/RvEY2EIPPWJOafzDHF3Q==','1234',to_date('19/12/09','RR/MM/DD'),1);
REM INSERTING into BLOG_CT
SET DEFINE OFF;
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('1','2','3','4','5',4);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('LOL',null,null,null,null,22);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('cccc',null,null,null,null,25);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('1',null,null,null,null,3);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('Test1','Test2','Test3',null,null,21);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('cate1',null,null,null,null,23);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('ī�װ�1','2','SQL','MSSQL','ORACLE',24);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('ī��1','ī��2','ī��3','ī��4','ī��5',2);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('Server','PHP, HTML , Script','DB','Android','IOS',1);
Insert into BLOG_CT (CT1,CT2,CT3,CT4,CT5,BM_NO) values ('ī�װ�1',null,null,null,null,5);
REM INSERTING into BLOG_REPLY
SET DEFINE OFF;
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (10,4,'��2��2',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (11,75,'�±�',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (18,82,'tq',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (20,75,'����',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (31,69,'����',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (34,74,'��������',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (1,74,'TEST',to_date('20/01/14','RR/MM/DD'),1);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (2,74,'TEST',to_date('20/01/14','RR/MM/DD'),1);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (3,74,'�ȳ��ϼ���',to_date('20/01/14','RR/MM/DD'),1);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (32,74,'����',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (33,87,'��������',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (9,15,'����',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (7,74,'��������',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (8,15,'��������',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (19,85,'�ȴ�����',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (21,86,'��������',to_date('20/01/15','RR/MM/DD'),22);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (23,87,'�ȳ�',to_date('20/01/16','RR/MM/DD'),23);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (39,87,'ssssssssssssssssssssssssss��������������������������������ssssssssssssssssssssssssss��������������������������������ssssssssssssssssssssssssss��������������������������������ssssssssssssssssssssssssss��������������������������������ssssssssssssssssssssssssss����������',to_date('20/01/20','RR/MM/DD'),1);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (27,74,'��������',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (40,21,'asdf',to_date('20/01/20','RR/MM/DD'),25);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (42,104,'asdf',to_date('20/01/20','RR/MM/DD'),25);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (4,74,'test',to_date('20/01/14','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (5,74,'���̿�',to_date('20/01/14','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (26,74,'����',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (29,71,'����',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (28,74,'�Ǿ��',to_date('20/01/20','RR/MM/DD'),4);
Insert into BLOG_REPLY (REPLY_NO,B_NO,REPLY_CONTENTS,REPLY_DT,BM_NO) values (30,70,'�־ȵ���',to_date('20/01/20','RR/MM/DD'),4);
REM INSERTING into BM
SET DEFINE OFF;
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (2,'a','a','a',to_date('19/12/05','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (1,'aa','aa','aa',to_date('19/12/04','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (3,'b','b','b',to_date('19/12/05','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (4,'asdf','asdf','asdf',to_date('19/12/05','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (6,'1212','1212','1212',to_date('19/12/09','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (8,'1234','m/RvEY2EIPPWJOafzDHF3Q==','1234',to_date('19/12/09','RR/MM/DD'),1);
Insert into BM (BM_NO,BM_ID,BM_PW,BM_NM,BM_JOIN,DEL_YN) values (9,'123123','IkzgcrFmzLoB6NEoIfa+Lg==','123123',to_date('19/12/11','RR/MM/DD'),1);
REM INSERTING into CLASS
SET DEFINE OFF;
REM INSERTING into COURSES
SET DEFINE OFF;
REM INSERTING into GOODS_IN
SET DEFINE OFF;
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (10,'������',10,to_date('19/11/29','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (9,'������',7,to_date('19/11/28','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (8,'������',6,to_date('19/11/26','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (7,'������',3,to_date('19/11/22','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (6,'������',2,to_date('19/11/19','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (5,'������',7,to_date('19/11/20','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (4,'������',3,to_date('19/11/13','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (3,'����',5,to_date('19/11/13','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (2,'�ȸ�����',2,to_date('19/11/13','RR/MM/DD'));
Insert into GOODS_IN (IN_NO,"��ǰ��","����","����") values (1,'������',7,to_date('19/11/13','RR/MM/DD'));
REM INSERTING into MEM
SET DEFINE OFF;
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (2,'1234134','12341234','112341234');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (4,'aaaa','aaaa','aaaa');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (5,'bbbb','bbbb','bbb');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (6,'ccc','ccc','ccc');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (7,'cccccc','cccc','cccccc');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (12,'aass','aass','aass');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (13,'ssss','ssss','ssss');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (14,'123','123','123');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (15,'1313','1313','1313');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (16,'asdf','asdfa','asdf');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (17,'zxcv','zxcv','zxcv');
Insert into MEM (MEM_NO,MEM_ID,MEM_PW,MEM_NM) values (1,'12','1234','SJ');
REM INSERTING into OPENCLASS
SET DEFINE OFF;
REM INSERTING into PROF
SET DEFINE OFF;
REM INSERTING into SELL
SET DEFINE OFF;
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (20,'����',17,to_date('19/11/30','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (19,'����',3,to_date('19/11/30','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (18,'ȣ�ڰ���',22,to_date('19/11/30','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (17,'ȣ��',8,to_date('19/11/30','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (16,'����',11,to_date('19/11/29','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (15,'ȣ��',26,to_date('19/11/29','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (14,'����',4,to_date('19/11/29','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (13,'ȣ�ڰ���',23,to_date('19/11/26','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (12,'��ȣ��',7,to_date('19/11/26','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (11,'����',8,to_date('19/11/26','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (10,'����',4,to_date('19/11/26','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (9,'ȣ��',5,to_date('19/11/26','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (8,'����',10,to_date('19/11/23','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (7,'����',8,to_date('19/11/23','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (6,'����',8,to_date('19/11/22','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (5,'����',12,to_date('19/11/21','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (4,'ȣ�ڰ���',3,to_date('19/11/21','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (3,'����',7,to_date('19/11/21','RR/MM/DD'));
Insert into SELL (SELL_NO,ITEM_NAME,COUNT,SELL_DT) values (2,'ȣ��',5,to_date('19/11/21','RR/MM/DD'));
REM INSERTING into STUDENT
SET DEFINE OFF;
REM INSERTING into SUBJECT
SET DEFINE OFF;
REM INSERTING into TEST
SET DEFINE OFF;
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (18,'asd','asdfasdf',to_date('19/12/03','RR/MM/DD'),'fasdfasdf',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (19,'test','test',to_date('19/12/05','RR/MM/DD'),'t',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (15,'AA','AA',to_date('19/11/28','RR/MM/DD'),'AA',3);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (1,'TEST1','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (2,'TEST2','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (3,'TEST3','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (4,'TEST4','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (5,'TEST5','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (6,'TEST6','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (7,'TEST7','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (8,'TEST8','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (9,'TEST9','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (10,'TEST10','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (11,'TEST11','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',0);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (12,'TEST12','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',9);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (13,'TEST13','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',11);
Insert into TEST (NO,TITLE,CON,DT,WRITER,HIT) values (14,'TEST14','TEST',to_date('19/10/28','RR/MM/DD'),'TESTER',3);
--------------------------------------------------------
--  DDL for Index BLOG_BM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_BM_PK" ON "BLOG_BM" ("BM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_B_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_B_PK" ON "BLOG_B" ("B_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_REPLY_PK" ON "BLOG_REPLY" ("REPLY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BM_PK" ON "BM" ("BM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index B_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "B_PK" ON "B" ("B_NO") 
  ;
--------------------------------------------------------
--  DDL for Index CLASS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLASS_PK" ON "CLASS" ("CLASS_NO") 
  ;
--------------------------------------------------------
--  DDL for Index MEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEM_PK" ON "MEM" ("MEM_PW") 
  ;
--------------------------------------------------------
--  DDL for Index MEM_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEM_UK1" ON "MEM" ("MEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPENCLASS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPENCLASS_PK" ON "OPENCLASS" ("OPCLASS_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PROF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROF_PK" ON "PROF" ("PROF_NO") 
  ;
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENT_PK" ON "STUDENT" ("STUD_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SUBJECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBJECT_PK" ON "SUBJECT" ("SUB_NO") 
  ;
--------------------------------------------------------
--  DDL for Index TEST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_PK" ON "TEST" ("NO") 
  ;
--------------------------------------------------------
--  Constraints for Table B
--------------------------------------------------------

  ALTER TABLE "B" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "B" ADD CONSTRAINT "B_PK" PRIMARY KEY ("B_NO") ENABLE;
  ALTER TABLE "B" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "B" MODIFY ("B_HIT" NOT NULL ENABLE);
  ALTER TABLE "B" MODIFY ("B_DT" NOT NULL ENABLE);
  ALTER TABLE "B" MODIFY ("B_CON" NOT NULL ENABLE);
  ALTER TABLE "B" MODIFY ("B_TITLE" NOT NULL ENABLE);
  ALTER TABLE "B" MODIFY ("B_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_B
--------------------------------------------------------

  ALTER TABLE "BLOG_B" ADD CONSTRAINT "BLOG_B_PK" PRIMARY KEY ("B_NO") ENABLE;
  ALTER TABLE "BLOG_B" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_HIT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_DT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_CON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_BM
--------------------------------------------------------

  ALTER TABLE "BLOG_BM" ADD CONSTRAINT "BLOG_BM_PK" PRIMARY KEY ("BM_NO") ENABLE;
  ALTER TABLE "BLOG_BM" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BM" MODIFY ("BM_JOIN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BM" MODIFY ("BM_NM" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BM" MODIFY ("BM_PW" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BM" MODIFY ("BM_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BM" MODIFY ("BM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_CT
--------------------------------------------------------

  ALTER TABLE "BLOG_CT" MODIFY ("BM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_REPLY
--------------------------------------------------------

  ALTER TABLE "BLOG_REPLY" ADD CONSTRAINT "BLOG_REPLY_PK" PRIMARY KEY ("REPLY_NO") ENABLE;
  ALTER TABLE "BLOG_REPLY" MODIFY ("B_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_REPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BM
--------------------------------------------------------

  ALTER TABLE "BM" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "BM" MODIFY ("BM_JOIN" NOT NULL ENABLE);
  ALTER TABLE "BM" MODIFY ("BM_NM" NOT NULL ENABLE);
  ALTER TABLE "BM" MODIFY ("BM_PW" NOT NULL ENABLE);
  ALTER TABLE "BM" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "BM" ADD CONSTRAINT "BM_PK" PRIMARY KEY ("BM_NO") ENABLE;
  ALTER TABLE "BM" MODIFY ("BM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLASS
--------------------------------------------------------

  ALTER TABLE "CLASS" ADD CONSTRAINT "CLASS_PK" PRIMARY KEY ("CLASS_NO") ENABLE;
  ALTER TABLE "CLASS" MODIFY ("CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "CLASS" MODIFY ("CLASS_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "COURSES" MODIFY ("COUR_GRADE" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("OPCLASS_NO" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("STUD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GOODS_IN
--------------------------------------------------------

  ALTER TABLE "GOODS_IN" MODIFY ("����" NOT NULL ENABLE);
  ALTER TABLE "GOODS_IN" MODIFY ("��ǰ��" NOT NULL ENABLE);
  ALTER TABLE "GOODS_IN" MODIFY ("IN_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEM
--------------------------------------------------------

  ALTER TABLE "MEM" ADD CONSTRAINT "MEM_UK1" UNIQUE ("MEM_ID") ENABLE;
  ALTER TABLE "MEM" ADD CONSTRAINT "MEM_PK" PRIMARY KEY ("MEM_PW") ENABLE;
  ALTER TABLE "MEM" MODIFY ("MEM_NM" NOT NULL ENABLE);
  ALTER TABLE "MEM" MODIFY ("MEM_PW" NOT NULL ENABLE);
  ALTER TABLE "MEM" MODIFY ("MEM_ID" NOT NULL ENABLE);
  ALTER TABLE "MEM" MODIFY ("MEM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OPENCLASS
--------------------------------------------------------

  ALTER TABLE "OPENCLASS" ADD CONSTRAINT "OPENCLASS_PK" PRIMARY KEY ("OPCLASS_NO") ENABLE;
  ALTER TABLE "OPENCLASS" MODIFY ("OPCLASS_SM" NOT NULL ENABLE);
  ALTER TABLE "OPENCLASS" MODIFY ("SUB_NO" NOT NULL ENABLE);
  ALTER TABLE "OPENCLASS" MODIFY ("PROF_NO" NOT NULL ENABLE);
  ALTER TABLE "OPENCLASS" MODIFY ("OPCLASS_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROF
--------------------------------------------------------

  ALTER TABLE "PROF" MODIFY ("CLASS_NO" NOT NULL ENABLE);
  ALTER TABLE "PROF" MODIFY ("PROF_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROF" ADD CONSTRAINT "PROF_PK" PRIMARY KEY ("PROF_NO") ENABLE;
  ALTER TABLE "PROF" MODIFY ("PROF_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SELL
--------------------------------------------------------

  ALTER TABLE "SELL" MODIFY ("SELL_DT" NOT NULL ENABLE);
  ALTER TABLE "SELL" MODIFY ("COUNT" NOT NULL ENABLE);
  ALTER TABLE "SELL" MODIFY ("ITEM_NAME" NOT NULL ENABLE);
  ALTER TABLE "SELL" MODIFY ("SELL_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" MODIFY ("CLASS_NO" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("STUD_ADDR" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("STUD_NO") ENABLE;
  ALTER TABLE "STUDENT" MODIFY ("STUD_BIRTH" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("STUD_SEX" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("STUD_NAME" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("STUD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" ADD CONSTRAINT "SUBJECT_PK" PRIMARY KEY ("SUB_NO") ENABLE;
  ALTER TABLE "SUBJECT" MODIFY ("SUB_NAME" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" MODIFY ("SUB_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEST
--------------------------------------------------------

  ALTER TABLE "TEST" ADD CONSTRAINT "TEST_PK" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "TEST" MODIFY ("HIT" NOT NULL ENABLE);
  ALTER TABLE "TEST" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "TEST" MODIFY ("DT" NOT NULL ENABLE);
  ALTER TABLE "TEST" MODIFY ("CON" NOT NULL ENABLE);
  ALTER TABLE "TEST" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "TEST" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table B
--------------------------------------------------------

  ALTER TABLE "B" ADD CONSTRAINT "B_FK" FOREIGN KEY ("BM_NO")
	  REFERENCES "BM" ("BM_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_B
--------------------------------------------------------

  ALTER TABLE "BLOG_B" ADD CONSTRAINT "BLOG_B_FK1" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_BM" ("BM_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_CT
--------------------------------------------------------

  ALTER TABLE "BLOG_CT" ADD CONSTRAINT "BLOG_CT_FK1" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_BM" ("BM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_REPLY
--------------------------------------------------------

  ALTER TABLE "BLOG_REPLY" ADD CONSTRAINT "BLOG_REPLY_FK1" FOREIGN KEY ("B_NO")
	  REFERENCES "BLOG_B" ("B_NO") ENABLE;
  ALTER TABLE "BLOG_REPLY" ADD CONSTRAINT "BLOG_REPLY_FK2" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_BM" ("BM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "COURSES" ADD CONSTRAINT "COURSES_FK1" FOREIGN KEY ("OPCLASS_NO")
	  REFERENCES "OPENCLASS" ("OPCLASS_NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "COURSES" ADD CONSTRAINT "COURSES_FK2" FOREIGN KEY ("STUD_NO")
	  REFERENCES "STUDENT" ("STUD_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OPENCLASS
--------------------------------------------------------

  ALTER TABLE "OPENCLASS" ADD CONSTRAINT "OPENCLASS_FK1" FOREIGN KEY ("PROF_NO")
	  REFERENCES "PROF" ("PROF_NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "OPENCLASS" ADD CONSTRAINT "OPENCLASS_FK2" FOREIGN KEY ("SUB_NO")
	  REFERENCES "SUBJECT" ("SUB_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROF
--------------------------------------------------------

  ALTER TABLE "PROF" ADD CONSTRAINT "PROF_FK1" FOREIGN KEY ("CLASS_NO")
	  REFERENCES "CLASS" ("CLASS_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "STUDENT_FK1" FOREIGN KEY ("CLASS_NO")
	  REFERENCES "CLASS" ("CLASS_NO") ON DELETE CASCADE ENABLE;
