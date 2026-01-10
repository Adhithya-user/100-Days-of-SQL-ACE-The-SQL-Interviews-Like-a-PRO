-- amazon

SET @today_date = '2022-01-10';
SET @n = 3;

SELECT DATE_ADD(
    DATE_ADD(@today_date, INTERVAL (7 - WEEKDAY(@today_date)) DAY),
    INTERVAL (@n-1)*7 DAY
);
