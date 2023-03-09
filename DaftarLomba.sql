/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     20/09/2022 09:46:59                          */
/*==============================================================*/


drop table if exists LOMBA;

drop table if exists MENDAFTAR;

drop table if exists MENGIKUTI;

drop table if exists PENDAFTARAN;

drop table if exists PESERTA;

/*==============================================================*/
/* Table: LOMBA                                                 */
/*==============================================================*/
create table LOMBA
(
   ID_LOMBA             varchar(15) not null,
   NAMA_LOMBA           longtext,
   JUMLAH_PENDAFTAR     int,
   WAKTU_LOMBA          datetime,
   primary key (ID_LOMBA)
);

/*==============================================================*/
/* Table: MENDAFTAR                                             */
/*==============================================================*/
create table MENDAFTAR
(
   NO__KTP              varchar(20) not null,
   NO_PENDAFTARAN       national varchar(20) not null,
   primary key (NO__KTP, NO_PENDAFTARAN)
);

/*==============================================================*/
/* Table: MENGIKUTI                                             */
/*==============================================================*/
create table MENGIKUTI
(
   NO_PENDAFTARAN       national varchar(20) not null,
   ID_LOMBA             varchar(15) not null,
   primary key (NO_PENDAFTARAN, ID_LOMBA)
);

/*==============================================================*/
/* Table: PENDAFTARAN                                           */
/*==============================================================*/
create table PENDAFTARAN
(
   NO_PENDAFTARAN       national varchar(20) not null,
   WAKTU_PENDAFTARAN    date,
   primary key (NO_PENDAFTARAN)
);

/*==============================================================*/
/* Table: PESERTA                                               */
/*==============================================================*/
create table PESERTA
(
   NAMA                 longtext,
   NO__KTP              varchar(20) not null,
   JENIS_KELAMIN        char(15),
   ALAMAT               longtext,
   INSTANSI             char(30),
   USIA                 int,
   TANGGAL_LAHIR        date,
   primary key (NO__KTP)
);

alter table MENDAFTAR add constraint FK_MENDAFTAR foreign key (NO__KTP)
      references PESERTA (NO__KTP) on delete restrict on update restrict;

alter table MENDAFTAR add constraint FK_MENDAFTAR2 foreign key (NO_PENDAFTARAN)
      references PENDAFTARAN (NO_PENDAFTARAN) on delete restrict on update restrict;

alter table MENGIKUTI add constraint FK_MENGIKUTI foreign key (NO_PENDAFTARAN)
      references PENDAFTARAN (NO_PENDAFTARAN) on delete restrict on update restrict;

alter table MENGIKUTI add constraint FK_MENGIKUTI2 foreign key (ID_LOMBA)
      references LOMBA (ID_LOMBA) on delete restrict on update restrict;

