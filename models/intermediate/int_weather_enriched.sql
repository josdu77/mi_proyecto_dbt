with ow as (
    select *
    from {{ ref('stg_openweather') }}
),
countries as (
    select *
    from {{ ref('stg_rest_countries') }}
)

select
    ow._airbyte_raw_id,
    ow._airbyte_extracted_at,

    ow.dt as weather_unix_dt,
    ow.name as city_name,
    ow.timezone,

    -- aplanado típico (ajustar si tu struct difiere)
    ow.coord['lat']::double as lat,
    ow.coord['lon']::double as lon,

    ow.sys['country']::varchar as country_code,

    ow.main['temp']::double as temp,
    ow.main['feels_like']::double as feels_like,
    ow.main['humidity']::int as humidity,
    ow.main['pressure']::int as pressure,

    ow.wind['speed']::double as wind_speed,
    ow.clouds['all']::int as cloud_pct,

    -- enriquecimiento con countries
    c.region,
    c.subregion,
    c.population,
    c.area

from {{ ref('stg_openweather') }} ow
inner join {{ ref('stg_rest_countries') }} c
    on upper(c.country_code) = upper(ow.sys['country']::varchar)