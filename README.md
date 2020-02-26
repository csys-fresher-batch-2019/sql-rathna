```sql
drop table user_info;
drop table instructor_info;
drop table course_info;
drop table enrollment_info;
drop table content_info;
drop sequence user_id_Seq;
drop sequence course_id_Seq;
drop sequence enrollment_id_seq;
drop sequence instructor_id_seq;

#user information table
create table user_info(
user_id number,
username varchar2(100) not null,
email_id varchar2(100) not null,
user_password varchar2(80) not null,
no_of_courses_enrolled number default 0,
constraint user_id_pk primary key(user_id),
constraint email_uq unique(email_id),
constraint user_password_ck check((length(user_password) >= 8))
);

#instructor information table
create table instructor_info(
instructor_id number,
instructor_name varchar2(60) not null,
instructor_email varchar2(60) not null,
instructor_password varchar2(60) not null,
area_of_interest varchar2(60) not null,
recent_works varchar2(150),
constraint instructor_id_pk primary key(instructor_id),
constraint instructor_email_uq unique(instructor_email),
constraint instructor_password_ch check(length(instructor_password)>=8)
);

#course information table
create table course_info(
course_id number,
course_name varchar2(100) not null,
duration_of_course number not null,
instructor_name varchar2(100) not null,
instructor_id number not  null,
course_category char(25) not null,
price number not null,
rating float,
constraint course_id_pk primary key(course_id),
constraint courses_uq unique(course_name,instructor_name),
constraint duration_of_course_ck check(duration_of_course>=4),
constraint rating_ck check(0<=rating and rating<=5),
constraint course_category_ck check(course_Category in('Business','Arts','Science','Engineering','Maths','Personality Development','Finance')),
constraint instructor_id_fk foreign key(instructor_id) references instructor_info(instructor_id),
constraint price_ck check(price>=0)
);

#enrollment information table
create table enrollment_info(
enrollment_id number,
course_id number not null,
user_id number not null,
enrolled_date date not null,
ending_date date not null,
status varchar2(50) not null,
rating number,
constraint rating_cq check(rating>=0 and rating<=5),
constraint enrollment_id_pk primary key(enrollment_id),
constraint unique_con unique(user_id,course_id),
constraint course_id_fk foreign key(course_id) references course_info(course_id),
constraint user_id_fk foreign key(user_id) references user_info(user_id),
constraint status_ck check(status in('ONGOING','COMPLETED'))
);

#course content information table
create table content_info(
course_id number not null,
course_content varchar2(150) not null,
chapter_no number not null,
constraint course_id_fq foreign key(course_id) references course_info(course_id),
constraint uique_chapter_uq unique(course_id,chapter_no)
);


create sequence user_id_seq start with 1;
create sequence course_id_seq increment by 1 start with 20201;
create sequence enrollment_id_seq increment by 1 start with 220;
create sequence instructor_id_seq increment by 1 start with 1;

insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'Robert','robert@gmail.com','pass12345','Business Science');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'SalmanKhan','khan@gmail.com','khan12345','Mathematics');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'Vasudevan','vasu@gmail.com','vasu12345','Personality Development');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'J.B.Gupta','suptajb@gmail.com','jbgu12345','Power Systems');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'Hari','hari@gmail.com','hari12345','Quantum Physics');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'Robin','robin1@gmail.com','pass1234','Music');
insert into instructor_info(instructor_id,instructor_name,instructor_email,instructor_password,area_of_interest)
values(instructor_id_seq.nextval,'Manickam','manick@gmail.com','pass1234','Econmics');


insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Digital Marketing',8,'Robert','Business',1500,1);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Quantum Physics',6,'Hari','Science',3000,5);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Power Systems',8,'J.B.Gupta','Engineering',1000,4);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Vector Calculus',8,'Salmankhan','Maths',1500,2);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Effective Communication',4,'Vasudevan','Personality Development',1000,3);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Method of Financing',4,'Manickam','Finance',1500,2);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Integral Calculus',8,'Salmankhan','Maths',1500,2);
insert into course_info(course_id,course_name,duration_of_course,instructor_name,course_category,price,instructor_id)
values(course_id_seq.nextval,'Differential Calculus',8,'Salmankhan','Maths',1500,2);


insert into content_info(course_id,course_content,chapter_no)values(20201,'Market Research',1);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Make a Website',2);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Email Marketing',3);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Copy Writing',4);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Search Engine Optimization',5);
insert into content_info(course_id,course_content,chapter_no)values(20201,'YouTube Marketing',6);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Facebook Marketing',7);
insert into content_info(course_id,course_content,chapter_no)values(20201,'Quora Marketing',8);
insert into content_info(course_id,course_content,chapter_no)values(20202,'Introduction to Quantum Physics',1);
insert into content_info(course_id,course_content,chapter_no)values(20202,'Mathematical Foundation of Quantum Physics',2);
insert into content_info(course_id,course_content,chapter_no)values(20202,'Quantum Field Theory',3);
insert into content_info(course_id,course_content,chapter_no)values(20202,'Schrodinger Wave Equation',5);
insert into content_info(course_id,course_content,chapter_no)values(20202,'Astrophysics',6);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Introduction to Power System',1);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Basics of Protection Devices',2);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Line Parameter Calculation',3);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Load Flow Analysis',4);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Structure of Power System',5);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Fault Analysis',6);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Stability Analysis',7);
insert into content_info(course_id,course_content,chapter_no)values(20203,'Control System for Power System',8);
insert into content_info(course_id,course_content,chapter_no)values(20205,'Setting the Scene for Conversation',1);
insert into content_info(course_id,course_content,chapter_no)values(20205,'you are your Message',2);
insert into content_info(course_id,course_content,chapter_no)values(20205,'Telling people things they might not want to hear',3);
insert into content_info(course_id,course_content,chapter_no)values(20205,'Positive Communication',4);
insert into content_info(course_id,course_content,chapter_no)values(20206,'Income Statment Analysis',1);
insert into content_info(course_id,course_content,chapter_no)values(20206,'Balance Sheet Analysis',2);
insert into content_info(course_id,course_content,chapter_no)values(20206,'Cash Flow Statement Analysis',3);
insert into content_info(course_id,course_content,chapter_no)values(20206,'Discounted Cash Flow',4);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Basics of Calculus',1);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Limits',2);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Rate of Change',3);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Continuity',4);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Types of Discontinuities',5);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Approximation with Riemann Sums',6);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Defining integrals with Riemann Sums',7);
insert into content_info(course_id,course_content,chapter_no)values(20207,'Fundamental theoram of calculus and accumulation functions',8);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Introduction to Differential Calculus',1);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Slope of Curves',2);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Differentiating Polynomials',4);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Advanced Derivatives',5);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Differentiating Trignometric Functions',6);
insert into content_info(course_id,course_content,chapter_no)values(20208,'Power Rule',7);


#procedure for enrolling a course
create or replace PROCEDURE PR_INSERT_ENROLLMENT(
I_user_id in number,
I_course_id in number,
I_error_message out varchar)
AS 
v_temp number; 
BEGIN
v_temp := FN_calculate_no_courses(I_user_id);
IF v_temp < 5 then
insert into enrollment_info(enrollment_id,course_id,user_id,enrolled_date,ending_date,status)
values(enrollment_id_seq.nextval,I_course_id,I_user_id,SYSDATE,(SYSDATE+((select duration_of_course from course_info where course_id=I_course_id)*7)),'ONGOING');
update user_info
set no_of_courses_enrolled=no_of_courses_enrolled+1
where user_id = I_user_id;
ELSE
I_error_message:='You_cannot_enroll_more_than_5_courses';
END IF;
COMMIT;
END PR_INSERT_ENROLLMENT;

#function to calculate no of courses enrolled by a user
create or replace FUNCTION FN_CALCULATE_NO_COURSES(
I_user_id in number)
RETURN NUMBER AS v_co_num number :=0;
BEGIN
select count(*) into v_co_num from enrollment_info where user_id=I_user_id;
  RETURN v_co_num;
END FN_CALCULATE_NO_COURSES;
```

