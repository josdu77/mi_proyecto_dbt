with src as (
    select *
    from {{ source('airbyte_curso', 'openweather') }}
)

select
    _airbyte_raw_id,
    _airbyte_extracted_at,

    dt,
    id,
    name,
    timezone,

    coord,
    sys,
    main,
    wind,
    clouds,
    weather

from src