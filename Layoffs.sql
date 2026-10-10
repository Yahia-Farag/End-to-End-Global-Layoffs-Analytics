-- =============================================
-- GLOBAL LAYOFFS DATA CLEANING & EDA PROJECT
-- SQL Server (T-SQL)
-- =============================================

USE Layoffs;

-- =============================================
-- PART 1: DATA INSPECTION & EXPLORATION
-- =============================================

-- Check total number of rows in the dataset
SELECT COUNT(*) AS Total_Rows 
FROM layoffs_data;

-- Preview the first 10 rows to understand data structure
SELECT TOP 10 * 
FROM layoffs_data;

-- Check for missing or null values across all columns
SELECT 
    SUM(CASE WHEN Company IS NULL THEN 1 ELSE 0 END) AS Missing_Company,
    SUM(CASE WHEN Location_HQ IS NULL THEN 1 ELSE 0 END) AS Missing_Location,
    SUM(CASE WHEN Industry IS NULL THEN 1 ELSE 0 END) AS Missing_Industry,
    SUM(CASE WHEN Laid_Off_Count IS NULL THEN 1 ELSE 0 END) AS Missing_Laid_Off_Count,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Source IS NULL THEN 1 ELSE 0 END) AS Missing_Source,
    SUM(CASE WHEN Funds_Raised IS NULL THEN 1 ELSE 0 END) AS Missing_Funds_Raised,
    SUM(CASE WHEN Date_Added IS NULL THEN 1 ELSE 0 END) AS Missing_Date_Added,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Missing_Country,
    SUM(CASE WHEN Percentage IS NULL THEN 1 ELSE 0 END) AS Missing_Percentage,
    SUM(CASE WHEN List_of_Employees_Laid_Off IS NULL THEN 1 ELSE 0 END) AS Missing_List_of_Employees_Laid_Off
FROM layoffs_data;


-- =============================================
-- PART 2: DATA CLEANING & STANDARDIZATION
-- =============================================

-- 1. Identify Duplicate Rows using a CTE and ROW_NUMBER()
WITH Duplicate_CTE AS (
    SELECT 
        Company, Location_HQ, Industry, Laid_Off_Count, Date, Source, 
        Funds_Raised, Stage, Date_Added, Country, Percentage, List_of_Employees_Laid_Off,
        ROW_NUMBER() OVER (
            PARTITION BY Company, Location_HQ, Industry, Laid_Off_Count, Date, Source, 
                         Funds_Raised, Stage, Date_Added, Country, Percentage, List_of_Employees_Laid_Off 
            ORDER BY (SELECT NULL)
        ) AS row_num
    FROM layoffs_data
)
SELECT * 
FROM Duplicate_CTE 
WHERE row_num > 1;

-- 2. Remove rows where both Laid_Off_Count and Percentage are NULL (useless records)
DELETE FROM layoffs_data
WHERE Laid_Off_Count IS NULL 
  AND Percentage IS NULL;

-- 3. Clean and round the Percentage column values to 2 decimal places
UPDATE layoffs_data
SET Percentage = ROUND(Percentage, 2) 
WHERE Percentage IS NOT NULL;

-- 4. Remove rows where the employee list column contains unwanted placeholder values (e.g., 'x')
DELETE FROM layoffs_data
WHERE List_of_Employees_Laid_Off = 'x';


-- =============================================
-- PART 3: EXPLORATORY DATA ANALYSIS (EDA)
-- =============================================

-- Top 5 Countries with the highest total layoffs
SELECT TOP 5 Country, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
GROUP BY Country
ORDER BY Total_Laid_Off DESC;

-- Top 5 Companies with the highest total layoffs
SELECT TOP 5 Company, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
GROUP BY Company
ORDER BY Total_Laid_Off DESC;

-- Top 5 Industries with the highest total layoffs
SELECT TOP 5 Industry, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
GROUP BY Industry
ORDER BY Total_Laid_Off DESC;

-- Total layoffs by Year in the United States
SELECT YEAR(Date) AS Layoff_Year, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
WHERE Country = 'United States' AND Date IS NOT NULL
GROUP BY YEAR(Date)
ORDER BY Total_Laid_Off DESC;

-- Global total layoffs broken down by Year (from highest to lowest)
SELECT YEAR(Date) AS Layoff_Year, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
WHERE Date IS NOT NULL
GROUP BY YEAR(Date)
ORDER BY Total_Laid_Off DESC;

-- Detailed multi-dimensional analysis: Total layoffs by Company and Year
SELECT Company, 
       YEAR(Date) AS Layoff_Year, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
WHERE Date IS NOT NULL
GROUP BY YEAR(Date), Company
ORDER BY Total_Laid_Off DESC;

-- Detailed multi-dimensional analysis: Total layoffs by Industry and Year
SELECT Industry, 
       YEAR(Date) AS Layoff_Year, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
WHERE Date IS NOT NULL
GROUP BY YEAR(Date), Industry
ORDER BY Total_Laid_Off DESC;

-- Detailed multi-dimensional analysis: Total layoffs by Country and Year
SELECT Country, 
       YEAR(Date) AS Layoff_Year, 
       SUM(Laid_Off_Count) AS Total_Laid_Off
FROM layoffs_data
WHERE Date IS NOT NULL
GROUP BY YEAR(Date), Country
ORDER BY Total_Laid_Off DESC;

-- Top 5 Companies with the highest total funds raised
SELECT TOP 5 Company, 
       SUM(Funds_Raised) AS Total_Funds_Raised
FROM layoffs_data
GROUP BY Company
ORDER BY Total_Funds_Raised DESC;