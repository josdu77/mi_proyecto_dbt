with src as (

    select *
    from {{ source('airbyte_curso', 'rest_countries') }}

)

select
   
    _airbyte_raw_id,
    _airbyte_extracted_at,

    
    cca2 as country_code,

   
    cca3,
    region,
    subregion,
    population,
    area,
    name as country_name,
    capital

from src