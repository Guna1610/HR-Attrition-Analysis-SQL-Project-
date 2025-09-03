select * 
from employeeattrition;

# Overall Attrition Percentage(%)
select attrition, count(*) * 100/ (select count(*) from employeeattrition) as percentage
from employeeattrition
group by 1;

# Attrition by department
select * from employeeattrition;

select department,
       sum(case when attrition = 'yes'then 1 else 0 end) * 100/  count(*) as attrition_rate
from employeeattrition 
group by 1
order by attrition_rate desc;

# Column Rename
alter table employeeattrition
rename column ï»¿Age to age;
 
 # Avg age(left vs stayed)
 select attrition, avg(age) as avg_age 
 from employeeattrition
 group by 1;
 
 # Attrition by Gender
 select gender,
        sum(case when attrition = 'yes' then 1 else 0 end)*100/ count(*) as attrition_rate
 from employeeattrition
 group by gender;
 
 # Job Satisfaction Vs Attrition
 select jobsatisfaction,
	    sum(case when attrition = 'yes' then 1 else 0 end) as left_count,
        sum(case when attrition = 'no' then 0 else 0 end) as stayed_count
 from employeeattrition
 group by jobsatisfaction
 order by jobsatisfaction;
 
 

