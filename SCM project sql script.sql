create database supply_chain_project_da;
use supply_chain_project_da;
show tables;
select count(*) from 4_5_4_calendar;
select count(*) from d_customer;
select count(*) from d_geojson_us_counties;
select count(*) from d_product;
select count(*) from d_store;
select count(*) from f_inventory_adjusted;
select count(*) from f_point_of_sale;
select count(*) from f_sales;
select count(*) from plugs_electronics_hands_on_lab_data;

-- KPI 1 
select * from plugs_electronics_hands_on_lab_data;
Alter table plugs_electronics_hands_on_lab_data drop MyUnknownColumn;
alter table plugs_electronics_hands_on_lab_data add column sales int;

SET GLOBAL wait_timeout = 600;
SET GLOBAL net_read_timeout = 600;
SET SQL_SAFE_UPDATES =0 ;

update plugs_electronics_hands_on_lab_data set sales = Quantity * Price;
select sum(sales) as Total_sales from plugs_electronics_hands_on_lab_data;

-- KPI 2
select * from f_inventory_adjusted;
select sum(`Quantity on hand`) as Total_Inventory from f_inventory_adjusted;

-- KPI 3
select * from f_inventory_adjusted;
alter table f_inventory_adjusted add column Inven_value int;

SET GLOBAL wait_timeout = 600;
SET GLOBAL net_read_timeout = 600;
SET SQL_SAFE_UPDATES =0 ;

update f_inventory_adjusted set Inven_value = `Quantity on hand` * `Cost Amount`;
select sum(Inven_value) as Inventory_value from f_inventory_adjusted;

-- KPI 4
select `Product Family`, sum(`Quantity on Hand`) as `Quantity on Hand` from f_inventory_adjusted group by `Product Family`;

-- KPI 5 
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select `Product Group`, `Product Line`, `Product Name`, sum(`Quantity on Hand`) as `Quantity on hand` from f_inventory_adjusted group by `Product Group`,`Product Line`,`Product Name`;