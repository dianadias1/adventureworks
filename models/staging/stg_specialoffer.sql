with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "SPECIALOFFERID"
               
	          ,"TYPE"
               ,"CATEGORY"
          from {{ source('sap_adw','specialoffer') }}
     )

select * from source