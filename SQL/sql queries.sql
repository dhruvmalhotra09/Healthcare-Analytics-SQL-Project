SELECT * FROM patients LIMIT 5;
SELECT * FROM doctors LIMIT 5;
SELECT * FROM appointments LIMIT 5;
SELECT * FROM diagnoses LIMIT 5;
SELECT * FROM medications LIMIT 5;

/*Task 1: Write a query to fetch details of all completed appointments, including the patient’s name, doctor’s name, and specialization.
Expected Learning: Demonstrates understanding of Inner Joins and filtering conditions.*/

SELECT 
    a.appointment_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    d.specialization,
    a.appointment_date
FROM 
    appointments a
INNER JOIN 
    patients p ON a.patient_id = p.patient_id
INNER JOIN 
    doctors d ON a.doctor_id = d.doctor_id
WHERE 
    a.status = 'Completed';

/*Task 2: Retrieve all patients who have never had an appointment. Include their name, contact details, and address in the output.
Expected Learning: Use of Left Joins and handling NULL values.*/

SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.contact_number,
    p.address
FROM 
    patients p
LEFT JOIN 
    appointments a 
ON p.patient_id = a.patient_id
WHERE 
    a.appointment_id IS NULL;

/*Task 3: Find the total number of diagnoses for each doctor, including doctors who haven’t diagnosed any patients. Display the doctor’s name, specialization, and total diagnoses.
 Expected Learning: Utilization of Right Joins with aggregate functions like COUNT().*/
 
 SELECT 
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    COUNT(di.diagnosis_id) AS total_diagnoses
FROM 
    doctors d
RIGHT JOIN 
    diagnoses di ON d.doctor_id = di.doctor_id
GROUP BY 
    d.doctor_id, d.name, d.specialization
ORDER BY doctor_id;

/*Task 4: Write a query to identify mismatches between the appointments and diagnoses tables. Include all appointments and diagnoses with their 
corresponding patient and doctor details. 
Expected Learning: Handling Full Joins for comparing data across multiple tables.*/

-- Appointments with any matching diagnosis
SELECT 
    a.Appointment_ID,
    a.Patient_ID AS App_Patient_ID,
    a.Doctor_ID AS App_Doctor_ID,
    d.Diagnosis_ID,
    d.Patient_ID AS Diag_Patient_ID,
    d.Doctor_ID AS Diag_Doctor_ID
FROM appointments a
LEFT JOIN diagnoses d 
    ON a.Patient_ID = d.Patient_ID AND a.Doctor_ID = d.Doctor_ID

UNION

-- Diagnoses with no matching appointment
SELECT 
    a.Appointment_ID,
    a.Patient_ID AS App_Patient_ID,
    a.Doctor_ID AS App_Doctor_ID,
    d.Diagnosis_ID,
    d.Patient_ID AS Diag_Patient_ID,
    d.Doctor_ID AS Diag_Doctor_ID
FROM diagnoses d
LEFT JOIN appointments a 
    ON d.Patient_ID = a.Patient_ID AND d.Doctor_ID = a.Doctor_ID
WHERE a.Appointment_ID IS NULL;

/*Task 5: For each doctor, rank their patients based on the number of  in descending order. 
Expected Learning: Application of Ranking Functions such as RANK() or DENSE_RANK(). */

SELECT 
    Doctor_ID,
    Patient_ID,
    COUNT(*) AS Total_Appointments,
    RANK() OVER (PARTITION BY Doctor_ID ORDER BY COUNT(*) DESC) AS Patient_Rank
FROM appointments
GROUP BY Doctor_ID, Patient_ID
ORDER BY Doctor_ID, Patient_Rank;

/*Task 6: Write a query to categorize patients by age group (e.g., 18-30, 31-50, 51+). Count the number of patients in each age group. 
Expected Learning: Using CASE statements for conditional logic. */

SELECT
  CASE
    WHEN Age BETWEEN 18 AND 30 THEN '18-30'
    WHEN Age BETWEEN 31 AND 50 THEN '31-50'
    ELSE '51+'
  END AS Age_Group,
  COUNT(*) AS Patient_Count
FROM patients
GROUP BY Age_Group
ORDER BY Age_Group;

/*Task 7: Retrieve a list of patients whose contact numbers end with "1234" and display their names in uppercase. 
Expected Learning: Use of string functions like UPPER() and LIKE. */

SELECT 
    UPPER(Name) AS Patient_Name_Uppercase,
    Contact_Number
FROM 
    patients
WHERE 
    Contact_Number LIKE '%1234';
    
/*Task 8: Find patients who have only been prescribed "Insulin" in any of their diagnoses. 
Expected Learning: Writing Subqueries for advanced filtering.*/

SELECT 
    p.Patient_ID,
    p.Name
FROM 
    patients p
WHERE 
    p.Patient_ID IN (
        SELECT 
            d.Patient_ID
        FROM 
            diagnoses d
        JOIN 
            medications m ON d.Diagnosis_ID = m.Diagnosis_ID
        GROUP BY 
            d.Patient_ID
        HAVING 
            COUNT(DISTINCT CASE WHEN m.Medication_Name = 'Insulin' THEN 1 END) = COUNT(*)
    );
    
/*Task 9: Calculate the average duration (in days) for which medications are prescribed for each diagnosis. 
Expected Learning: Working with date functions like DATEDIFF().*/

SELECT 
    Diagnosis_ID,
    ROUND(AVG(DATEDIFF(End_Date, Start_Date)), 2) AS Avg_Duration_Days
FROM 
    medications
GROUP BY 
    Diagnosis_ID
ORDER BY 
    Avg_Duration_Days DESC;

/*Task 10: Write a query to identify the doctor who has attended the most unique patients. Include the doctor’s name, specialization, and the count of unique 
patients. 
Expected Learning: Combining Joins, Grouping, and COUNT(DISTINCT). */

SELECT 
    d.Doctor_ID,
    d.Name,
    d.Specialization,
    COUNT(DISTINCT a.Patient_ID) AS Unique_Patient_Count
FROM doctors d
JOIN appointments a 
    ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_ID, d.Name, d.Specialization
ORDER BY Unique_Patient_Count DESC
LIMIT 1;



