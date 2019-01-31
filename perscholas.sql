use classicmodels;


select c.contactLastName, c.contactFirstName, count(o.orderNumber) 
from customers c left join orders o
on c.customerNumber=o.customerNumber
group by c.customerNumber;

#the relatioship between the customers and orders table is customerNumber
#we use the count function

select c.contactLastName, c.contactFirstName, count(o.orderNumber) 
from customers c left join orders o
on c.customerNumber=o.customerNumber
group by c.customerNumber
having count(o.orderNumber) between 5 and 10;
#having count(o.orderNumber)>=5 and count(o.orderNumber)<=10;

select c.customerName, sum(p.amount)
from customers c join payments p
on c.customerNumber=p.customerNumber
group by c.customerNumber;

select c.customerName, sum(p.amount)
from customers c join payments p
on c.customerNumber=p.customerNumber
where p.paymentDate>='2004-01-01'
group by c.customerNumber;
#YYYY-MM-DD
 
