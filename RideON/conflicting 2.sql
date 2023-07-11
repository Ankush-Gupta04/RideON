START TRANSACTION;
UPDATE Customer SET Rating = Rating + 1 WHERE CustomerID = 1;
COMMIT;

START TRANSACTION;
UPDATE Customer SET Rating = Rating - 1 WHERE CustomerID = 1;
COMMIT;

START TRANSACTION;
UPDATE Driver SET TotalEarning = TotalEarning + 500 WHERE DriverID = 2;
UPDATE Driver SET TotalEarning = TotalEarning - 500 WHERE DriverID = 2;
COMMIT;
