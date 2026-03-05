select distinct
    patient_id,
    gender,
    race,
    ethnicity,
    patient_state
from {{ ref('int_procedures_enriched') }}