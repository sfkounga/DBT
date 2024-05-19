
{{
	config (materialized = 'view')
}}

with view_count_institution_by_name AS (

	SELECT 
        fdic_supervisory_region AS Region,
        CASE
            WHEN primary_specialization IS NULL THEN "No Specialization"
            ELSE primary_specialization
        END AS Specialisation,
        COUNT(fdic_certificate_number) AS Nbre_Occurences
	FROM
		dev-country-423722-b5.dbt_skounga.institutions
    GROUP BY 
        fdic_supervisory_region,
        Specialisation   
)

SELECT * from view_count_institution_by_name 

   -- dbt build -s view_count_by_region_and_spez.sql