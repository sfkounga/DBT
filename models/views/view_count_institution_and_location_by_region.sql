

{{
	config (materialized = 'view')
}}

with view_count_institution_and_location_by_region AS (

	SELECT 
        fdic_supervisory_region AS Region,
        COUNT(a.fdic_certificate_number) AS Nbre_Occurences
	FROM
		dev-country-423722-b5.dbt_skounga.locations a
    INNER JOIN 
        dev-country-423722-b5.dbt_skounga.institutions b 
    ON
        a.fdic_certificate_number = b.fdic_certificate_number

    GROUP BY 
        Region

    ORDER BY 
        Nbre_Occurences DESC
)

SELECT * from view_count_institution_and_location_by_region 

   -- dbt build -s view_count_institution_and_location_by_region.sql