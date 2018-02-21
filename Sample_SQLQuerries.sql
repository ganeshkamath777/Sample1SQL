--Create Table Employee with empid as Primary Key 
create table employee (empid integer primary key, empname text, department text);
--Create Table Salary with empid as Foriegn Key referring Employee(empid)
create table salary (empid integer, salary integer, foreign key (empid) references employee(empid));
--Insert Values to Employee Table
insert into employee(empid,empname,department) values("1","ABC","cricket");
insert into employee(empid,empname,department) values("2","BCD","cricket");
insert into employee(empid,empname,department) values("3","CDE","football");
insert into employee(empid,empname,department) values("4","DEF","football");
insert into employee(empid,empname,department) values("5","EFG","hockey");
insert into employee(empid,empname,department) values("6","FGH","hockey");
--Insert Values to Salary Table
insert into salary(empid,salary) values("1",90000);
insert into salary(empid,salary) values("2",85000);
insert into salary(empid,salary) values("3",60000);
insert into salary(empid,salary) values("4",50000);
insert into salary(empid,salary) values("5",70000);
insert into salary(empid,salary) values("6",50000);

--Write Querries

--Query to display department and their total salary
select department,sum(salary) as Total_Salary_for_Each_department from employee join salary on employee.empid=salary.empid group by employee.department

--Query to display department with maximum of total salary
SELECT B.DEPARTMENT as Department_With_Maximum_Of_Total_Salary 
	FROM
		(select department,max(Total) as Dept_with_Max_Salary 
			from 
				(select department,sum(salary) as Total 
					from employee join salary on employee.empid=salary.empid group by employee.department
				)
		) A,
		(select department,sum(salary) as Total 
			from employee join salary on employee.empid=salary.empid group by employee.department
		) B
	WHERE B.TOTAL=A.Dept_with_Max_Salary;
