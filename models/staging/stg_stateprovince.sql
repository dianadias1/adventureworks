with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "STATEPROVINCEID"
               /* Foreign Key */
	          ,"COUNTRYREGIONCODE"
               ,"TERRITORYID"
               
	          ,"NAME"
               , "ISONLYSTATEPROVINCEFLAG"
          from {{ source('sap_adw','stateprovince') }}
     )

select * from source