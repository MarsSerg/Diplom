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
   where r.fkeyid = object_id('Skateboard') and o.name = 'FK_SKATEBOA_REFERENCE_RIDING_S')
alter table Skateboard
   drop constraint FK_SKATEBOA_REFERENCE_RIDING_S
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
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
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
   Concave              char(20)             null,
   Nose                 char(20)             null,
   Tale                 char(20)             null,
   Wheelbase            char(20)             null,
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
/* Table: Skateboard                                            */
/*==============================================================*/
create table Skateboard (
   ID                   int                  not null,
   Picture              binary(1)            null,
   Boardstyle_ID        int                  null,
   Tracks_ID            int                  null,
   Wheels_ID            int                  null,
   Ridingstyle_ID       int                  null,
   Bearings_ID          int                  null,
   Name                 char(20)             null,
   Description          char(1000)           null,
   constraint PK_SKATEBOARD primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: Tracks                                                */
/*==============================================================*/
create table Tracks (
   Tracks_ID            int                  not null,
   Size                 int                  null,
   constraint PK_TRACKS primary key nonclustered (Tracks_ID)
)
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   id                   char(10)             not null,
   Login                char(20)             null,
   Password             char(8)              null,
   constraint PK_USER primary key nonclustered (id)
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
   add constraint FK_SKATEBOA_REFERENCE_RIDING_S foreign key (Ridingstyle_ID)
      references Riding_Style (Ridingstyle_ID)
go

alter table Skateboard
   add constraint FK_SKATEBOA_REFERENCE_TRACKS foreign key (Tracks_ID)
      references Tracks (Tracks_ID)
go
