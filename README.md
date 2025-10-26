---------------------------------------------------------------------------------
# IT Service Management Ticket Analysis & Power BI Dashboard

This project focuses on analyzing IT incident tickets to uncover insights around
ticket volume, SLA performance, priority trends, and support team effectiveness.
The goal was to build a clean end-to-end workflow: from raw data ➝ SQL cleaning
➝ Power BI visualization.

----------------------------------------------------------------------------------

## Project Objectives
- Clean and standardize the incident ticket dataset using SQL
- Improve data quality for more accurate reporting
- Build a Power BI dashboard optimized for desktop usage
- Provide visibility into SLA compliance, category trends, and assignment groups
- Help IT support make faster, data-driven decisions

------------------------------------------------------------------------------------

## Tools & Technologies
| Tool           |          Purpose 
|----------------|-----------------------------------
| SQL (SQLite)   | Data cleaning and transformation 
| Power BI       | Interactive dashboard and reporting
| Excel/CSV      | Data review and formatting 

--------------------------------------------------------------------------------------

## Folder Structure 
'''
Data-Analysis-IT-Tickets/
│
├─ Data/
│ ├─ incident_event_log.csv # Raw data
│ └─ incidents_final.csv # Cleaned data
│ 
│
├─ SQL/
│ └─ incidents_final_setup.sql # Full data cleaning script
│
├─ PowerBI/
│ └─ IT_Tickets_Dashboard.pbix # Final report
│
├─ Assets/
│ └─ dashboard_overview.png # Screenshot(s) of dashboard
│
└─ README.md 
'''





---------------------------------------------------------------------------------------------

## Data Cleaning Overview

The SQL script is responsible for:

- Trimming and standardizing text fields  
- Replacing missing `?` values with `'Unknown'`  
- Converting boolean fields `true/false` → `1/0`  
- Standardizing date format to `YYYY-MM-DD HH:MM`  
- Preparing final dataset ready for analytics  

File: `SQL/incidents_final_setup.sql`

--------------------------------------------------------------------------------------------

## Power BI Dashboard Features

The report includes:

- **Slicers** for Category, Subcategory, Assignment Group, Priority
- **KPIs**: Total Tickets, Open Tickets, Knowledge Used, SLA Compliance Rate
- **Trend analysis** for opened vs resolved tickets
- **SLA performance** by category and support team

Styled for:
Desktop viewing  
- Fast filtering  
- Simplicity + clarity  

--------------------------------------------------------------------------------------------

## How to Use

1. Import data using the provided SQL script *(or just load the cleaned CSV)*  
2. Open the `.pbix` file in Power BI  
3. Interact with slicers to explore insights  

--------------------------------------------------------------------------------------------

## Data Source

Dataset Source: Kaggle — “ServiceNow Incident Event Log”  
Used here for educational & portfolio project purposes only.
© Data belongs to the original creators  
https://www.kaggle.com/datasets 

------------------------------------------------------------------------------------------------

## Author

**Olumide Johnson**  
End-to-end Data Analytics & Visualization

-------------------------------------------------------------------------------------------

Happy to connect ----- feedback and collaboration welcome!

