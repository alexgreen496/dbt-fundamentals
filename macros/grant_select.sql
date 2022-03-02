{% macro grant_select(schema=target.schema, user=target.user) %}

  {% set sql %}
    grant usage on schema {{ schema }} to user {{ user }};
    grant select on all tables in schema {{ schema }} to user {{ user }};
    grant select on all views in schema {{ schema }} to user {{ user }};
  {% endset %}

  {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to user ' ~ user, info=True) }}
  {% do run_query(sql) %}
  {{ log('Privileges granted', info=True) }}

{% endmacro %}