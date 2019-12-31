#web page for online certification course

##Features
course information,user information,enrollment information must be maintained

| user_id | user_name | email_id           | user_password |
|---------|-----------|--------------------|---------------|
| 201     | arjun     | arjunae@gmail.com  | Arjun@AE2     |
| 202     | karthik   | karthikp@gmail.com | Karthik@54    |
| 203     | anand     | anand001@gmail.com | Pass-123      |
| 204     | farooq    | farooq@gmail.com   | paSS-321      |
| 205     | siva      | siva@gmail.com     | SivaPass-123  |


|  course_id | course_category | course_name            | instructor_name | duration_of_course | price |
|------------|-----------------|------------------------|-----------------|--------------------|-------|
| 16140      | Business        | Methods of financing   | sai             | 6                  | 550   |
| 16141      | Science         | Quantum Physics        | krish           | 18                 | 2900  |
| 16142      | Engineering     | Signal Processing      | james           | 15                 | 1200  |
| 16143      | Arts            | Pencil Drawing         | Stephen         | 8                  | 390   |
| 16144      | Maths           | Multivariable Calculus | salman khan     | 18                 | 250   |


| course_id | user_id | enrolled_date | ending_date |
|-----------|---------|---------------|-------------|
| 16140     | 202     | 22-12-2019    | 02-02-2020  |
| 16140     | 203     | 08-12-2019    | 19-01-2020  |
| 16141     | 201     | 01-12-2019    | 05-04-2020  |

query:
```sql
#Feature1 to create user_information table
create table user_info(
user_id number,
username varchar2(100) not null,
email_id varchar2(100) not null,
user_password char(20) not null,
constraint user_id_pk primary key(user_id),
constraint email_uq unique(email_id),
constraint user_password_ck check(user_password like '%[!@#$%^&*():;][a-z][A-Z][0-9]%')
);

#Feature2 to create course_information table
create table course_info(
course_id number,
course_name varchar2(100) not null,
duration_of_course number not null,
instructor_name varchar2(100) not null,
course_category char(25) not null,
price number not null,
constraint course_id_pk primary key(course_id),
constraint duration_of_course_ck check(duration_of_course>=4),
constraint course_category_ck check(course_Category in('BUSINESS','ARTS','SCIENCE','ENGINEERING','MATHS')),
constraint price_ck check(price>=0)
);

#Feature3 to create enrollment_information table
create table enrollment_info(
course_id number not null,
user_id number not null,
enrolled_date date not null,
ending_date date not null,
constraint course_id_fk foreign key(course_id) references course_info(course_id),
constraint user_id_fk foreign key(user_id) references user_info(user_id)
);
```


