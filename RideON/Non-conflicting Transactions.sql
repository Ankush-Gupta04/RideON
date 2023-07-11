USE RideON2;

-- 1st Non-conflicting: Update the charges per km for taxi service:
	START TRANSACTION;
	UPDATE TaxiService
	SET ChargesPerKm = 15
	WHERE ServiceID = 1;
	COMMIT;
    
-- 2nd Non-conflicting: Insert a new rental service and update the NoCabAvailable to 10:


	START TRANSACTION;
	INSERT INTO RentalService (ChargesPerDay, NoCabAvailable, DetailsofStand) 
	VALUES (500, 5, 'MG Road');
	UPDATE RentalService SET NoCabAvailable = 10 WHERE ServiceID = LAST_INSERT_ID();
	COMMIT;
    
-- 3rd Non-conflicting: Transfer the driver with ID 4 to a new vehicle with RegistrationNo 'KA02MG5678':

	START TRANSACTION;
	UPDATE Driver
	SET VehicleID = (SELECT VehicleID FROM Vehicles WHERE RegistrationNo = 'YV4952CY4C1530506')
	WHERE DriverID = 4 AND (SELECT VehicleID FROM Vehicles WHERE RegistrationNo = 'YV4952CY4C1530506') IS NOT NULL;
	COMMIT;

-- 4th Non-conflicting: Create a new employee account and assign them to the HelpService:

	START TRANSACTION;
	INSERT INTO Employees (Name, Post, Email, BankInfo, PhoneNumber, Password) 
	VALUES ('John Doe', 'Customer Support', 'johndoe@example.com', '1234567890', 9876543210, 'password');
	INSERT INTO HelpService (Employee) 
	VALUES (LAST_INSERT_ID());
	COMMIT;

-- 5th Non-conflicting: 


START TRANSACTION;


START TRANSACTION;

INSERT INTO RentalService (ChargesPerDay, NoCabAvailable, DetailsofStand) VALUES (50, 10, 'Stand A');
INSERT INTO Customer (Name, PhoneNumber, Rating, Email, Password) VALUES ('Jane Doe', '5555555555', 5, 'jane.doe@example.com', 'password');
INSERT INTO Trip (PickupLocation, DropLocation, CustomerID, VehicleID, PaymentMethod, Date) VALUES ('123 Main St', '456 Oak St', LAST_INSERT_ID(), 14, 1, NOW());
INSERT INTO Payment (Expiry_date, OTP, Type) VALUES (DATE_ADD(NOW(), INTERVAL 1 DAY), '123456', 'Credit Card');

COMMIT;
