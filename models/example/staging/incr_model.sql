{{
  config(
    materialized = 'incremental',
    unique_key = 'emp_id',
    on_schema_change = 'append_new_columns'
  )
}}

select
    emp_id,
    emp_name,
    salary,
    updated_at,
    commission
from raw_emp

{% if is_incremental() %}
    where updated_at > (select max(updated_at) from {{ this }})
{% endif %}