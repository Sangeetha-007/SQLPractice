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

select c.customerName, p.productLine
from customers c join orders o on c.customerNumber=o.customerNumber 
join orderdetails o1 on o.orderNumber=o1.orderNumber
join products p on o1.productCode=p.productCode
join productlines p1 on p.productLine=p1.productLine
where p1.productLine in ('Motorcycles', 'Trains');

#same as above
select customerName
from customers join orders using(customerNumber)
join orderdetails using(orderNumber)
join products using(productCode)
where productLine in ('Motorcycles', 'Trains');
