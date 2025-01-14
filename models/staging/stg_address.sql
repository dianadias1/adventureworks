with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "ADDRESSID"
               /* Foreign Key */
	          ,"STATEPROVINCEID"
               
	          ,"CITY"
          from {{ source('sap_adw','address') }}
     )

select * from source