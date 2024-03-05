drop table orders;
create table orders(order_no_pk integer  primary key , customer_name varchar2(25) , date_of_order date);
insert into orders(order_no_pk,customer_name,date_of_order) values(102,'Gaurav singh',sysdate);
COMMIT;
select * from orders;
drop table order_item;

create table order_item(item_no_pk integer  primary key , 
order_no_pk REFERENCES orders(order_no_pk) ,
item_name varchar2(30),                                   
item_quant integer, 
item_price integer 
);

insert into order_item (item_no_pk,order_no_pk,item_name,item_quant,item_price)  values (102,102,'MERC',8,999);
COMMIT;
drop table city cascade;
create table city(city_no_pk integer primary key, city_name varchar2(30));
drop table bank cascade;
create table bank(b_no integer primary key,
b_name varchar2(30),
b_city_pk  references city(city_no_pk));
drop table bank_acc cascade;
create table bank_acc( bank_no_pk references bank(b_no) ,
cust_name varchar2(30),
amount integer);
insert into bank values (101,'aakash bank','tatakpur');
insert into bank_acc values(101,'aakash',500);
insert into city values(101,'tatakpur');





