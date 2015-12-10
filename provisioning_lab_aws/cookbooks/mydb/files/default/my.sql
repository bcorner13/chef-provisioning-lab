create database mysite;
use mysite;
create table zipcodes (
    zip integer(5) primary key,
    city  varchar(30),
    State varchar(20));
insert into zipcodes values (98225, 'Bellingham', 'WA'); 
insert into zipcodes values (95388, 'Winton', 'CA'); 
insert into zipcodes values (44242, 'Stow', 'OH'); 
insert into zipcodes values (61536, 'Hanna city', 'IL'); 
insert into zipcodes values (01254, 'Richmond', 'MA'); 
insert into zipcodes values (95124, 'San Jose', 'CA'); 
insert into zipcodes values (95382, 'Turlock', 'MA'); 
insert into zipcodes values (95380, 'Turlock', 'CA');
