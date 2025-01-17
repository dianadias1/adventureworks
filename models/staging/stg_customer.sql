with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "CUSTOMERID" as customer_id
               /* Foreign Key */
               , "PERSONID" as person_id
               , "STOREID" as store_id
               , "TERRITORYID" as territory_id
               , case
                    when person_id is not null then 'person'
                    when store_id is not null then 'store'
                    else 'other'
               end as customer_category
          from {{ source('sap_adw','customer') }}
     )

     select *
     from source