{% snapshot emp_hist_snapshot %}

{{
    config(
	  materialized = 'table',
	  transient = false,
      target_database='PRACTICE_DATABASE',
      target_schema='PRACTICE_SCHEMA',
      unique_key='empid',
      strategy='check',
      check_cols=['ename', 'sal', 'department'],
      invalidate_hard_deletes=True,
	  tags=['hourly_sync', 'hr_domain', 'scd2']
    )
}}

SELECT 
    empid,
    ename,
    sal,
    department
FROM {{ source('practice_source', 'EMP_SOURCE') }}

{% endsnapshot %}