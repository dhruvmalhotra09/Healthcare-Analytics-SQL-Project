# Healthcare-Analytics-SQL-Project
This project analyzes healthcare data across patients, appointments, diagnoses, and medications using advanced SQL.
The goal is to derive operational, clinical, and patient-engagement insights to improve healthcare delivery.

# Project Objective

To analyze multi-table healthcare data and uncover insights about:

- Appointment completion

- Doctor workload & performance

- Patient demographics

- Diagnosis & medication trends

- Data quality gaps

- Chronic care indicators

- Age-based patient segments

A combination of SQL joins, window functions, subqueries, CASE logic, and date functions is used to perform the analysis.

# Tech Stack

- <b>SQL (MySQL)</b> — Joins, Window Functions, Subqueries, CTEs, Date Functions

- <b>Excel</b> — Data cleaning and validation

- <b>PowerPoint</b> — Final business presentation

# Dataset Overview

The project uses five datasets:
<table>
  <tr>
    <th>File</th>
    <th>Description</th>
</tr>
  <tr>
    <td>appointments.xlsx	</td>
    <td>All appointment details including patient & doctor IDs<td>
  </tr>
  <tr>
    <td>patients.xlsx</td>
    <td>Patient demographics & contact data</td>
  </tr>
   <tr>
    <td>doctors.xlsx</td>
    <td>Doctor names & specializations</td>
  </tr>
    <tr>
    <td>diagnoses.xlsx</td>
    <td>Diagnosis records linked to appointments</td>
  </tr>
    <tr>
    <td>medications.xlsx</td>
    <td>Medication details including start & end dates</td>
  </tr>
</table>

# Data Cleaning & Preparation

- Validated all date fields

- Checked missing values across patient & doctor IDs

- Standardized text fields

- Identified mismatches across appointments & diagnoses

- Ensured medication dates followed proper sequence

# Key Tasks & Insights
<table>
  <tr>
    <th>Task</th>
    <th>Objective</th>
    <th>Key Insight</th>
  </tr>
  <tr>
    <td><b>1. Completed Appointments</b></td>
    <td>Overview	Join appointments + patients + doctors</td>
    <td>3,392/10,000 appointments completed (~34%)</td>
  </tr>
  <tr>
    <td><b>2. Patients Without Appointments</td>
    <td>Identify inactive patients</td>
    <td>662 patients never booked an appointment</td>
  </tr>
    <tr>
    <td><b>3. Doctor Diagnosis Count</td>
    <td>Diagnoses handled per doctor</td>
    <td>Most doctors handled 40–60 cases; a few exceed 70</td>
  </tr>
  <tr>
    <td><b>4. Appointments–Diagnoses Mismatch</td>
    <td>Identify missing links</td>
    <td>Large mismatch volume → documentation gaps</td>
  </tr>
  <tr>
    <td><b>5. Ranking Patients by Visits</td>
    <td>DENSE_RANK per doctor</td>
    <td>Very few recurring consultations per doctor</td>
  </tr>
  <tr>
    <td><b>6. Age Group Segmentation</td>
    <td>CASE-based grouping	Majority</td>
    <td>(2,684) are 51+ → elderly care demand</td>
  </tr>
  <tr>
    <td><b>7. Contact Pattern Search</td>
    <td>LIKE + UPPER()</td>
    <td>Only 1 patient ends with "1234"</td>
  </tr>
  <tr>
    <td><b>8. Insulin-Only Patients</td>
    <td>Subquery across diagnoses & medications</td>
    <td>1,784 patients prescribed insulin → huge diabetic population</td>
  </tr>
  <tr>
    <td><b>9. Avg. Medication Duration</td>
    <td>DATEDIFF + AVG	Durations range</td>
    <td>+1080 to -1077 → chronic cases & data errors</td>
  </tr>
    <tr>
    <td><b>10. Doctor With Most Unique Patients</td>
    <td>COUNT(DISTINCT)</td>
    <td>Doctor_37 has highest reach (51 unique patients)</td>
  </tr>
</table>

# Strategic Insights

- Elderly population (51+) dominates → need stronger geriatric care pipelines.

- High diabetic population (1,784 insulin patients) → set up chronic-care management.

- Documentation mismatches indicate urgent need for system validation checks.

- Appointment completion low (34%) → improve reminders, slot optimization.

- Workload imbalance among doctors → redistribute cases & support high performers.

- Recurring visits low → improve follow-up & continuity of care programs.


# Project Structure

Healthcare-Analytics-SQL-Project/<br>
│<br>
├── Data/<br>
│   ├── appointments.xlsx<br>
│   ├── diagnoses.xlsx<br>
│   ├── doctors.xlsx<br>
│   ├── medications.xlsx<br>
│   └── patients.xlsx<br>
│<br>
├── SQL/<br>
│   └── Healthcare_SQL_Queries.sql<br>
│<br>
├── Presentation/<br>
│   └── Healthcare Analytics.pptx<br>
│<br>
└── README.md<br>

# Conclusion

This SQL project delivers actionable insights across:

- Appointment management

- Patient engagement

- Doctor productivity

- Chronic disease patterns

- Data accuracy

- Medication planning
