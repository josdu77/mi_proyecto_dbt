with src as (
    select * from {{ source('raw', 'procedures') }}
)

select
    encounter as encounter_id,
    patient as patient_id,
    code,
    description,
    reasoncode,
    reasondescription,
    base_cost,
    start::date as procedure_start_date,
    stop::date as procedure_end_date
from src