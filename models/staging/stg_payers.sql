with src as (
    select * from {{ source('raw', 'payers') }}
)

select
    id as payer_id,
    name as payer_name,
    address,
    city,
    state_headquartered as state_headquarter,
    zip as payer_zip,
    phone
from src