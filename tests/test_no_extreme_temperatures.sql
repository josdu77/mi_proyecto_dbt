select *
from {{ ref('mart_weather_obt') }}
where temp < -100
   or temp > 60