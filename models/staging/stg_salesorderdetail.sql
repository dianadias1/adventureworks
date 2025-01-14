with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Foreign Key */
	          "SALESORDERID"
               ,"SPECIALOFFERID"
               ,"PRODUCTID"
               
               ,"ORDERQTY"
               ,"UNITPRICE"
               ,"UNITPRICEDISCOUNT"
          from {{ source('sap_adw','salesorderdetail') }}
     )

select * from source