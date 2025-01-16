/*Date range from the OrderDate column in the SalesOrderHeader table*/
with
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2014-12-31") }}
    )

select *
from raw_generated_data