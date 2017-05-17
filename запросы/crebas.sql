/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     09.05.2017 14:53:26                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skate_Riding') and o.name = 'FK_SKATE_RI_REFERENCE_SKATEBOA')
alter table Skate_Riding
   drop constraint FK_SKATE_RI_REFERENCE_SKATEBOA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skate_Riding') and o.name = 'FK_SKATE_RI_REFERENCE_RIDING_S')
alter table Skate_Riding
   drop constraint FK_SKATE_RI_REFERENCE_RIDING_S
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skateboard') and o.name = 'FK_SKATEBOA_REFERENCE_BOARDSTY')
alter table Skateboard
   drop constraint FK_SKATEBOA_REFERENCE_BOARDSTY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skateboard') and o.name = 'FK_SKATEBOA_REFERENCE_WHEELS')
alter table Skateboard
   drop constraint FK_SKATEBOA_REFERENCE_WHEELS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skateboard') and o.name = 'FK_SKATEBOA_REFERENCE_BEARINGS')
alter table Skateboard
   drop constraint FK_SKATEBOA_REFERENCE_BEARINGS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Skateboard') and o.name = 'FK_SKATEBOA_REFERENCE_TRACKS')
alter table Skateboard
   drop constraint FK_SKATEBOA_REFERENCE_TRACKS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Bearings')
            and   type = 'U')
   drop table Bearings
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Boardstyle')
            and   type = 'U')
   drop table Boardstyle
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Riding_Style')
            and   type = 'U')
   drop table Riding_Style
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Skate_Riding')
            and   type = 'U')
   drop table Skate_Riding
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Skateboard')
            and   type = 'U')
   drop table Skateboard
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tracks')
            and   type = 'U')
   drop table Tracks
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Wheels')
            and   type = 'U')
   drop table Wheels
go

/*==============================================================*/
/* Table: Bearings                                              */
/*==============================================================*/
create table Bearings (
   Bearings_ID          int                  not null,
   Name                 char(20)             null,
   MadeOf               char(20)             null,
   constraint PK_BEARINGS primary key nonclustered (Bearings_ID)
)
go

/*==============================================================*/
/* Table: Boardstyle                                            */
/*==============================================================*/
create table Boardstyle (
   Boardstyle_ID        int                  not null,
   Length               char(20)             null,
   Width                char(20)             null,
   Nose                 char(20)             null,
   Tale                 char(20)             null,
   Curved_tale          char(20)             null,
   Wheelbase            char(20)             null,
   "Type of deck"       char(20)             null,
   constraint PK_BOARDSTYLE primary key nonclustered (Boardstyle_ID)
)
go

/*==============================================================*/
/* Table: Riding_Style                                          */
/*==============================================================*/
create table Riding_Style (
   Ridingstyle_ID       int                  not null,
   RidingStyle          char(20)             null,
   constraint PK_RIDING_STYLE primary key nonclustered (Ridingstyle_ID)
)
go

/*==============================================================*/
/* Table: Skate_Riding                                          */
/*==============================================================*/
create table Skate_Riding (
   Ridingstyle_ID       int                  not null,
   Skate_ID             int                  null,
   constraint PK_SKATE_RIDING primary key nonclustered (Ridingstyle_ID)
)
go

/*==============================================================*/
/* Table: Skateboard                                            */
/*==============================================================*/
create table Skateboard (
   Skate_ID             int                  not null,
   Picture              binary(1)            null,
   Boardstyle_ID        int                  null,
   Tracks_ID            int                  null,
   Wheels_ID            int                  null,
   Bearings_ID          int                  null,
   Name                 char(20)             null,
   Description          char(1000)           null,
   constraint PK_SKATEBOARD primary key nonclustered (Skate_ID)
)
go

/*==============================================================*/
/* Table: Tracks                                                */
/*==============================================================*/
create table Tracks (
   Tracks_ID            int                  not null,
   Size                 int                  null,
   Type                 char(20)             null,
   constraint PK_TRACKS primary key nonclustered (Tracks_ID)
)
go

/*==============================================================*/
/* Table: Wheels                                                */
/*==============================================================*/
create table Wheels (
   Wheels_ID            int                  not null,
   Size                 char(4)              null,
   Hardness             int                  null,
   constraint PK_WHEELS primary key nonclustered (Wheels_ID)
)
go

alter table Skate_Riding
   add constraint FK_SKATE_RI_REFERENCE_SKATEBOA foreign key (Skate_ID)
      references Skateboard (Skate_ID)
go

alter table Skate_Riding
   add constraint FK_SKATE_RI_REFERENCE_RIDING_S foreign key (Ridingstyle_ID)
      references Riding_Style (Ridingstyle_ID)
go

alter table Skateboard
   add constraint FK_SKATEBOA_REFERENCE_BOARDSTY foreign key (Boardstyle_ID)
      references Boardstyle (Boardstyle_ID)
go

alter table Skateboard
   add constraint FK_SKATEBOA_REFERENCE_WHEELS foreign key (Wheels_ID)
      references Wheels (Wheels_ID)
go

alter table Skateboard
   add constraint FK_SKATEBOA_REFERENCE_BEARINGS foreign key (Bearings_ID)
      references Bearings (Bearings_ID)
go

alter table Skateboard
   add constraint FK_SKATEBOA_REFERENCE_TRACKS foreign key (Tracks_ID)
      references Tracks (Tracks_ID)
go

