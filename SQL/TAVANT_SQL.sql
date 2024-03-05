let say department headcount is <= 10 small
head count <=100 medium
head count <=1000 large

empid,empname,deptid,headcount,flag

SELECT e2.headcount FROM emp e1 , (SELECT COUNT(1) headcount,deptid FROM emp ) e2
WHERE e1.depti=e2.deptid;

