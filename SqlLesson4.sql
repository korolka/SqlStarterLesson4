--�������� 2

--�������� ���� ����� ������������ ��������� 100 ��,
--�������������, �� ���� ����������������� ������� 30 ��.
--������ �� �������� ������������. ������ ���������� �� ���� ������������ �� ������ ��������� ����� (���� �).
use master
create database MilitaryGroup
on
(
name = 'Military',
filename = 'E:\Military.mdf',
size =  30,
maxsize = 100
)
log on
(
name = 'LogMilitary',
filename = 'E:\Military.ldf',
size = 30,
maxsize =100
)
COLLATE Cyrillic_General_CI_AS 

use MilitaryGroup
go
--�������� 3

--����������� ���� �������:

--���                   �����   ������   ������ �����
--������ �.�.,��.205      222   ��-47    ����� �.�., �����
--������ �.�.,��.205      222   ����20   ������� �.�., �����
--������� �.�.,��.221     232   ��-74    ��������� �.�., ������������
--������� �.�.,��.221     232   ����20   ������� �.�., �����
--�������� �.�., ��.201   212   ��-47    ����� �.�., �����
--�������� �.�., ��.201   212   ����20   ������� �.�., �����
--����� �.�.              200   ��-47    ����� �.�., �����


create table Platoon
(
PlatoonId smallint identity not null,
PlatoonName varChar(10) not null
)
go

alter table Platoon
add constraint PK_PlatoonId
primary key (PlatoonId)
go

insert into Platoon 
(platoonName)
values 
('222'),
('232'),
('212'),
('200');
go

create table ArmoryGetter
(
SoldierGetterId smallint identity not null,
SoldierGetterFullName varchar(30) not null,
PlatoonId smallInt not null,
[Off] smallint null 
)
go

alter table armoryGetter
add constraint FK_PlatoonId
foreign key (PlatoonId) references Platoon(PlatoonId)
go

alter table ArmoryGetter
add constraint PK_SoldierGetterId
primary key (SoldierGetterId)
go

insert into ArmoryGetter
(SoldierGetterFullName,PlatoonId,[off])
values
('������ �.�.',1,205),
('������� �.�.',2,221 ),
('�������� �.�.',3,201 ),
('����� �.�.',4,null ); 

create table [Rank] 
(
RankId smallint identity not null,
RankName varchar(20) not null 
)
go

alter table [Rank]
add constraint PK_RankId
primary key (RankId)
go

insert into [rank]
(RankName)
values
('�����'),
('������������');

Create table ArmorySetter
(
SoldierSetterId smallint identity not null,
SoldierSetterFullName varchar(30) not null,
RankId smallint not null
)
go

alter table ArmorySetter 
add constraint FK_RankId
foreign key (RankId) references [Rank](RankId)
go


alter table ArmorySetter
add constraint PK_SoldierSetterId
primary key (SoldierSetterId)
go

insert into ArmorySetter
(SoldierSetterFullName,RankId)
values 
('����� �.�.',1),
('������� �.�.',1),
('��������� �.�.',2);

create table Weapons
(
WeaponId smallint identity not null,
WeaponName varchar(10) not null
)
go

alter table weapons
add constraint PK_WeaponId
primary key (WeaponId)
go


insert into weapons
(WeaponName)
values 
('��-47'),
('��-74'),
('����20');

create table GetWeapon
(
SoldierGetterId smallint not null,
SoldierSetterId smallint not null,
WeaponId smallint not null,
)
go

insert into GetWeapon
(SoldierGetterId,SoldierSetterId,WeaponId)
values
(1,1,1),
(1,2,3),
(2,3,2),
(2,2,3),
(3,1,1),
(3,2,3),
(4,1,1);

alter table GetWeapon
add constraint PK_GetWeaponSoldierGetterSetterId
primary key (SoldierGetterId,SoldierSetterId)

alter table GetWeapon
add constraint FK_SoldierGetterId
foreign key (SoldierGetterId) references ArmoryGetter(SoldierGetterId)
go

alter table GetWeapon
add constraint FK_SoldierSetterId
foreign key (SoldierSetterId) references ArmorySetter(SoldierSetterId)
go

alter table GetWeapon
add constraint FK_WeaponId
foreign key (WeaponId) references weapons(WeaponId)
go


select * from Weapons
select * from getweapon
select * from ArmoryGetter
select * from ArmorySetter
select * from [Rank]
select * from Platoon

drop table Weapons
