with src as (
    select *
    from {{ source('airbyte_curso', 'rest_countries') }}
)

select
    -- Airbyte metadata
    _airbyte_raw_id,
    _airbyte_extracted_at,

    -- campos principales (ajustá si tu tabla tiene nombres distintos)
    cca2,
    cca3,
    region,
    subregion,
    population,
    area,

    -- name suele venir como struct/json según tu pipeline
    name,
    capital

from src