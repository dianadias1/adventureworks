with
     source as (
          select
               /* Selecting only the data we will use in the data products */
	          "SALESORDERID"
               ,"SALESREASONID"
          from {{ source('sap_adw','salesorderheadersalesreason') }}
     )

select * from source