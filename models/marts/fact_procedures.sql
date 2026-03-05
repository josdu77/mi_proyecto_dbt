select
    patient_id,
    encounter_id,
    procedure_start_date as date_id,
    base_cost
from {{ ref('int_procedures_enriched') }}