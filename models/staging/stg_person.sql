with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "BUSINESSENTITYID"
               
	          ,"FIRSTNAME"
               ,"LASTNAME"
          from {{ source('sap_adw','person') }}
     )

select * from source