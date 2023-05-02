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
