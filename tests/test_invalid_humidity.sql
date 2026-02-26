select *
from {{ ref('mart_weather_obt') }}
where humidity < 0
   or humidity > 100