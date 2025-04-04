select first_name as "First_name" , last_name as "Last_name"
from data.employees;

select distinct department_id from data.employees;

select * from data.employees 
order by first_name desc;

select e.first_name as "First Name", e.last_name as "Last Name",j.job_title as "Job Title",
d.department_id as "Department_id", d.department_name as "Department Name "
from data.employees e join data.jobs j on e.job_id=j.job_id
join data.departments d on e.department_id=d.department_id
join data.locations l on d.location_id =l.location_id
where l.city='London';

select first_name , last_name , department_id from data.employees;

select e.employee_id,e.last_name as "Name",e.manager_id,m.last_name as "Manager Name"
from data.employees e left join data.employees m on e.manager_id=m.employee_id;