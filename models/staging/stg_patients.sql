with src as (
    select * from {{ source('raw', 'patients') }}
)

select
    id as patient_id,
    first,
    last,
    gender,
    race,
    ethnicity,
    birthdate::date as birthdate,
    city,
    state,
    county,
    zip as zipcode,       
    lat,
    lon
from src