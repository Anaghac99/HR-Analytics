CREATE DATABASE hr_data;
USE hr_data;
SELECT * FROM hr_data.`hr analytics`;


#kpi 1(Average Attrition rate for all Departments)
SELECT 
    Department,
    AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRate
FROM 
    `hr analytics`
GROUP BY 
    Department;
    
#kpi 2(Average Hourly rate of Male Research Scientist)
SELECT 
    AVG(HourlyRate) AS AvgHourlyRate
FROM 
    `hr analytics`
WHERE 
    Gender = 'Male' AND JobRole = 'Research Scientist';
    
#kpi 3(Attrition rate Vs Monthly income stats) 

SELECT 
    CASE 
        WHEN MonthlyIncome BETWEEN 0 AND 10000 THEN '0-10000'
        WHEN MonthlyIncome BETWEEN 10001 AND 20000 THEN '10001-20000'
        WHEN MonthlyIncome BETWEEN 20001 AND 40000 THEN '20001-30000'
        WHEN MonthlyIncome BETWEEN 20001 AND 40000 THEN '30001-40000'
        WHEN MonthlyIncome > 40000 THEN '40001+'
    END AS IncomeRange,
    AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRate
FROM 
    `hr analytics`
GROUP BY 
    IncomeRange
ORDER BY 
    IncomeRange;
    
    #kpi 4(Average working years for each Department)
    SELECT 
    Department,
    AVG(TotalWorkingYears) AS AvgWorkingYears
FROM 
    `hr analytics`
GROUP BY 
    Department;
    
    #kpi 5(Job Role Vs Work life balance)
    SELECT 
    JobRole,
    COUNT(CASE WHEN WorkLifeBalance = 1 THEN 1 END) AS Poor,
    COUNT(CASE WHEN WorkLifeBalance = 2 THEN 1 END) AS Average,
    COUNT(CASE WHEN WorkLifeBalance = 3 THEN 1 END) AS Good,
    COUNT(CASE WHEN WorkLifeBalance = 4 THEN 1 END) AS Excellent
FROM 
    `hr analytics`
GROUP BY 
    JobRole
ORDER BY 
    JobRole;
    
#Kpi 6(Attrition rate Vs Year since last promotion relation)
SELECT 
    Department,YearsSinceLastPromotion,
    AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRate
FROM 
    `hr analytics`
GROUP BY 
    YearsSinceLastPromotion,Department
ORDER BY 
    YearsSinceLastPromotion,Department;











