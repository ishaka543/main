
{% macro create_tables(role_name='PRACTICE_ROLE') %}

  {# 1. Switch to the specified role #}
  {% set set_role %}
    USE ROLE {{ role_name }}
  {% endset %}

  {% set create_dept %}
    CREATE OR REPLACE TABLE DEPT (
        DEPTNO INT NOT NULL,
        DNAME VARCHAR(50),
        LOC VARCHAR(50),
        CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO)
    )
  {% endset %}

  {% set create_emp %}
    CREATE OR REPLACE TABLE EMP (
        EMPNO INT NOT NULL,
        ENAME VARCHAR(50),
        JOB VARCHAR(50),
        MGR INT,
        HIREDATE DATE,
        SAL NUMBER(10, 2),
        COMM NUMBER(10, 2),
        DEPTNO INT,
        CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
        CONSTRAINT FK_EMP_DEPT FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
    )
  {% endset %}

  {# 2. Execute in sequence #}
  {% do run_query(set_role) %}
  {{ log("Switched to role: " ~ role_name, info=True) }}

  {% do run_query(create_dept) %}
  {{ log("DEPT table created", info=True) }}

  {% do run_query(create_emp) %}
  {{ log("EMP table created", info=True) }}

{% endmacro %}