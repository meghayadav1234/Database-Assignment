-- 1.List the departments which does not have employee at all.
SELECT 
    *
FROM
    department d
WHERE
    NOT EXISTS( SELECT 
            e.emp_dept_no
        FROM
            Employee e
        WHERE
            e.emp_dept_no = d.emp_dept_no);

-- 2.Display all the employees whose job is same as scott.

SELECT 
    *
FROM
    employee e
WHERE
    e.job_desc = (SELECT 
            job_desc
        FROM
            employee
        WHERE
            emp_name = 'scott');

-- 3.Display scott's manager's manager'S department name.

SELECT 
    *
FROM
    department d
WHERE
    d.emp_dept_no = (SELECT 
            e.emp_dept_no
        FROM
            employee e
        WHERE
            e.emp_no = (SELECT 
                    manger_id
                FROM
                    employee
                WHERE
                    emp_no = (SELECT 
                            manger_id
                        FROM
                            employee emp
                        WHERE
                            emp.emp_name = 'scott')));

-- 4.List employess whose job is same as scott and their salary greater than smith's salary.

SELECT 
    *
FROM
    employee emp
WHERE
    emp.job_desc = (SELECT 
            job_desc
        FROM
            employee
        WHERE
            emp_name = 'scott')
        AND emp.emp_sal > (SELECT 
            emp_sal
        FROM
            employee
        WHERE
            emp_name = 'Smith');

-- 5.Display all the employees whose job is same as scott and allen.

SELECT 
    *
FROM
    Employee emp
WHERE
    emp.job_desc = (SELECT 
            job_desc
        FROM
            employee
        WHERE
            emp_name = 'scott')
        OR emp.job_desc = (SELECT 
            job_desc
        FROM
            employee
        WHERE
            emp_name = 'Allen');

-- 6.Display all employees who are actual managers.

SELECT 
    *
FROM
    Employee e
WHERE
    e.emp_no IN (SELECT DISTINCT
            manger_id
        FROM
            Employee);

-- 7.Display who are all employees reporting to scott.

SELECT 
    *
FROM
    Employee
WHERE
    manger_id IN (SELECT 
            emp_no
        FROM
            employee
        WHERE
            emp_name = 'scott');

-- 8.Select 2nd maximum salary.
SELECT 
    MAX(emp_sal)
FROM
    employee
WHERE
    emp_sal < (SELECT 
            MAX(emp.emp_sal)
        FROM
            Employee emp);

-- 9. select 3rd maximum salary.
SELECT 
    MAX(emp_sal)
FROM
    employee
WHERE
    emp_sal < (SELECT 
            MAX(emp_sal)
        FROM
            employee
        WHERE
            emp_sal < (SELECT 
                    MAX(emp.emp_sal)
                FROM
                    Employee emp));

-- 10.Display all the employees who earn more than all the managers(job).

SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > (SELECT 
            MAX(emp.emp_sal)
        FROM
            Employee emp
        WHERE
            emp.job_desc = 'Manager');

-- 11.Display all the employees who earn more than any the managers(job).
SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            job_desc = 'MANAGER');

-- 12.Display empno,job and salary of all the analyst who are earning more than any of the manager

SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            job_desc = 'MANAGER')
        AND job_desc = 'Software Engineer';

-- 13.select the department name and location of all employees working for clark

SELECT 
    *
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee e
        WHERE
            manger_id IN (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_name = 'clark'));

-- 14. select all the employees working in Pune.

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            department
        WHERE
            location = 'Pune');

-- 15.Display all the employees whose salary is greater than average salary of deartment 20.
SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > (SELECT 
            AVG(emp_sal)
        FROM
            Employee
        WHERE
            emp_dept_no = 20);

-- 16.select all the employees who gets maximum salary.

SELECT 
    *
FROM
    employee
WHERE
    emp_sal = (SELECT 
            MAX(emp_sal)
        FROM
            Employee);

-- 17.Display first employee record based on hiredate.

SELECT 
    *
FROM
    Employee
WHERE
    hire_date = (SELECT 
            MIN(hire_date)
        FROM
            Employee);

