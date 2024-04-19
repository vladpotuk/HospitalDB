USE HospitalDB;

CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Doctors (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0 CHECK (Premium >= 0),
    Salary MONEY NOT NULL CHECK (Salary > 0)
);

CREATE TABLE DoctorsExaminations (
    Id INT PRIMARY KEY IDENTITY,
    StartTime TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00'),
    EndTime TIME NOT NULL CHECK (EndTime > StartTime AND EndTime <= '18:00'),
    DoctorId INT NOT NULL,
    ExaminationId INT NOT NULL,
    WardId INT NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
    FOREIGN KEY (ExaminationId) REFERENCES Examinations(Id),
    FOREIGN KEY (WardId) REFERENCES Wards(Id)
);

CREATE TABLE Donations (
    Id INT PRIMARY KEY IDENTITY,
    Amount MONEY NOT NULL CHECK (Amount > 0),
    Date DATE NOT NULL DEFAULT GETDATE() CHECK (Date <= GETDATE()),
    DepartmentId INT NOT NULL,
    SponsorId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
    FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
);

CREATE TABLE Examinations (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Sponsors (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Wards (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20) NOT NULL UNIQUE,
    Places INT NOT NULL CHECK (Places >= 1),
    DepartmentId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
