with src as (

    select *
    from {{ source('airbyte_curso', 'openweather') }}

)

select
    _airbyte_raw_id,
    _airbyte_extracted_at,

    dt,
    id,
    name as city_name,
    timezone,

    sys->>'country' as country_code,

    (coord->>'lat')::double as lat,
    (coord->>'lon')::double as lon,

    (main->>'temp')::double as temp,
    (main->>'humidity')::int as humidity,
    (main->>'pressure')::int as pressure,

    (wind->>'speed')::double as wind_speed,
    (clouds->>'all')::int as cloud_pct

from src