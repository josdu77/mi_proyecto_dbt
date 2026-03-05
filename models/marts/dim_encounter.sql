select distinct
    encounter_id,
    encounter_class,
    start_date,
    stop_date
from {{ ref('int_procedures_enriched') }}