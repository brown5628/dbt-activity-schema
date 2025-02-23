{% macro alias_appended_activity(activity, column_name) %}
	{{ return(adapter.dispatch("alias_appended_activity", "dbt_activity_schema")(activity, column_name))}}
{% endmacro %}


{% macro default__alias_appended_activity(activity, column_name) %}

{# Generate the name of appended columns in `dataset.sql`.

params:

    activity: activity (class)
        The appended activity object, containing the string attributes to be concatenated in the
        column alias prefix.

    column_name: str
        The name of the column that will be aliased.
#}

{% set concatenated_activity_alias %}
{{ activity.relationship.name -}}_{{- activity.name | replace(" ", "_") -}}_{{- column_name -}}
{% endset %}

{% do return(concatenated_activity_alias) %}

{% endmacro %}
