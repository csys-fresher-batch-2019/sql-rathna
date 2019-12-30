#power grid management software

##Features
*organisation should create database such as customers,energy consumption,energy generation

query:
'''sql

create table customers(
customer_id number,
customer_name char(40) not null,
adress varchar(60) not null,
network_id number not null,
constraint customer_id_pk primary key(customer_id)
);

create table energy_consumption(
customer_id number,
consumed_energy number not null,
periode timestamp,
constraint periode_uq unique(periode),
constraint customer_id_fk foreign key(customer_id) references customers(customer_id)
);

create table energy_generation(
powerplant_id number not null,
generated_energy number not null,
periode timestamp,
constraint powerplant_id_uq unique(powerplant_id),
constraint periode_uk unique(periode)
);


