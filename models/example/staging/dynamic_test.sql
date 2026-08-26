 {{ config(
        materialized='dynamic_table',
        target_lag='1 hour',
        snowflake_warehouse='COMPUTE_WH'
    ) }}
    SELECT * from emp