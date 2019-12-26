drop table todolist;
create table todolist(
task_number number not null,
task varchar2(50) not null,
task_by varchar2(30) not null,
dead_line date,
status char(1),
completed_on date,
constraint task_uq unique(task),
constraint task_number_pk primary key(task_number),
constraint task_number_uq unique(task_number),
constraint dead_line_ck check(dead_line > SYSDATE),
constraint status_ck check(status in ('Y','N,)),
);

