CREATE DATABASE CrimeDatabase;
USE CrimeDatabase;
CREATE TABLE CriminalRecords (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT,
    Month VARCHAR(20),
    Release_Type VARCHAR(20),
    County_of_Commitment VARCHAR(50),
    Sex VARCHAR(10),
    Age_at_Release INT,
    Most_Serious_Crime VARCHAR(100)
);
SELECT * FROM crimedatabase.criminalrecords;

SELECT Most_Serious_Crime, COUNT(*) AS Crime_Count 
FROM CriminalRecords 
GROUP BY Most_Serious_Crime;

SELECT Sex, AVG(Age_at_Release) AS Avg_Age 
FROM CriminalRecords 
GROUP BY Sex;

SELECT Release_Type, COUNT(*) AS Release_Count
FROM CriminalRecords
GROUP BY Release_Type
ORDER BY Release_Count DESC
LIMIT 1;

SELECT Year, Month, COUNT(*) AS Records_Count
FROM CriminalRecords
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT County_of_Commitment, MAX(Age_at_Release) AS Max_Age
FROM CriminalRecords
GROUP BY County_of_Commitment;
