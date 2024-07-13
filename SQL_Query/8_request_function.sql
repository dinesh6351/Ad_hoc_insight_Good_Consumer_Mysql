CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quater`(calender_date Date) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare quarter_month float;
    declare roundup INT;
    declare quart char(2);
    set quarter_month = month(date_add(calender_date,interval 4 month));
    set roundup = ceil(quarter_month/3);
    set quart = concat('Q',roundup);
RETURN quart;
END