-- 18.list the employees who have salary greater than Allen.

SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_name = 'Allen');

-- 19.list the daprtment names which are having analysts.

SELECT 
    *
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'Software Engineer');

-- 20.List the department names which have salesman in it.

SELECT 
    *
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'Salesman');

-- 21.Display the employees whose location which has atleast one o in it.

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            location LIKE '%o%');

-- 22.List the department names that are having at least one employee in it.

SELECT 
    dept_name
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) >= 1);

-- 23.list the department names having atleast 4 employees in it.

SELECT 
    dept_name
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) >= 4);

-- 24.Display the department names which are having at least 2 Clerks in it.

SELECT 
    *
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'Clerk'
        HAVING COUNT(*) >= 2);

-- 25.Query to display the employee names who is having maximum salary in Dept Name "Testing"

SELECT 
    MAX(emp_sal), emp_no, emp_name
FROM
    Employee
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name = 'Testing');

-- 26. Query to display the Dept Name who is having Highest Commission

SELECT 
    *
FROM
    Department
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_commission = (SELECT 
                    MAX(emp_commission)
                FROM
                    Employee));

-- 27. Query to display all the employees whose Dept Number is same as Scott.

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            employee
        WHERE
            emp_name = 'scott');

-- 28.Display all the employees in 'Operations and Accounting' Dept. and list the employees who has salary greater than miller

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name IN ('Development' , 'Testing'))
        AND emp_sal > (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_name = 'Miller');

--  29. List department name having atleast 3 salesman

SELECT 
    *
FROM
    Department
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'Salesman'
        GROUP BY emp_dept_no
        HAVING COUNT(*) >= 3);

-- 30.Display all employess who do not have any reporter.

SELECT 
    *
FROM
    Employee
WHERE
    manger_id IS NULL;

-- 31. display all the employees who are not managers.

SELECT 
    *
FROM
    Employee
WHERE
    emp_no NOT IN (SELECT DISTINCT
            manger_id
        FROM
            Employee
        WHERE
            manger_id IS NOT NULL);

-- 32.List all the employees who are reporting to jones manager

SELECT 
    *
FROM
    employee
WHERE
    manger_id = (SELECT 
            manger_id
        FROM
            Employee
        WHERE
            emp_name = 'Jones');

-- 33.list employees from research&accounting having atleast 2 reporting.

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name IN ('Research' , 'Development'))
        AND emp_no IN (SELECT 
            manger_id
        FROM
            Employee
        GROUP BY manger_id
        HAVING COUNT(*) >= 2);

-- 34. Display the departname of the employee whose name  starts with S and salary between 1500 to 3000.

SELECT 
    *
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_name LIKE '%S'
                AND emp_sal BETWEEN 15000 AND 30000);

-- 35.Display location of employee whose salary is minimum salary but salary is greater than 2000

SELECT 
    *
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_sal IN (SELECT 
                    MIN(emp_sal)
                FROM
                    Employee
                WHERE
                    emp_sal > 2000));

-- 36.Display the location of an employee in accounting department.

SELECT 
    location
FROM
    Department
WHERE
    dept_name = 'Development';

-- 37.Display the department location that are having greater than four employees in it.

SELECT 
    location
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) > 4);

-- 38.Write a query to display all the employee whose job not same as Allen and salary is greater than Martin.

SELECT 
    *
FROM
    Employee
WHERE
    job_desc NOT IN (SELECT 
            job_desc
        FROM
            Employee
        WHERE
            emp_name = 'Allen')
        AND emp_sal > (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_name = 'Martin');

-- 39.Display all the employees who is having location same as Adam's manager.

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_no = (SELECT 
                    manger_id
                FROM
                    Employee
                WHERE
                    emp_name = 'Adams'));

-- 40. Display the job, manager of employees who is working for Jones

SELECT 
    *
FROM
    Employee
WHERE
    manger_id = (SELECT 
            emp_no
        FROM
            Employee
        WHERE
            emp_name = 'Jones');

-- 41. Display the employee names, higher date, commission of Ford's manager

