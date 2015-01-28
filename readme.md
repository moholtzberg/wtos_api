WTOS API
========
A wrapper for the dg
--------------------
`GET "/customers.json?last_update=#{date}"`
returns an array of `customer` objects
`[
	{"dg_customer_id":1,"dg_customer_number":"WT01","dg_sales_rep_id":2,"customer_name":"World Trade Office Solutions","customer_address":"138 Hope Street","customer_city":"Brooklyn","customer_state":"NY","customer_zip":"11211","customer_phone":"(212) 267-0500","customer_fax":"(212) 267-3376","customer_active":true,"customer_prospect":false,"dg_last_update":"2013-01-16T13:06:52Z"},
	{"dg_customer_id":3,"dg_customer_number":"DO00","dg_sales_rep_id":2,"customer_name":"Dicapo Opera Theatere","customer_address":"184 East 76th Street","customer_city":"New York","customer_state":"NY","customer_zip":"10021","customer_phone":"(212) 288-9438","customer_fax":"","customer_active":true,"customer_prospect":false,"dg_last_update":"2012-06-18T12:41:50Z"},
	{"dg_customer_id":5,"dg_customer_number":"TL00","dg_sales_rep_id":3,"customer_name":"Tower Lodge Care Center","customer_address":"1506 Gully road","customer_city":"Wall","customer_state":"NJ","customer_zip":"07719","customer_phone":"(732) 681-1400","customer_fax":"","customer_active":true,"customer_prospect":false,"dg_last_update":"2013-11-07T14:04:18Z"}
]`