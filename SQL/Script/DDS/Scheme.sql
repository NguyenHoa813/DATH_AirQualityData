create table DIM.[STATE] (
	StateSK int primary key,
	StateID char(2),
	StateName char(50),
	CreatedDate datetime default getdate(),
	UpdatedDate datetime default getdate()
);

create table DIM.COUNTY (
	CountySK int primary key,
	CountyFips char(5),
	CountyName char(50),
	CreatedDate datetime default getdate(),
	UpdatedDate datetime default getdate()
);

create table DIM.CATEGORY (
	CategorySK int primary key,
	CategoryName char(50),
	CreatedDate datetime default getdate(),
	UpdatedDate datetime default getdate()
);

create partition function PF_Bit(bit)
as range right for values(0);

create partition scheme PS_Bit
as partition PF_Bit
all to ([PRIMARY]);

create table DIM.[DATE]
(
	DateSK int primary key nonclustered,
	[Year] int,
	[Quarter] int,
	[Month] int,
	[Day] int,
	FullDate date,
	IsDayLightSaving bit,
	CreatedDate datetime default getdate(),
	UpdatedDate datetime default getdate()
);

create index IX_Date_IsDayLightSaving
on DIM.[DATE](IsDayLightSaving)
on PS_bit(IsDayLightSaving);

create table DIM.PARAMETER (
	ParameterSK int primary key,
	ParameterName char(50),
	CreatedDate datetime default getdate(),
	UpdatedDate datetime default getdate()
);