with procedures as (
    select * from {{ ref('stg_procedures') }}
),

patients as (
    select * from {{ ref('stg_patients') }}
),

encounters as (
    select * from {{ ref('stg_encounters') }}
),

payers as (
    select * from {{ ref('stg_payers') }}
)

select
    pr.patient_id,
    pr.encounter_id,
    pr.procedure_start_date,
    pr.base_cost,

    pa.gender,
    pa.race,
    pa.ethnicity,
    pa.state as patient_state,

    e.encounter_class,
    e.start_date,
    e.stop_date,

    py.payer_id,
    py.payer_name

from procedures pr
left join patients pa
    on pr.patient_id = pa.patient_id

left join encounters e
    on pr.encounter_id = e.encounter_id

left join payers py
    on e.payer_id = py.payer_id