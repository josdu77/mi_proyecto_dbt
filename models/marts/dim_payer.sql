select distinct
    payer_id,
    payer_name
from {{ ref('int_procedures_enriched') }}