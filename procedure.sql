-- procedure 1
DELIMITER $$
CREATE PROCEDURE holdingsValue (IN custID INT, out hValue INT)
begin 
	select sum(quantity*price) into hValue from (customer c NATURAL JOIN holdings h) NATURAL JOIN product p
	where c.cID = custID;
end $$
DELIMITER ;

-- procedure 2
DELIMITER $$
CREATE PROCEDURE getWithdrawals (IN mType VARCHAR(20), IN mShape VARCHAR(15), OUT numWithdrew INT)
begin 
    select count(deliveryType) into numWithdrew from delivery where deliveryType = 'withdrawal' and pID = 
    (select pID from product where metalType = mType and shape = mShape);
end $$
DELIMITER ;