SELECT 
    *
FROM
    Employee
WHERE
    emp_no = (SELECT 
            manger_id
        FROM
            Employee
        WHERE
            emp_name = 'ford');

-- 42.List the Employeeloyess who are located in chicago and their commission is zero.
  
SELECT 
    COUNT(*)
FROM
    Employee
WHERE
    emp_commission = 0
        AND emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            location = 'CHICAGO');

-- 43.List Employees who work for emp_sales department and their emp_salary greater than average emp_salary of their department.
  
SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            department
        WHERE
            dept_name = 'emp_sales')
        AND emp_sal > ANY (SELECT 
            AVG(emp_sal)
        FROM
            Employee
        GROUP BY emp_dept_no);

 -- 44.List Employees who are working in research department and they are manager.
  
SELECT 
    emp_Name
FROM
    Employee
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            department
        WHERE
            dept_name = 'RESEARCH')
        AND emp_no IN (SELECT 
            manger_id
        FROM
            Employee);

-- 45. Display department name of the Employees who earn commission.
 
SELECT 
    dept_name
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_commission IS NOT NULL);

-- 46.Display department name of the Employeeloyee who earn maximum emp_salary and have no reporting manager.
 
SELECT 
    dept_name
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            manger_id IS NULL
                AND emp_sal = (SELECT 
                    MAX(emp_sal)
                FROM
                    Employee));

-- 47.Display Employeeloyee details who are reporting to blake and have commission without using null or not null.
 
SELECT 
    *
FROM
    Employee
WHERE
    manger_id IN (SELECT 
            emp_no
        FROM
            Employee
        WHERE
            emp_Name = 'BLAKE')
        AND emp_commission IS NOT NULL;

-- 48.List all the deprtnaments and loc of all the emp_salesman's manager's manager.
   
SELECT 
    dept_name, location
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_no IN (SELECT 
                    manger_id
                FROM
                    Employee
                WHERE
                    emp_no IN (SELECT 
                            manger_id
                        FROM
                            Employee
                        WHERE
                            job_desc = 'emp_salesman')));

-- 49.List the Employeeloyee deptname and loc of all the Employees who are clerk ,reporting to blake and emp_salary is lesser than martin emp_salary
  
SELECT 
    dept_name, location
FROM
    department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'CLERK'
                AND manger_id IN (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_Name = 'BLAKE')
                AND emp_sal < (SELECT 
                    emp_sal
                FROM
                    Employee
                WHERE
                    emp_Name = 'MARTIN'));
   
-- 50.List the Employees who does not directly report to president,have commission and emp_salary more than max emp_salary of all the clerk without
-- using null or not null.
  
SELECT 
    emp_Name
FROM
    Employee
WHERE
    manger_id != (SELECT 
            emp_no
        FROM
            Employee
        WHERE
            job_desc = 'PRESIDENT')
        AND emp_commission IS NOT NULL
        AND emp_sal > ALL (SELECT 
            MAX(emp_sal)
        FROM
            Employee
        WHERE
            job_desc = 'CLERK');
  
-- 51. List the Employees who joined after 2 years of first Employeeloyee of the company and more than blake emp_salary.
 
SELECT 
    *
FROM
    Employee
WHERE
    hire_date > ALL (SELECT 
            MIN(hire_date) + (365 * 2)
        FROM
            Employee)
        AND emp_sal > (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_Name = 'BLAKE');
 
-- 52. Display location of all the Employees who are reporting to Blake.
  
SELECT 
    location
FROM
	Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            manger_id = (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_Name = 'BLAKE'));

-- 53. List all the Employees whose job_desc is same as jones and their emp_salary lesser than scott.

SELECT 
    *
FROM
    Employee
WHERE
    job_desc = (SELECT 
            job_desc
        FROM
            Employee
        WHERE
            emp_Name = 'JONES')
        AND emp_sal < (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_Name = 'SCOTT');

-- 54. Display the king's first year emp_salary and his location with department.

SELECT 
    emp_sal * 12, location, dept_name
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND e.emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            employee
        WHERE
            emp_Name = 'KING');

