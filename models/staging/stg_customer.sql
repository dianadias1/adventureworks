with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "CUSTOMERID"
               /* Foreign Key */
	          ,"PERSONID"
               , "STOREID"
               , "TERRITORYID"
               
          from {{ source('sap_adw','customer') }}
     )

     select * from source