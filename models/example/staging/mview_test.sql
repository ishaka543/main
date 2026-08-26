{{ config(
    materialized = 'materialized_view'
) }}

select * from emp
