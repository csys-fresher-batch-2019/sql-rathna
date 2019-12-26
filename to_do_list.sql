drop table todolist;
create table todolist(
task_number number not null,
task_name varchar2(50) not null,
task_by varchar2(30) not null,
dead_line date,
status char(1) default 'N',
completed_on date,
priority_number number not null,
created_date date default SYSDATE,
modified_date date not null,
constraint task_uq unique(task_name),
constraint task_number_pk primary key(task_number),
constraint task_number_uq unique(task_number),
constraint dead_line_ck check(dead_line > SYSDATE),
constraint status_ck check(status in ('Y','N,)),
constraint modified_date_ck check(modified_date > created_date),
);
insert into todolist(task_number,task_name,task_by,dead_line,priority_number)
value(1,'download redbus','sivanadhan',to date('28.12.2019','DD.MM.YYYY'),1);
selecr *from todolist;

