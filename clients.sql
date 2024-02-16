--
-- File generated with SQLiteStudio v3.4.4 on pet. okt. 13 08:47:14 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: client_appointment
CREATE TABLE IF NOT EXISTS client_appointment (appointmentID INTEGER PRIMARY KEY UNIQUE NOT NULL, clientID INTEGER REFERENCES client_info (clientID) ON DELETE NO ACTION NOT NULL, reportID INTEGER REFERENCES client_report (reportID) ON DELETE NO ACTION, appointmentDate TEXT NOT NULL, appointmentTime TEXT NOT NULL, appointmentEdit TEXT, appointmentStatus TEXT);

-- Table: client_bill
CREATE TABLE IF NOT EXISTS client_bill (billID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, clientID INTEGER REFERENCES client_info (clientID) ON DELETE NO ACTION NOT NULL, appointmentID INTEGER REFERENCES client_appointment (appointmentID) ON DELETE NO ACTION NOT NULL, billDate TEXT NOT NULL, billName NOT NULL);

-- Table: client_info
CREATE TABLE IF NOT EXISTS client_info (clientID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, clientName TEXT NOT NULL, clientLastName TEXT NOT NULL, clientStreet TEXT NOT NULL, clientZip NUMERIC NOT NULL, clientCity TEXT NOT NULL, clientDOB TEXT, clientAge INTEGER, clientEmail TEXT NOT NULL, clientMobile TEXT, clientDiagnosis TEXT, clientAmnesia TEXT NOT NULL);

-- Table: client_report
CREATE TABLE IF NOT EXISTS client_report (reportID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, clientID INTEGER REFERENCES client_info (clientID) ON DELETE NO ACTION MATCH SIMPLE NOT NULL, reportDate TEXT NOT NULL, reportDateEdit TEXT, reportReport TEXT NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
