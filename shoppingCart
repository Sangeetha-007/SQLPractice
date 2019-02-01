drop procedure if exists addItemToCart;
delimiter $$
create procedure AddItemToCart(custNo int, prodCode varchar(15), quant int)
proc_label:begin
	declare curQuant int;
    if(quant=0) then
		delete from shoppingCart
			where customerNumber=custNo and productCode=prodCode;
            LEAVE proc_label;
		end if;
    select quantity into curQuant from shoppingCart
		where customerNumber=custNo and productCode=prodCode;
	if quantity is NULL then
		insert into shoppingCart
        values (custNo, prodCode, quant, curdate());
	else 
		update shoppingCart set quantity=quant, dateAdded=curdate()
			where customerNumber=custNo and productCode=prodCode;
	end if;
end$$
delimiter ;

call addItemToCart(103, 'S10_1678',0);
select* from shoppingCart;