-- 55. Display all the Employees of department 30, 20 with their anual emp_salary and having atleast 3 Employees.
  
SELECT 
    emp_sal * 12, emp_Name
FROM
    Employee
WHERE
    emp_dept_no IN (20 , 30)
        AND emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) >= 3);

-- -- 57. Display all the Employees who are earning less than any of the emp_salesman.

SELECT 
    *
FROM
    Employee
WHERE
    emp_sal < ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            job_desc = 'salesman');

-- 56. Display department name which is having second highest average emp_salary and third highest induvidul emp_salary.

select 
    *
from
    Department
where
    emp_dept_no = (Select 
            emp_dept_no
        from
            Employee
        where
            emp_sal = (Select 
                    avg(emp_sal)
                from
                    Employee
                where
                    emp_sal < (select 
                            avg(emp_sal)
                        from
                            Employee))
                and emp_sal = (select 
                    max(emp_sal)
                from
                    Employee
                where
                    emp_sal < (select 
                            max(emp_sal)
                        from
                            Employee
                        where
                            emp_sal < (select 
                                    max(emp_sal)
                                from
                                    Employee))));


-- 58.Display all the Employees who are joined before the last person
  
SELECT 
    *
FROM
    Employee
WHERE
    hire_date < (SELECT 
            MAX(hire_date)
        FROM
            Employee);

-- 59.Display last but one Employeeloyee record

SELECT 
    *
FROM
    Employee
WHERE
    hire_date = (SELECT 
            MAX(hire_date)
        FROM
            Employee
        WHERE
            hire_date < (SELECT 
                    MAX(hire_date)
                FROM
                    Employee));
  
-- 60.Find third minimum emp_salary in the Employeeloyee table

SELECT 
    MIN(emp_sal)
FROM
    Employee
WHERE
    emp_sal > (SELECT 
            MIN(emp_sal)
        FROM
            Employee
        WHERE
            emp_sal > (SELECT 
                    MIN(emp_sal)
                FROM
                    Employee));
               
-- 61.Display all the Employees who are earning more than any of the manager.
 
SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            job_desc = 'MANAGER');

 -- 62. List Employees who joined after 4 years of 1st Employeeloyee of the company and less than blake emp_salary.
 
SELECT 
    emp_Name
FROM
    Employee
WHERE
    hire_date > (SELECT 
            MIN(hire_date) + (365 * 4)
        FROM
            Employee)
        AND emp_sal < (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_Name = 'BLAKE');

-- 63.Display the department information of Employee who is working for newyork location.
SELECT 
    dept_name, emp_dept_no
FROM
    Department
WHERE
    location = 'Pune';

-- 64. Display the emp_salary wise Employeeloyee information for emp_dept_no 20 in descending order

SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no = 20
ORDER BY emp_sal DESC;
                 
-- 65. Display second Employeeloyee record
SELECT 
    *
FROM
    Employee
WHERE
    hire_date IN (SELECT 
            MIN(hire_date)
        FROM
            Employee
        WHERE
            hire_date > (SELECT 
                    MIN(hire_date)
                FROM
                    Employee));

-- 66.Display location of Employees, whose name start with A and emp_salary between 1000 and 3000.
SELECT 
    location
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND emp_Name LIKE 'A%'
        AND emp_sal BETWEEN 1000 AND 3000;

-- 67.Display department name of all the Employees who are reporting to Blake.
SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            manger_id IN (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_Name = 'BLAKE'));

-- 68.Display Martin's Manager's Manager's department location
SELECT 
    dept_name, location
FROM
    Department
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_no IN (SELECT 
                    manger_id
                FROM
                    Employee
                WHERE
                    emp_no IN (SELECT 
                            manger_id
                        FROM
                            Employee
                        WHERE
                            emp_Name = 'MARTIN')));
 
-- 69. Display the Employeeloyee name and their emp_salary who joined 2 years before the last person hired.
SELECT 
    emp_Name, emp_sal
FROM
    Employee
