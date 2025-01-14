with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "EMAILADDRESSID"
               /* Foreign Key */
	          ,"BUSINESSENTITYID"
               
	          ,"EMAILADDRESS"
          from {{ source('sap_adw','emailaddress') }}
     )

select * from source