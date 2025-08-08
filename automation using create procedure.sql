DELIMITER //

CREATE PROCEDURE populate_feed(IN feed_name VARCHAR(50), IN row_count INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE sql_text TEXT;

    WHILE i < row_count DO
        IF feed_name = 'feed_1' THEN
            SET sql_text = CONCAT(
                "INSERT INTO feed_1 (name, email, phone, city, gender, age, join_date, department, designation, salary)
                 VALUES (
                    CONCAT('Name_', ", i, "),
                    CONCAT('user", i, "@example.com'),
                    CONCAT('+91', FLOOR(1000000000 + RAND()*8999999999)),
                    CONCAT('City_', FLOOR(RAND()*100)),
                    IF(RAND() < 0.5, 'Male', 'Female'),
                    FLOOR(18 + RAND()*42),
                    CURDATE() - INTERVAL FLOOR(RAND()*1000) DAY,
                    CONCAT('Dept_', FLOOR(RAND()*10)),
                    CONCAT('Desig_', FLOOR(RAND()*10)),
                    ROUND(30000 + RAND() * 50000, 2)
                )"
            );

        ELSEIF feed_name = 'feed_2' THEN
            SET sql_text = CONCAT(
                "INSERT INTO feed_2 VALUES (
                    'Val1_", i, "', 'Val2_", i, "', 'Val3', 'Val4', 'Val5',
                    'Val6', 'Val7', 'Val8', 'Val9', 'Val10',
                    'Val11', 'Val12', 'Val13', 'Val14', 'Val15')"
            );

        ELSEIF feed_name = 'feed_3' THEN
            SET sql_text = CONCAT(
                "INSERT INTO feed_3 VALUES (
                    'Val1_", i, "', 'Val2_", i, "', 'Val3', 'Val4', 'Val5',
                    'Val6', 'Val7', 'Val8', 'Val9', 'Val10',
                    'Val11', 'Val12', 'Val13', 'Val14', 'Val15',
                    'Val16', 'Val17', 'Val18', 'Val19', 'Val20')"
            );
        END IF;

        SET @sql := sql_text;
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