WHERE
    hire_date IN (SELECT 
            MAX(hire_date) - (365 * 2)
        FROM
            Employee);

-- 70. Display the Employeeloyee name,job_desc and department for those who don't have commission

SELECT 
    emp_Name, job_desc, dept_name, e.emp_dept_no
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND e.emp_commission IS NULL;
  
-- 71. Display the Employeeloyee details with their location who earn maximum commission
SELECT 
    *
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND emp_commission IN (SELECT 
            MAX(emp_commission)
        FROM
            Employee);

 
-- 72. Display all the Employeeloyee whose department is emp_sales and who is earning some commission (i.e commission is not null or zero)and whose
-- hired before the last person hired.

SELECT 
    *
FROM
    Employee
WHERE
    emp_commission IS NOT NULL
        AND hire_date < (SELECT 
            MAX(hire_date)
        FROM
            Employee)
        AND emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name = 'salesman');

-- 73.Display all the department names and manager who is ward's manager's manager.
SELECT 
    dept_name, manger_id
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND emp_no IN (SELECT 
            manger_id
        FROM
            Employee
        WHERE
            emp_no IN (SELECT 
                    manger_id
                FROM
                    Employee
                WHERE
                    emp_Name = 'WARD'));

-- 74.Display department names and maximum commission of Employeeloyee's whose emp_salary is greater than average emp_salary of all the clerk's
SELECT 
    d.dept_name, MAX(e.emp_commission)
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND e.emp_sal > ALL (SELECT 
            AVG(emp_sal)
        FROM
            Employee
        WHERE
            job_desc = 'ClERK'
        GROUP BY job_desc);

-- 75. Display the last Employeeloyee record with location.
SELECT 
    emp_Name, location
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND hire_date = (SELECT 
            MAX(hire_date)
        FROM
            Employee);


-- 76. Display the department number who working in emp_sales department and they are manager.
SELECT 
    emp_dept_no
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name = 'emp_salES')
        AND emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'MANAGER');

-- 77. Display department name of the Employeeloyee who earn minmum emp_salary and have reporting manager.

SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_sal = (SELECT 
                    MIN(emp_sal)
                FROM
                    Employee
                WHERE
                    manger_id IS NOT NULL));

-- 78. Display hire_date and dept_name of all the Employees working for emp_sales
SELECT 
    d.dept_name, e.hire_date
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND e.emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name = 'salesman');

-- 79. Display Location and dept_name of Employeeloyee who is working as president.
SELECT 
    dept_name, location
FROM
    Department
WHERE
    emp_dept_no = (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'PRESIDENT');

-- 80.Display the dept_name of Employees whoes emp_salary is maximum emp_salary but lesser than 3000

SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            emp_sal IN (SELECT 
                    MAX(emp_sal)
                FROM
                    Employee
                WHERE
                    emp_sal IN (SELECT 
                            emp_sal
                        FROM
                            Employee
                        WHERE
                            emp_sal < 3000)));

-- 81.Display the department name who are reporting to ADAMS
SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            manger_id IN (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_Name = 'ADAMS'));

-- 82.Display last Employeeloyee record.

SELECT 
    *
FROM
    Employee
WHERE
    hire_date IN (SELECT 
            MAX(hire_date)
        FROM
            Employee);

-- 83.Display all the Employeeloyee whose emp_salary is greater than average emp_salary of department 30.
SELECT 
    *
FROM
    Employee
WHERE
    emp_sal > (SELECT 
            AVG(emp_sal)
        FROM
            Employee
        WHERE
            emp_dept_no = 30);

-- 84. Display the number of Employees who work for research dept and their emp_salary is lesser than one of the emp_salary in department in 10.
SELECT 
    COUNT(*)
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name = 'RESEARCH')
        AND emp_sal < ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_dept_no = 10);

-- 85.Display the dept_name that are having clerk in it.
SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'CLERK');

-- 86. Display the department names that are having atleast one L in it.
SELECT 
    dept_name
FROM
    Department
WHERE
    dept_name LIKE '%L%';

