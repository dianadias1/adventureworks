with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primary Key */
	          "SALESREASONID"
               
	          ,"NAME"
          from {{ source('sap_adw','salesreason') }}
     )

select * from source