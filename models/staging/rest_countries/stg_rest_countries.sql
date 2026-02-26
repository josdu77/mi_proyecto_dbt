with src as (

    select *
    from {{ source('airbyte_curso', 'rest_countries') }}

)

select
    -- Airbyte metadata
    _airbyte_raw_id,
    _airbyte_extracted_at,

    -- Primary key estandarizada
    cca2 as country_code,

    -- Otros campos
    cca3,
    region,
    subregion,
    population,
    area,
    name,
    capital

from src