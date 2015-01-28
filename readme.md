## WTOS API

### Customers
`GET "/customers/#{id}.json"` returns a `customer` object with the following fields  
`{  
	"dg_customer_id": INT,  
	"dg_customer_number": STR,  
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
`GET "/leases/#{id}.json"` returns a `lease` object with the following fields  
`{  
	"dg_lease_id": INT,  
	"lease_customer_id": INT (references a customer from the customers data model),  
	"lease_number": STR,  
	"lease_term": INT,  
	"lease_start_date": TIME,  
	"lease_payment": FLOAT,  
	"dg_leasing_company_id": INT (references a customers from the customers data model as a leasing company)  
}`  
  
`GET "/leases.json?last_update=#{date}"`  
returns an array of `lease` objects
  
### Eequipments  
`GET "/equipments/#{id}.json"` returns a `equipment` object with the following fields  
`{
	"dg_equipment_id": INT,
	"dg_customer_id": INT (references a customer from the customers data model),
	"equipment_number": STR,
	"equipment_serial": STR,
	"equipment_model_id": INT (references a model from the customers data model),
	"equipment_lease_id": INT (references a lease from the leases data model),
	"equipment_install_date": TIME,
	"dg_last_update": TIME
}`  
  
`GET "/equipments.json?last_update=#{date}"`  
returns an array of `equipment` objects
  
### Makes  
`GET "/makes/#{id}.json"` returns a `make` object with the following fields  
`{
	"dg_make_id": INT,
	"make_name": STR,
	"make_active": BOOL,
	"dg_last_update": TIME
}`  
  
`GET "/makes.json?last_update=#{date}"`  
returns an array of `make` objects
