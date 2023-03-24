USE RideON2;

-- available drivers : Quer1
SELECT driver.DriverID, driver.Name , driver.Rating , driver.VehicleID, vehicles.Capacity, vehicles.Status, vehicles.Model
FROM driver
JOIN vehicles ON driver.VehicleID = vehicles.VehicleID
WHERE vehicles.Status =  "Available";

-- Driver with ratings > 3 : Query 2
SELECT driver.DriverID, driver.Name , driver.Rating , driver.VehicleID, driver.Rating, driver.Email
FROM Driver
WHERE Rating >3;

-- Average earnings for a driver : Query 3
SELECT AVG(driver.TotalEarning)
FROM driver;

-- Query 4: No of Rental Stands in a particular city/place
SELECT COUNT(DetailsofStand)
FROM rentalservice
where DetailsofStand = 'Chandigarh';

-- Query 5: Employees of salary more than 1L
SELECT * FROM employees
WHERE Salary BETWEEN 100000 AND 150000;

-- Query 6: Top 10 drivers wrt earning
SELECT driver.DriverID, driver.Name , driver.Rating , driver.VehicleID, vehicles.Capacity, vehicles.Status, vehicles.Model, driver.TotalEarning
FROM driver
JOIN vehicles ON driver.VehicleID = vehicles.VehicleID
ORDER BY TotalEarning DESC
LIMIT 10;

-- Query 7: Trips on a particular date.
SELECT * FROM trip WHERE Date='2022-11-11';

-- Query 8: Trips with  particular droplocation
create Table IF NOT EXISTS Operational_city(
	name char(50) PRIMARY KEY);
insert into Operational_city(name) value('Kurukshetra');
select * from trip where DropLocation in (
	select name from Operational_city
);

-- Query 9: Customers who havennot done any ride 
SELECT *
FROM customer
WHERE CustomerID  NOT IN (
    SELECT DISTINCT CustomerID
    FROM trip
);

-- Query 10: Trips of 2 particular customer
select * from trip 
where CustomerID = 90 or CustomerID = 52; 

-- Query 11 wildcards
SELECT *
FROM trip
WHERE PickupLocation LIKE '%am%';


-- Query 12 update
SET SQL_SAFE_UPDATES = 0;
UPDATE vehicles
SET capacity=1
WHERE Model = 'Bike';
select * from vehicles;

-- Query 13 Union (shows data of non-employee)
SELECT Name, PhoneNumber 
FROM driver
UNION
SELECT Name, PhoneNumber 
FROM customer;


-- Query 14 Trigger for adding new vehicle
create trigger newveh
before INSERT
on 
vehicles
for each row
Update rentalservice
SET rentalservice.NOCabAvailable = rentalservice.NOCabAvailable + 1
where ServiceID = 100;

insert into vehicles (Status, RegistrationNo, Model, LicenseNO, Colour, Capacity) values ('Available', 'GUdd8bsZsL', 'SUV', '5N1AR2MMXEC35354', 'Khaki', 3);
select * from rentalservice;

