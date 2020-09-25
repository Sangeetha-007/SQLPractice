drop database if exists CollegeManagement;
Create database CollegeManagement;

use CollegeManagement;

Create table department (
  id int not null,
  name varchar(30) not null,
  PRIMARY KEY(id)
);

Create table faculty(
  id int not null,
  firstname varchar(30) not null,
  lastname varchar(50) not null,
  deptId int not null,
  PRIMARY KEY (id),
  #foreign key(name_of_fk) references table_name(col_name)
  foreign key(deptid) references department(id)
);

create table student(
  id int not null,
  firstname varchar(30) not null,
  lastname varchar(50) not null,
  street varchar(50) not null,
  streetDetail varchar(30),
  city varchar(30) not null
);
