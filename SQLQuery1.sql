USE HospitalDB;

SELECT Name
FROM Departments
WHERE Building = ANY (SELECT Building FROM Departments WHERE Name = 'Cardiology');

SELECT Name
FROM Departments
WHERE Building = ANY (SELECT Building FROM Departments WHERE Name IN ('Gastroenterology', 'General Surgery'));

SELECT Name
FROM Departments
WHERE Id = ANY (SELECT TOP 1 DepartmentId FROM Donations GROUP BY DepartmentId ORDER BY SUM(Amount));

SELECT Surname
FROM Doctors
WHERE Salary > ANY (SELECT Salary FROM Doctors WHERE Surname = 'Gerada' AND Name = 'Thomas');

SELECT Name
FROM Wards
WHERE Places > ANY (SELECT AVG(Places) FROM Wards WHERE DepartmentId = (SELECT Id FROM Departments WHERE Name = 'Microbiology'));

SELECT CONCAT(Name, ' ', Surname) AS Fullname
FROM Doctors
WHERE Salary + Premium > ALL (SELECT Salary * 100 FROM Doctors WHERE Surname = 'Davis' AND Name = 'Anthony');

SELECT Name
FROM Departments
WHERE EXISTS (
    SELECT 1
    FROM Wards w
    JOIN DoctorsExaminations de ON w.Id = de.WardId
    JOIN Doctors d ON de.DoctorId = d.Id
    WHERE w.DepartmentId = Departments.Id AND d.Name = 'Joshua' AND d.Surname = 'Bell'
);

SELECT Name
FROM Sponsors
WHERE NOT EXISTS (
    SELECT 1
    FROM Departments d
    JOIN Donations dn ON d.Id = dn.DepartmentId
    WHERE d.Name IN ('Neurology', 'Oncology') AND dn.SponsorId = Sponsors.Id
);

SELECT DISTINCT Surname
FROM Doctors
WHERE Id = ANY (
    SELECT DoctorId
    FROM DoctorsExaminations
    WHERE StartTime >= '12:00' AND EndTime <= '15:00'
);
