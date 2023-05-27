use sakila;


-- 1. Drop column picture from staff.
alter table staff
drop column picture;
select * from staff;


-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer
where first_name = 'TAMMY';

select * from staff;

insert into staff
values (3, 'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy',' ',now());

select * from staff;





-- 3. 

select * from rental
where return_date is null;

select * from inventory
where film_id = 1;

select * from staff;

select * from film
where title LIKE 'Academy Dinosaur';


select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

insert into rental
values(16050, now(), 1, 130, NULL, 1, now());

select * from rental
where rental_id = 16050;


-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

create table backup_table as
select customer_id, email, create_date, last_update from customer
where active = 0;



create temporary table if not exists temp_table as 
(select customer_id from customer where active = 0);

delete rental from rental
inner join temp_table on rental.customer_id = temp_table.customer_id;

delete payment from payment
inner join temp_table on payment.customer_id = temp_table.customer_id;

delete customer from customer
inner join temp_table on customer.customer_id = temp_table.customer_id;

drop temporary table if exists temp_table;

select * from customer
where active = 0;


        

