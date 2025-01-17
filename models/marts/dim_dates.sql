/* Generating dates using the macro from the dbt package */
with
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("1990-01-01", "2090-12-31") }}
    )

select *
from raw_generated_data