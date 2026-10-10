# 📉 Global Layoffs Data Cleaning & Workforce Market Analytics

> **📌 Note:** Due to GitHub file preview limits, the dataset file (`layoffs_data.csv`) included in this repository contains a representative sample of 200 rows to ensure seamless browser table preview.

A professional, end-to-end data auditing, cleaning, and market intelligence project using **T-SQL (SQL Server)** and **Power BI** to investigate global corporate layoffs, industry trends, and venture funding impacts across 2020–2024.

---

## 📂 Repository Structure & Project Files

This repository contains all necessary resources to run, review, and interact with the project:

* 📊 **Interactive Power BI Report:** [`Layoff Analytics.pbix`](./Layoff%20Analytics.pbix) *(Download & open in Power BI Desktop for full interactivity)*
* 📜 **SQL Cleaning Script:** [`Layoffs.sql`](./Layoffs.sql) *(T-SQL script for data auditing, missing value handling, deduplication, and data transformation)*
* 📂 **Sample Dataset:** [`layoffs_data.csv`](./layoffs_data.csv) *(Representative 200-row sample of the global layoffs transactional dataset)*
* 🖼️ **Executive Dashboard:** High-resolution preview screenshot included below.

---

## 📌 Project Overview & Key Discoveries
Global economic shifts in recent years have triggered massive workforce restructuring across tech, retail, and finance sectors. This project processes raw, uncleaned layoff data through a rigorous T-SQL pipeline, followed by an executive-level Power BI dashboard tracking global job cuts, hardest-hit industries, geographic distributions, and top-funded companies.

### 🔍 Core Business & Market Discoveries:
- **Top Individual Company Layoffs:** **Amazon** emerged as the **#1 employer globally** with the highest total workforce layoffs (**27.8K** employees), followed closely by **Meta** (21.0K), **Tesla** (14.5K), **Microsoft** (14.1K), and **Google** (13.5K).
- **Hardest-Hit Sector:** The **Retail** industry suffered the largest impact with **70.2K** total layoffs, closely followed by **Consumer Goods** (67.7K) and **Transportation** (59.4K).
- **Venture Capital & Layoffs Paradox:** High funding doesn't guarantee job security; major venture-backed giants facing severe layoffs were led by **Tesla** ($60.6B raised) and **Meta** ($52.0B raised).
- **Temporal Peak:** Corporate layoffs reached an all-time peak in **2023** (**131.9K** employees laid off), representing a massive spike compared to 2021 (8.0K).
- **Geographic Concentration:** The **United States** accounted for the vast majority of global tech and corporate layoffs mapped across the interactive geographical view.

---

## 📊 Dashboard Preview

Below is a high-resolution snapshot of the interactive **Power BI** executive dashboard:

### 🌍 Global Layoffs Market Overview
- **Core KPIs:** Total Laid Off (616K), Total Companies (2,238), Total Industries (31), and Total Countries (57).
- **Interactive Time Slicers:** Year-by-year filtering (2020 through 2024) to isolate macroeconomic trends.

![Layoff Analytics](./Layoff%20Analytics.png)

---

## 🛠️ Tools & Technologies Used
- **SQL Server (T-SQL):** 
  - Data auditing & exploratory query design.
  - Handling missing data (`NULL` replacements) and string standardizations.
  - Removing duplicate records and validating data integrity using CTEs and window functions.
- **Power Query:** Data shaping, type conversions, and missing value cleaning before visualization.
- **Power BI Desktop:** 
  - **DAX (Data Analysis Expressions):** Implemented custom DAX measures for totals, percentage breakdowns, and conditional rankings.
  - **Data Modeling:** Established star-schema relationships and custom sort columns.
  - **UI/UX Design:** Dark/Light contrast cards, minimalist layout, custom color palettes, and Bing Map geographic integration.
- **Git & GitHub:** Version control, file management, and professional documentation.

---

## 🚀 How to Run & Use
1. **Clone or Download:** Clone this repository to your local machine.
2. **Database Setup:** Import the [`layoffs_data.csv`](./layoffs_data.csv) dataset into your SQL Server database.
3. **Execute Cleaning Pipeline:** Run the [`Layoffs.sql`](./Layoffs.sql) script to audit and prepare the cleaned database tables.
4. **Interactive Dashboard:** Download and open the [`Layoff Analytics.pbix`](./Layoff%20Analytics.pbix) file in **Power BI Desktop** to explore the interactive visual analytics and time-slicers.
