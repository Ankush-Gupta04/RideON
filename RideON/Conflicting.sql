USE RideON2;

START TRANSACTION;
UPDATE Customer SET Rating = Rating + 1 WHERE CustomerID = 1;
START TRANSACTION;
UPDATE Customer SET Rating = Rating - 1 WHERE CustomerID = 1;
UPDATE Driver SET TotalEarning = TotalEarning + 500 WHERE DriverID = 2;
UPDATE Driver SET TotalEarning = TotalEarning - 500 WHERE DriverID = 2;
COMMIT;
COMMIT;
