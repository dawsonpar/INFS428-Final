-- trigger 1
delimiter $$
create trigger updateHoldings after insert on customer
for each row
begin
	insert into holdings (pID, cID, quantity)
	values
    (1, new.cID, 0),
    (2, new.cID, 0),
    (3, new.cID, 0),
    (4, new.cID, 0),
    (5, new.cID, 0),
    (6, new.cID, 0),
    (7, new.cID, 0),
    (8, new.cID, 0);
end $$
delimiter ;





-- TRIGGER 2
-- Create a trigger to update the quantity in Holdings once a withdrawal is initiated

delimiter $$
create trigger withdrawal_holdings_quantity after Insert on delivery
For Each Row
begin
	if new.deliveryType = 'withdrawal' then
		update holdings
		set quantity = quantity - new.quantity
		where pID = new.pID AND cID = new.cID;
    end if;
end $$
delimiter ;






-- TRIGGER 3
-- Create a trigger to update the quantity in Holdings once a delivery is initiated
delimiter $$
create trigger delivery_holdings_update after insert on delivery
for each row
begin
	if new.deliveryType = 'delivery' then
    update holdings 
    set quantity = quantity + new.quantity
    where pID = new.pID AND cID = new.cID;
    end if;
end $$
delimiter ;
