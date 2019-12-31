#web page for online certification course

##Feature1
*course information,user information,enrollment information must be maintained

*user information
| user_id | user_name | email_id           | user_password |
|---------|-----------|--------------------|---------------|
| 201     | arjun     | arjunae@gmail.com  | Arjun@AE2     |
| 202     | karthik   | karthikp@gmail.com | Karthik@54    |
| 203     | anand     | anand001@gmail.com | Pass-123      |
| 204     | farooq    | farooq@gmail.com   | paSS-321      |
| 205     | siva      | siva@gmail.com     | SivaPass-123  |

*course information
|  course_id | course_category | course_name            | instructor_name | duration_of_course | price |
|------------|-----------------|------------------------|-----------------|--------------------|-------|
| 16140      | Business        | Methods of financing   | sai             | 6                  | 550   |
| 16141      | Science         | Quantum Physics        | krish           | 18                 | 2900  |
| 16142      | Engineering     | Signal Processing      | james           | 15                 | 1200  |
| 16143      | Arts            | Pencil Drawing         | Stephen         | 8                  | 390   |
| 16144      | Maths           | Multivariable Calculus | salman khan     | 18                 | 250   |

*enrollment information
| course_id | user_id | enrolled_date | ending_date |
|-----------|---------|---------------|-------------|
| 16140     | 202     | 22-12-2019    | 02-02-2020  |
| 16140     | 203     | 08-12-2019    | 19-01-2020  |
| 16141     | 201     | 01-12-2019    | 05-04-2020  |

query:
```sql

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
```


