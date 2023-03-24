USE RideON2;

-- trigger to update vehicle status
DELIMITER $$
CREATE TRIGGER update_vehicle_status1
AFTER INSERT ON Trip
FOR EACH ROW
BEGIN
    UPDATE Vehicles SET Status = 'Unavailable'
    WHERE VehicleID = NEW.VehicleID;
END$$
DELIMITER ;

-- To Check if trigeer is working 
-- Insert a new trip record
insert into trip (PickupLocation, DropLocation, CustomerID, Price, VehicleID, PaymentMethod, Date) values ('NP', 'Kurukshetra', 61, 900, 11, 100, '2022-03-07 22:19:29');

-- Verify that the corresponding vehicle status has been updated
SELECT Status FROM Vehicles WHERE VehicleID = 11;

-- trigger to update earnings
DELIMITER $$
CREATE TRIGGER update_driver_earning1
AFTER INSERT ON Trip
FOR EACH ROW
BEGIN
    UPDATE Driver
    SET TotalEarning = TotalEarning + NEW.Price
    WHERE Driver.DriverID = NEW.DriverID;
END;
DELIMITER ;


INSERT INTO trip (PickupLocation, DropLocation, CustomerID, Price, VehicleID, PaymentMethod, Date) values ('NP', 'Kurukshetra', 65, 900, 10, 100, '2022-03-07 22:19:29');


-- Check if the TotalEarning field of the corresponding Driver has been updated
SELECT TotalEarning
FROM Driver
WHERE DriverID = 1;





-- unavilable
DELIMITER $$
CREATE TRIGGER check_vehicle_status1
BEFORE INSERT ON Trip
FOR EACH ROW
BEGIN
    DECLARE vehicle_status VARCHAR(10);
    SELECT Status INTO vehicle_status
    FROM Vehicles
    WHERE VehicleID = NEW.VehicleID;
    
    IF vehicle_status = 'Unavailable' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle is already on a trip';
    END IF;
END;
DELIMITER ;


-- Set up the data by inserting a vehicle with an Unavailable status
insert into vehicles (Status, RegistrationNo, Model, LicenseNO, Colour, Capacity) values ('Unavailable', 'OgdJQEZcJ21', 'Alto', '1G4HD57228U4932861', 'Mauv', 3);


-- Try to insert a new trip with the same vehicle
INSERT INTO trip (PickupLocation, DropLocation, CustomerID, Price, VehicleID, PaymentMethod, Date) values ('NP', 'Kurukshetra', 65, 900, 121, 100, '2022-03-07 22:19:29');


