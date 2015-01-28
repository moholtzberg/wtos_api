## WTOS API

### Customers
`GET "/customers/#{id}.json"` returns a customer object with the following fields
`{
	"dg_customer_id": INT,  
	"dg_customer_number":STR,  
	"dg_sales_rep_id": INT,  
	"customer_name": STR,  
	"customer_address": STR,  
	"customer_city": STR,  
	"customer_state": STR,  
	"customer_zip": STR,  
	"customer_phone": STR,  
	"customer_fax": STR,  
	"customer_active": BOOL,  
	"customer_prospect": BOOL,  
	"dg_last_update": TIME  
}`  
  
`GET "/customers.json?last_update=#{date}"`  
returns an array of `customer` objects  
  
### Leases  
`GET "/lease/#{id}.json"` returns a lease object with the following fields  
  
`{  
	"dg_lease_id": INT,  
	"lease_customer_id": INT (references a customer from the customers model),  
	"lease_number": STR,  
	"lease_term": INT,  
	"lease_start_date": TIME,  
	"lease_payment": FLOAT,  
	"dg_leasing_company_id": INT (references a customers from the customers model as a leasing company)  
}`  
  
`GET "/leases.json?last_update=#{date}"`  
returns an array of `lease` objects