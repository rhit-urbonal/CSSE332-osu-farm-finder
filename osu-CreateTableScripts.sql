USE [osu map finder final]
GO

CREATE TABLE Beatmap (
	ID int PRIMARY KEY,
	[Rank Date] date,
	[Upload Date] date,
	[Star Rating] float,
	[Length] float,
	BPM float,
	[Circle Size] float,
	OD float,
	[Approach Rate] float,
)

CREATE TABLE MappedBy (
	BeatMapID int,
	MapperUsername varchar(50),
	PRIMARY KEY(BeatMapID, MapperUsername),
	FOREIGN KEY(BeatMapID) REFERENCES Beatmap(ID),
	FOREIGN KEY(MapperUsername) REFERENCES Mapper(Username)
)

CREATE TABLE Mapper (
	Username varchar(50) PRIMARY KEY,
	[Mapping Since] date
	FOREIGN KEY(Username) REFERENCES [User](Username)
)

CREATE TABLE Mods (
	[Name] varchar(50) PRIMARY KEY,
	[Agility%] float,
	[Accuracy%] float,
	[Tenacity%] float,
	[Stamina%] float,
	[Precision%] float,
	[Reaction%] float,
	[Memory%] float,
	[Reading%] float
)

CREATE TABLE [Nominated By] (
	NominatorName varchar(50),
	BeatmapID int,
	PRIMARY KEY(NominatorName, BeatmapID),
	FOREIGN KEY(NominatorName) REFERENCES Nominator(Username),
	FOREIGN KEY(BeatmapID) REFERENCES Beatmap(ID)
)

CREATE TABLE Nominator (
	Username varchar(50) PRIMARY KEY,
	[Nominating Since] date,
	[Rank] varchar(50),
	FOREIGN KEY(Username) REFERENCES [User](Username)
)

CREATE TABLE Play (
	PlayID int PRIMARY KEY,
	Username varchar(50),
	pp int,
	Score int,
	[50 count] int,
	[100 count] int,
	[300 count] int,
	[Date/Time] datetime,
	BeatmapID int,
	SkillsetID int,
	FOREIGN KEY(Username) REFERENCES Player(Username),
	FOREIGN KEY(BeatmapID) REFERENCES Beatmap(ID),
	FOREIGN KEY(SkillsetID) REFERENCES Skillset(ID)
)

CREATE TABLE Player (
	Username varchar(50) PRIMARY KEY,
	[Top Play pp] int,
	[Total pp] int,
	SkillsetID int,
	FOREIGN KEY(Username) REFERENCES Player(Username),
	FOREIGN KEY(SkillsetID) REFERENCES Skillset(ID)
)

CREATE TABLE PlaysWithMod (
	ModName varchar(50),
	PlayID int,
	PRIMARY KEY(ModName, PlayID),
	FOREIGN KEY(ModName) REFERENCES Mods([Name]),
	FOREIGN KEY(PlayID) REFERENCES Play(PlayID)
)

CREATE TABLE Skillset (
	ID int PRIMARY KEY,
	Agility int,
	Accuracy int,
	Tenacity int,
	Stamina int, 
	[Precision] int,
	Reaction int,
	Memory int,
	Reading int
)


CREATE TABLE User (
	Username varchar(50) PRIMARY KEY,
	[Creation Date] date
)