--SET 2

SELECT * FROM EMP
SELECT * FROM DPT

--1. Retrieve a list of MANAGERS.
SELECT ENAME FROM EMP WHERE JOB='MANAGER'

--2. Find out the names and salaries of all employees earning more than 1000 per month.
SELECT ENAME,SAL FROM EMP WHERE SAL>1000

--3. Display the names and salaries of all employees except JAMES. 
SELECT ENAME,SAL FROM EMP WHERE ENAME NOT IN('JAMES')

--4. Find out the details of employees whose names begin with ‘S’. 
SELECT * FROM EMP WHERE ENAME LIKE'S%'

--5. Find out the names of all employees that have ‘A’ anywhere in their name.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%'

--6. Find out the names of all employees that have ‘L’ as their third character in their name. 
SELECT ENAME FROM EMP WHERE ENAME LIKE '__L%'

--7. Compute daily salary of JONES. 
SELECT ENAME,SAL/30 'DAILY_SALARY_OF_JONES' FROM EMP WHERE ENAME='JONES'

--8. Calculate the total monthly salary of all employees. 
SELECT SUM(SAL) 'TOTAL MONTHLY SALARY' FROM EMP

--9. Print the average annual salary . 
SELECT AVG(SAL*12) 'AVERAGE ANNUAL SALARY' FROM EMP

--10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
SELECT ENAME,JOB,SAL,DEPTNO FROM EMP WHERE DEPTNO!=30

--11. List unique departments of the EMP table.
SELECT DISTINCT DEPTNO FROM EMP

--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
SELECT ENAME,SAL FROM EMP WHERE SAL>1500 AND DEPTNO=10 OR DEPTNO=30

--13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
SELECT ENAME,JOB,SAL FROM EMP WHERE JOB IN('MANAGER','ANALYST') AND SAL NOT IN(1000,3000,5000)

--14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%.
SELECT ENAME,SAL,COMM FROM EMP WHERE COMM>(SAL+SAL*0.1)

--15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
SELECT ENAME FROM EMP WHERE ENAME LIKE '%L%L%' AND DEPTNO=30 OR MGR_ID=7782

--16. Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees. 
SELECT ENAME FROM EMP WHERE DATEDIFF(YEAR, HIREDATE, GETDATE())  BETWEEN 10 AND 20;
SELECT COUNT(EMPNO) FROM EMP WHERE DATEDIFF(YEAR, HIREDATE, GETDATE()) BETWEEN 10 AND 20;

--17. Retrieve the names of departments in ascending order and their employees in descending order.
SELECT ENAME,DNAME FROM EMP E JOIN DPT D ON E.DEPTNO=D.DEPTNO ORDER BY DNAME ,ENAME DESC

--18. Find out experience of MILLER. 
SELECT ENAME,DATEDIFF(YEAR,HIREDATE,GETDATE()) 'MILLER EXPERIENCE' FROM EMP WHERE ENAME='MILLER'