-- 87. Display all the Employees who are joined after BLAKE.
SELECT 
    *
FROM
    Employee
WHERE
    hire_date > (SELECT 
            hire_date
        FROM
            Employee
        WHERE
            emp_Name = 'BLAKE');
                 
-- 88. List the dept name that are having at least 3 Employees but not more than 5 Employees in it.
SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) BETWEEN 3 AND 5);

-- 89.Display the location of all Employees whose reporting manager emp_salary is greater than 2000.
SELECT 
    location
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            manger_id IN (SELECT 
                    emp_no
                FROM
                    Employee
                WHERE
                    emp_sal > 2000));

-- 90.Select the Employees whose dept_name is having at least two 'E' in it.
SELECT 
    emp_Name, dept_name
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND dept_name LIKE '%E%E%';

-- 91.Display emp_Name,emp_sal of Employees who are earning more than any of the analyst.
SELECT 
    emp_Name, emp_sal
FROM
    Employee
WHERE
    emp_sal > ANY (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            job_desc = 'Software Engineer');

-- 92.  Select all the Employees who are working for CHICAGO
SELECT 
    *
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            location = 'Pune');
              
-- 93. Query to display Employeeloyee names who is having minimum emp_salary in department research.

SELECT 
    *
FROM
    Employee
WHERE
    emp_sal = (SELECT 
            MIN(emp_sal)
        FROM
            Employee
        WHERE
            emp_dept_no = (SELECT 
                    emp_dept_no
                FROM
                    Department
                WHERE
                    dept_name = 'RESEARCH'));
              
-- 94.List the department names that are having emp_salesman.

SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        WHERE
            job_desc = 'salesman');

-- 95. List the department names that are having at least 3 Employeeloyes in it.
SELECT 
    dept_name
FROM
    Department
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Employee
        GROUP BY emp_dept_no
        HAVING COUNT(*) >= 3);

-- 96.List Employees from research and accounting department having atleast two reporting.

SELECT 
    emp_Name
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name IN ('ACCOUNTING' , 'RESEARCH'))
        AND emp_no IN (SELECT 
            manger_id
        FROM
            Employee
        GROUP BY manger_id
        HAVING COUNT(*) >= 2);

-- 97. Write a query to display Employeeloyee name, job_desc,dept_name,location of all Employees who are working as manager and works at Chicago.

SELECT 
    emp_Name, job_desc, location
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND job_desc = 'MANAGER'
        AND location = 'pune';

-- 98. Select emp_Name,dept_name of Employeeloyee who earns 2nd max emp_salary and works for location Dallas.
SELECT 
    emp_Name, dept_name
FROM
    Employee e,
    Department d
WHERE
    e.emp_dept_no = d.emp_dept_no
        AND e.emp_sal IN (SELECT 
            MAX(emp_sal)
        FROM
            Employee
        WHERE
            emp_sal < (SELECT 
                    MAX(emp_sal)
                FROM
                    Employee)
                AND location = 'DALLAS');

-- 99. Write a query to display the Employee information who is not taking commission and joined company after July 83

SELECT 
    *
FROM
    Employee
WHERE
    emp_commission IS NULL
        AND hire_date > '01/01/2019';
              
-- 100. List Employees from emp_sales and research department having atleast 2 reporting Employees

SELECT 
    emp_Name
FROM
    Employee
WHERE
    emp_dept_no IN (SELECT 
            emp_dept_no
        FROM
            Department
        WHERE
            dept_name IN ('salesman' , 'RESEARCH'))
        AND emp_no IN (SELECT 
            manger_id
        FROM
            Employee
        GROUP BY manger_id
        HAVING COUNT(*) >= 2);

-- 101.Display the number of Employees who are getting emp_salary less then Blake's MANAGER emp_salary.
  
SELECT 
    COUNT(emp_Name)
FROM
    Employee
WHERE
    emp_sal < (SELECT 
            emp_sal
        FROM
            Employee
        WHERE
            emp_no = (SELECT 
                    manger_id
                FROM
                    Employee
                WHERE
                    emp_Name = 'BLAKE'));
   









