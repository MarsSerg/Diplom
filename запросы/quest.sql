/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     22.04.2017 17:57:04                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Answers') and o.name = 'FK_ANSWERS_REFERENCE_QUESTION')
alter table Answers
   drop constraint FK_ANSWERS_REFERENCE_QUESTION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Connections') and o.name = 'FK_CONNECTI_REFERENCE_ANSWERS')
alter table Connections
   drop constraint FK_CONNECTI_REFERENCE_ANSWERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Connections') and o.name = 'FK_CONNECTI_REFERENCE_QUESTION')
alter table Connections
   drop constraint FK_CONNECTI_REFERENCE_QUESTION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Answers')
            and   type = 'U')
   drop table Answers
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Connections')
            and   type = 'U')
   drop table Connections
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
   constraint PK_ANSWERS primary key nonclustered (Answer_ID)
)
go

/*==============================================================*/
/* Table: Connections                                           */
/*==============================================================*/
create table Connections (
   Parent_ID            int                  not null,
   Answer_ID            int                  null,
   Quest_ID             int                  null,
   Costs                int                  null,
   constraint PK_CONNECTIONS primary key nonclustered (Parent_ID)
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

alter table Connections
   add constraint FK_CONNECTI_REFERENCE_ANSWERS foreign key (Answer_ID)
      references Answers (Answer_ID)
go

alter table Connections
   add constraint FK_CONNECTI_REFERENCE_QUESTION foreign key (Quest_ID)
      references Questions (Quest_ID)
go

