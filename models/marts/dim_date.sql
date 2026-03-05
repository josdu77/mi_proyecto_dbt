select distinct
    procedure_start_date as date_id,
    extract(year from procedure_start_date) as year,
    extract(month from procedure_start_date) as month,
    extract(quarter from procedure_start_date) as quarter,
    extract(dow from procedure_start_date) as day_of_week
from {{ ref('int_procedures_enriched') }}