
-- 1. Browses a list of farmers markets
--------------------------------------------
select Markets.market_id,
	Markets.name,
    Market_Address.city,
    Market_address.state,
    Markets.market_date
from Markets
join Market_address
on Markets.zip_code = Market_address.zip_code
order by Markets.market_date;

-- 2. Viewing one market and its vendors
--------------------------------------------
select markets.name AS market_name,
	vendors.business_name AS vendor_name
from markets
join market_vendors
on markets.market_id = market_vendors.market_id
join vendors
on market_vendors.vendor_id = vendors.vendor_id
where markets.market_id = 1;

-- 3. Searching for products in all markets
--------------------------------------------
select products.name AS product_name,
	vendor.business_name AS vendor_name,
	markets.name AS market_name
from products
join vendors
on products.vendor_id = vendors.vendor_id
join market_vendors
on vendors.vendor_id = market_vendors.vendor_id
join markets
on market_vendors.market_id = markets.market_id
where products.name LIKE '%Peas%';

-- 4. Lists all vendors
--------------------------------------------
select vendor_id, business name, farm_name, email
from vendors;

-- 5. Lists all products
--------------------------------------------
select product_id, name, category, base_price
from products;

-- 6. Shows all seasonal products
--------------------------------------------
select product_id, name, category, availability_notes
from products
where is_seasonal = TRUE;