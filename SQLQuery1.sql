-- Вставка даних в таблицю "Departments"
INSERT INTO Departments (Building, Name) VALUES
(1, 'Cardiology'),
(1, 'Gastroenterology'),
(2, 'General Surgery'),
(2, 'Neurology'),
(3, 'Oncology'),
(3, 'Microbiology');

-- Вставка даних в таблицю "Doctors"
INSERT INTO Doctors (Name, Surname, Premium, Salary) VALUES
('John', 'Doe', 200.00, 5000.00),
('Jane', 'Smith', 150.00, 4500.00),
('Michael', 'Johnson', 180.00, 4800.00),
('Emily', 'Brown', 170.00, 4700.00),
('David', 'Taylor', 160.00, 4600.00),
('Emma', 'Martinez', 190.00, 4900.00);

-- Вставка даних в таблицю "Examinations"
INSERT INTO Examinations (Name) VALUES
('Blood Test'),
