
{{
	config (materialized = 'table')
}}

    -- DROP TABLE dev-country-423722-b5.dbt_skounga.locations;
	SELECT 
		*
	FROM
		bigquery-public-data.fdic_banks.locations
   -- LIMIT 1000 
   -- dbt build -s locations.sql