create table FlightBookings(BookingID number,FlightDate date,PassengerID number,Destination varchar2(40));

insert into FlightBookings values (1,sysdate-365,6,'Varanasi');
insert into FlightBookings values (2,'01-JAN-2023',7,'Alahabad');
insert into FlightBookings values (3,'01-FEB-2023',8,'Mathura');
insert into FlightBookings values (4,'01-MAR-2023',9,'Kashmir');
insert into FlightBookings values (5,'01-APR-2023',10,'Delhi');
insert into FlightBookings values (6,'01-MAY-2023',11,'Alahabad');
insert into FlightBookings values (6,'01-JUN-2023',12,'Kashmir');
insert into FlightBookings values (7,'01-JULY-2023',13,'Varanasi');
insert into FlightBookings values (8,'01-JULY-2023',14,'Kashmir');
insert into FlightBookings values (9,'01-AUG-2023',15,'Delhi');
insert into FlightBookings values (10,'01-SEP-2023',12,'Varanasi');
insert into FlightBookings values (11,'01-SEP-2023',12,'Kashmir');
insert into FlightBookings values (12,'01-OCT-2023',16,'Mathura');
insert into FlightBookings values (13,'01-OCT-2023',17,'Alahabad');
insert into FlightBookings values (14,'01-NOV-2023',18,'Kashmir');
insert into FlightBookings values (15,'01-DEC-2023',19,'Varanasi');
insert into FlightBookings values (16,'01-DEC-2023',20,'Mathura');


insert into FlightBookings values (2,'01-JAN-2024',7,'Alahabad');
insert into FlightBookings values (3,'01-FEB-2024',8,'Mathura');
insert into FlightBookings values (4,'01-MAR-2024',9,'Kashmir');
insert into FlightBookings values (5,'01-APR-2024',10,'Delhi');
insert into FlightBookings values (6,'01-MAY-2024',11,'Alahabad');
insert into FlightBookings values (6,'01-JUN-2024',12,'Kashmir');
insert into FlightBookings values (7,'01-JULY-2024',13,'Varanasi');
insert into FlightBookings values (8,'01-JULY-2024',14,'Kashmir');
insert into FlightBookings values (9,'01-AUG-2024',15,'Delhi');
insert into FlightBookings values (10,'01-SEP-2024',12,'Varanasi');
insert into FlightBookings values (11,'01-SEP-2024',12,'Kashmir');
insert into FlightBookings values (12,'01-OCT-2024',16,'Mathura');
insert into FlightBookings values (13,'01-OCT-2024',17,'Alahabad');
insert into FlightBookings values (14,'01-NOV-2024',18,'Kashmir');
insert into FlightBookings values (15,'01-DEC-2024',19,'Varanasi');
insert into FlightBookings values (16,'01-DEC-2024',20,'Mathura');


SELECT
    to_char(
        flightdate, 'MON'
    )                  flightdate_month,
    to_char(
        flightdate, 'yyyy'
    )                  flightdate_year,
    COUNT(destination) booking_count
FROM
    flightbookings
WHERE
    to_char(
        flightdate, 'yyyy'
    ) = &Year
GROUP BY
    to_char(
        flightdate, 'MON'
    ),
    to_char(
        flightdate, 'yyyy'
    );

drop table employees;
CREATE table department(department_id number primary KEY,departmentname varchar2(30));
create table employees(employeeid number primary key , employeename varchar2(40), department_id REFERENCES department(department_id));
create table salaries(employeeid number REFERENCES employees(employeeid),salary NUMBER,effective_date date);
insert into department values(1,'OPERATION');
insert into department values(2,'RESEARCH');
insert into department values(3,'SALES');
insert into department values(4,'MARKETING');
select * from department;
select * from employees;
select * from salaries;
INSERT INTO employees values(10,'Aakash Singh',1);
INSERT INTO employees values(30,' Singh',1);
INSERT INTO employees values(20,'Gaurav Singh',2);
INSERT INTO employees values(30,'Mahip Raghuvansi',3);

INSERT INTO salaries values(10,2000,'01-JAN-2023');
INSERT INTO salaries values(20,1500,'10-FEB-2024');
INSERT INTO salaries values(10,5000,'01-MAR-2023');
INSERT INTO salaries values(20,2000,'10-APR-2023');
INSERT INTO salaries values(30,2000,'10-APR-2023');
INSERT INTO salaries values(30,4000,'10-APR-2024');
INSERT INTO salaries values(30,4000,'10-APR-2024');
INSERT INTO salaries values(10,2000,'01-JAN-2023');
INSERT INTO salaries values(10,5000,'01-JAN-2024');
INSERT INTO salaries values(20,2000,'01-JAN-2023');
INSERT INTO salaries values(20,8000,'01-JAN-2024');

COMMIT;
SELECT
    d.departmentname,
    e.employeename,
    MAX(s.salary),
    s.effective_date
FROM
    department d,
    employees  e,
    salaries   s
WHERE
    e.department_id = d.department_id
    AND s.employeeid = e.employeeid
    and to_char(s.effective_date,'yyyy')=2024
GROUP BY
    d.departmentname,
    e.employeename,
    s.effective_date;
    
    
SELECT
    t1.employeeid,
    t1.salary,
    t2.salary,
    t1.salary - t2.salary AS difference,
    round((t1.salary - t2.salary) * 100 / t2.salary)
    || '%'                AS percentge
FROM
    (
        SELECT
            *
        FROM
            salaries
        WHERE
            to_char(
                effective_date, 'yyyy'
            ) = '2024'
    ) t1
    JOIN (
        SELECT
            *
        FROM
            salaries
        WHERE
            to_char(
                effective_date, 'yyyy'
            ) = '2024'
    ) t2 ON t1.employeeid = t2.employeeid;
  
  