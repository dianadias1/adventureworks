with
     source as (
          select
               /* Selecting only the data we will use in the data products */
               /* Primery Key */
               "SALESORDERDETAILID" as salesorderdetail_id
               /* Foreign Key */
               , "SALESORDERID" as salesorder_id
               , "SPECIALOFFERID" as specialoffer_id
               , "PRODUCTID" as product_id
               
               , "ORDERQTY" as orderqty
               , "UNITPRICE" as unitprice
               , "UNITPRICEDISCOUNT" as unitprice_discount
          from {{ source('sap_adw','salesorderdetail') }}
     )

select *
from source