delimiter $$
CREATE FUNCTION create_tax_percent(guard_city VARCHAR(30),guard_state varchar(20)) RETURNS INT

DETERMINISTIC

BEGIN
    DECLARE tax_percent INT;
    IF guard_city LIKE "Los Angeles" THEN
        set tax_percent = 7;
    ELSEIF guard_state = "CA" THEN
        set tax_percent = 5;
    ELSE
        set tax_percent = 2;
    END IF;
    RETURN tax_percent;
END $$
delimiter ;