
{{
	config (materialized = 'view')
}}

with view_count_institution_by_region AS (

	SELECT 
        fdic_supervisory_region AS Region,
        COUNT(fdic_certificate_number) AS Nbre_Occurences
	FROM
		dev-country-423722-b5.dbt_skounga.institutions
    GROUP BY 
        fdic_supervisory_region
    ORDER BY 
        Nbre_Occurences DESC
)

SELECT * from view_count_institution_by_region 

   -- dbt build -s view_count_institution_by_region.sql