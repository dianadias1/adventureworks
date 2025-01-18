/* Generating dates using the macro from the dbt package */
with
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("1990-01-01", "2090-12-31") }}
    )
    
    , selecting as (
        select
            date_day
            , day_of_week
            , day_of_week_name
            , day_of_week_name_short
            , day_of_month
            , day_of_year
            , month_of_year
            , month_name
            , month_name_short 
            , quarter_of_year
            , quarter_start_date
            , quarter_end_date
            , year_number
            , year_start_date
            , year_end_date
        from raw_generated_data
    )
    
select *
from selecting