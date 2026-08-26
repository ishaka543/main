{{ config(
    materialized = 'table',
    transient = false
) }}

select * from {{ source('practice_source', 'emp') }}