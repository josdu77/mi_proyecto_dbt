with weather as (

    select *
    from {{ ref('stg_openweather') }}

),

countries as (

    select *
    from {{ ref('stg_rest_countries') }}

)

select
    ow.dt as weather_unix_dt,
    ow.city_name,
    ow.country_code,
    ow.lat,
    ow.lon,
    ow.temp,
    ow.humidity,
    ow.pressure,
    ow.wind_speed,
    ow.cloud_pct,
    ow.timezone,

    c.country_name,
    c.region,
    c.subregion,
    c.population

from weather ow
left join countries c
    on upper(c.country_code) = upper(ow.country_code)