drop procedure if exists placeOrderFromCart; #gets rid of old stuff
delimiter $$ #declares new delimiter
create procedure placeOrderFromCart(custNo int) #
begin #nested with end

	declare nItems int; #
    declare oid int;
    declare EXIT HANDLER for sqlexception
    begin
		rollback;
        resignal;
        select 'An error occurred';
	end;
    select count(*) into nItems from shoppingCart #next 6 lines, is the sanity check...checking if empty or not, if nothing throws an exception
		where customerNumber=custNo;
    if nItems=0 then
		signal sqlstate '45000'
        SET message_text='Attempted to place order from empty cart';
	end if;
    start transaction; #
    select max(orderNumber) into oid from orders;
    #creating orders
    insert into orders values (null, sysdate(), date_add(sysdate(),
    Interval 7 day), null, 'In Process', null, custNo);
    #added 7 days to system date
    #set oid=last_insert_id();
    insert into orderdetails
		select oid, productCode, quantity, MSRP, 0
        from shoppingCart c join products using(productCode)
        where customerNumber=custNo;
	delete from shoppingCart where customerNumber=custNo;
end$$
delimiter ;
