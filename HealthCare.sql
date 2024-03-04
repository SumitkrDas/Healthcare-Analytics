create database HealthCare;
use healthcare;

SELECT * FROM DIALYSIS1 limit 3;
describe dialysis1;


-----------------------------------	KPI 1 ------------------------------------------------------------------------------------------------------------------------

select concat((round((sum(patients_in_transfusion_summary)/1000),0))," K") AS "Transfusion Summary Patients",
	concat((round((sum(patients_in_hypercalcemia_summary)/1000),0))," K") AS "Hypercalcemia Summary Patients",
		concat((round((sum(patients_in_Serum_phosphorus_summary)/1000),0))," K") AS "Serum Phosphorus Summary Patients",
			concat((round((sum(patients_included_in_hospitalization_summary)/1000),0))," K") AS "Hospitalization Summary Patients",
				concat((round((sum(patients_included_in_fistula_summary)/1000),0))," K") AS "Fistula Summary Patients",
					concat((round((sum(patients_included_in_survival_summary)/1000),0))," K") AS "Survival Summary Patients",
                    concat((round((sum(HOSPITALIZATIONS_included_in_HR_summary)/1000),0))," K") AS "Hospital Readmission Summary Patients",
						sum(patients_in_npcr_summary) AS "nPCR Summary Patients",
							concat((round((sum(patients_in_LONG_TERM_CATHETER_summary)/1000),0))," K") AS "Long Term Catheter Summary Patients"
 from dialysis1 ;

-----------------------------------	KPI 2	----------------------------------------------------------------------------------------------------------------------


SELECT profit_non_profit, count(FACILITY_NAME) as 'No. of Facilities', count(distinct chain_organization),
	sum(Offers_in_center_hemodialysis) as 'Fecilities Offers in center Hemodialysis', 
		sum(OFFERS_HOME_HEMODIALYSIS_training) as 'Fecilities Offers Home Hemodialysis Training' ,
			sum(OFFERS_PERITONEAL_DIALYSIS) as 'Fecilities Offers Peritoneal Hemodialysis' , 
				sum(NO_OF_DIALYSIS_STATIONS) as 'No. of Dialysis Stations'
		FROM DIALYSIS1
			group by PROFIT_NON_PROFIT;
            
            
------------------------------------	 KPI 3	-------------------------------------------------------------------------------------------------------------------

SELECT * FROM dialysis1 limit 3 ;

(select "patient_transfusion_category_text" ,count(*) 
 from dialysis1
	where patient_transfusion_category_text = 'as_expected'  
			union ALL
select "Patient_hospitalization_category_text" ,count(*) 
	from dialysis1
		where Patient_hospitalization_category_text = 'as_expected' 
			union all
 select "Patient_Hospital_Readmission_Category" ,count(*) 
	from dialysis1
		where Patient_Hospital_Readmission_Category = 'as_expected'   
			union all
select "Patient_Survival_Category_Text" ,count(*) 
	from dialysis1
		where Patient_Survival_Category_Text = 'as_expected'
			union all
select "Patient_Infection_category_text" ,count(*) 
	from dialysis1
		where Patient_Infection_category_text = 'as_expected'
			union all
select "Fistula_Category_Text" ,count(*) 
	from dialysis1
		where Fistula_Category_Text = 'as_expected'
			union all
select "SWR_category_text", count(*) 
	from dialysis1
		where SWR_category_text = 'as_expected' 
			union all
select "PPPW_category_text" ,count(*) 
	from dialysis1
		where PPPW_category_text = 'as_expected' ) ;
    
    
    
    
-----------------------------------------	 KPI 4	-------------------------------------------------------------------------------------------------------------------


SELECT * FROM dialysis1 limit 3 ;


select    FACILITY_NAME , sum(NO_OF_DIALYSIS_STATIONS) AS 'Total Dialysis Stations' FROM dialysis1
	group by Facility_Name 
		order by sum(NO_OF_DIALYSIS_STATIONS) desc
			limit 10 ;
            
select    distinct Chain_Organization , sum(NO_OF_DIALYSIS_STATIONS) AS 'Total Dialysis Stations' FROM dialysis1
	group by Chain_Organization 
		order by sum(NO_OF_DIALYSIS_STATIONS) desc
			limit 10 ;

select    Profit_Non_Profit , sum(NO_OF_DIALYSIS_STATIONS) AS 'Total Dialysis Stations' FROM dialysis1
	group by Profit_Non_Profit 
		order by sum(NO_OF_DIALYSIS_STATIONS) desc
			limit 10 ;
            
--------------------------------------	 KPI 5	----------------------------------------------------------------------------------------------------------------------

select * from dialysis1 limit 5;
select * from dialysis2 limit 5;

select  Chain_Organization , count(Chain_Organization)  
from dialysis1 as a
	inner join 
dialysis2 as b on a.Provider_Number = b.CMS_Certification_Number
	where b.Total_Performance_Score = 0 
		group by Chain_Organization
			order by count(chain_organization) desc 
				limit 5 ;
                
                
-------------------------------------------	KPI 6	--------------------------------------------------------------------------------------------------------------------


select * FROM dialysis1 limit 5 ;
SELECT * FROM DIALYSIS2 LIMIT 5 ;


SELECT A.FACILITY_NAME , AVG(B.PY2020_PAYMENT_REDUCTION_PERCENTAGE)*100 
	FROM DIALYSIS1 AS A
		INNER JOIN
	DIALYSIS2 AS B ON A.PROVIDER_NUMBER = B.CMS_CERTIFICATION_NUMBER
		WHERE A.FIVE_STAR = 5
			GROUP BY FACILITY_NAME
				ORDER BY AVG(B.PY2020_PAYMENT_REDUCTION_PERCENTAGE) DESC
					LIMIT 10 ;

SELECT A.CHAIN_ORGANIZATION , ROUND((AVG(B.PY2020_PAYMENT_REDUCTION_PERCENTAGE)*100),2) 
	FROM DIALYSIS1 AS A
		INNER JOIN
	DIALYSIS2 AS B ON A.PROVIDER_NUMBER = B.CMS_CERTIFICATION_NUMBER
		WHERE A.FIVE_STAR = 5
			GROUP BY CHAIN_ORGANIZATION
				ORDER BY AVG(B.PY2020_PAYMENT_REDUCTION_PERCENTAGE) DESC
					LIMIT 10 ;












            
            
