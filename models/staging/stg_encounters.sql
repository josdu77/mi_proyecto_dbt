with src as (
    select * from {{ source('raw', 'encounters') }}
)

select
    id as encounter_id,
    start::date as start_date,
    stop::date as stop_date,
    encounterclass as encounter_class,
    payer as payer_id
from src