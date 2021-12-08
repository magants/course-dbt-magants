--ramnathv's macro from Week 3 lesson
{% macro sum_if(column, value_true=1, value_false=0) %}
  
  SUM(CASE WHEN {{ column }} THEN value_true }} ELSE { value_false }} END)
  
{% endmacro %}
