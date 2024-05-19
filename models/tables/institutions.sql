
{{
	config (materialized = 'table')
}}

    -- DROP TABLE dev-country-423722-b5.dbt_skounga.institutions;
	SELECT 
		*
	--INTO
	--	'dev-country-423722-b5.dev.institutions'
	FROM
		bigquery-public-data.fdic_banks.institutions
   -- LIMIT 1000 
   -- dbt build -s institutions.sql