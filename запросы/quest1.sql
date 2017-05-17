/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     22.04.2017 18:12:02                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Answers') and o.name = 'FK_ANSWERS_REFERENCE_QUESTION')
alter table Answers
   drop constraint FK_ANSWERS_REFERENCE_QUESTION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Answers')
            and   type = 'U')
   drop table Answers
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Questions')
            and   type = 'U')
   drop table Questions
go

/*==============================================================*/
/* Table: Answers                                               */
/*==============================================================*/
create table Answers (
   Answer_ID            int                  not null,
   Quest_ID             int                  null,
   Text                 char(1000)           null,
   Parent_quest_ID      int                  null,
   constraint PK_ANSWERS primary key nonclustered (Answer_ID)
)
go

/*==============================================================*/
/* Table: Questions                                             */
/*==============================================================*/
create table Questions (
   Quest_ID             int                  not null,
   Description          char(1000)           null,
   constraint PK_QUESTIONS primary key nonclustered (Quest_ID)
)
go

alter table Answers
   add constraint FK_ANSWERS_REFERENCE_QUESTION foreign key (Quest_ID)
      references Questions (Quest_ID)
go

