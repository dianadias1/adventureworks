with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
               "SALESORDERID"
               /* Foreign Key */
               , "CUSTOMERID"
               , "TERRITORYID"
               , "SHIPMETHODID"
               , "CREDITCARDID"
               
               , "ORDERDATE"
               , "SUBTOTAL"
               , "TOTALDUE"
          from {{ source('sap_adw','salesorderheader') }}
     )

select *
from source