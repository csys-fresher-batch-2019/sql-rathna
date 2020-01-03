#web page for online certification course

##Features
course information,user information,enrollment information must be maintained

query:
```sql
#Feature1 to create user_information table
create table user_info(
user_id number,
username varchar2(100) not null,
email_id varchar2(100) not null,
user_password varchar2(80) not null,
constraint user_id_pk primary key(user_id),
constraint email_uq unique(email_id),
constraint user_password_ck check((length(user_password) >= 8))
);
create sequence user_id_seq start with 1;

| user_id | user_name | email_id           | user_password |
|---------|-----------|--------------------|---------------|
| 201     | arjun     | arjunae@gmail.com  | Arjun@AE2     |
| 202     | karthik   | karthikp@gmail.com | Karthik@54    |
| 203     | anand     | anand001@gmail.com | Pass-123      |
| 204     | farooq    | farooq@gmail.com   | paSS-321      |
| 205     | siva      | siva@gmail.com     | SivaPass-123  |

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
constraint course_category_ck check(course_Category in('Business','Arts','Science','Engineering','Maths','Personality Development','Finance')),
constraint price_ck check(price>=0)
);
create sequence course_id_seq increment by 1 start with 20201;

|  course_id | course_category | course_name            | instructor_name | duration_of_course | price |
|------------|-----------------|------------------------|-----------------|--------------------|-------|
| 16140      | Business        | Methods of financing   | sai             | 6                  | 550   |
| 16141      | Science         | Quantum Physics        | krish           | 18                 | 2900  |
| 16142      | Engineering     | Signal Processing      | james           | 15                 | 1200  |
| 16143      | Arts            | Pencil Drawing         | Stephen         | 8                  | 390   |
| 16144      | Maths           | Multivariable Calculus | salman khan     | 18                 | 250   |


#Feature3 to create enrollment_information table
create table enrollment_info(
enrollment_id number,
course_id number not null,
user_id number not null,
enrolled_date date not null,
ending_date date not null,
status number not null,
constraint enrollment_id_pk primary key(enrollment_id),
constraint unique_con unique(user_id,course_id),
constraint course_id_fk foreign key(course_id) references course_info(course_id),
constraint user_id_fk foreign key(user_id) references user_info(user_id),
constraint status_ck check(status in(0,1))
);
create sequence enrollment_id_seq increment by 1 start with 201;

| course_id | user_id | enrolled_date | ending_date |
|-----------|---------|---------------|-------------|
| 16140     | 202     | 22-12-2019    | 02-02-2020  |
| 16140     | 203     | 08-12-2019    | 19-01-2020  |
| 16141     | 201     | 01-12-2019    | 05-04-2020  |

insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'karthikeyan','karthik1@gmail.com','password');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'arjun','arjun1@gmail.com','PASSWORD');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'siva','siva1@gmail.com','passsiva');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'anand','anand1@gmail.com','passanand');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'seenivasan','seeni1@gmail.com','passseeni');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'farooq','farooq1@gmail.com','passfarooq');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'hari','hari1@gmail.com','passhari');
insert into user_info(user_id,username,email_id,user_password)
values(user_id_seq.nextval,'gokul','gokul1@gmail.com','passgokul');

insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Digital Marketing',8,'Robert','Business',1500);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Music Theory',16,'Robin','Arts',2000);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Quantum Physics',24,'Hari','Science',3000);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Power Systems',12,'Mohamed Rashid','Engineering',1000);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Vector Calculus',8,'Khan','Maths',1500);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Effective Communication',8,'Vasudevan','Personality Development',1000);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price)
values(course_id_seq.nextval,'Method of Financing',14,'Manickam','Finance',1500);

insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20201,1,SYSDATE,((SYSDATE+((select duration_of_course from course_info where course_id=20201)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20202,6,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20202)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20204,2,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20204)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20206,7,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20206)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20207,4,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20207)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20202,5,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20202)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20203,2,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20203)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20206,6,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20206)*7)),1);
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,20206,6,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=20206)*7)),1);

---query to update status when course is completed
update enrollment_info
set status=0
where enrollment_id=208;
update enrollment_info
set status=0
where enrollment_id=203;

select *from user_info;
select *from course_info;
select *from enrollment_info;

---query to display courses enrolled by a particular user
select ci.course_name,ci.instructor_name,ci.course_category,ei.ending_date
from course_info ci,enrollment_info ei where ci.course_id=ei.course_id and ei.user_id=6 and status=1;

---query to display number of users enrolled in a particular course
select count(user_id) from enrollment_info where course_id=20202 and status=1;

---query to display completed courses by particular user
select ci.course_name,ei.enrolled_date,ei.ending_date
from course_info ci,enrollment_info ei
where ci.course_id=ei.course_id and ei.user_id=2 and status=0;

---query to display number of enrollments active now
select count(enrollment_id) from enrollment_info where status=1;

---to limit the no_of_courses enrolled by a user
alter table user_info
add no_of_courses_enrolled number default 0;
update user_info u
set no_of_courses_enrolled = (select count(*) FROM enrollment_info where user_id = u.user_id);

--- to enroll a course
declare
v_user_id number:= 3;
v_course_id number := 20206;
v_error_message varchar(100);
BEGIN 
PR_insert_enrollment(v_user_id,v_course_id,v_error_message);
IF v_error_message IS NOT NULL THEN
DBMS_OUTPUT.PUT_LINE('Error-' || v_error_message);
END IF;
END;


select *from user_info;
```


