use analiza;
delete from analiza_tbl;
drop procedure if exists doWhile;
DELIMITER $$  
CREATE PROCEDURE doWhile()   
BEGIN
DECLARE i INT DEFAULT 1; 
WHILE (i <= 1000) DO
    INSERT INTO analiza_tbl(analiza_factor) values ('randome_value' );
    SET i = i+1;
END WHILE;
END$$
DELIMITER ;
call doWhile();
