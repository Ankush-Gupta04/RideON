CREATE DATABASE IF NOT EXISTS RideON2;
USE RideON2;

CREATE TABLE IF NOT EXISTS Employees(EmployeeID int NOT NULL AUTO_INCREMENT PRIMARY KEY , 
									Name varchar(50) NOT NULL,
									Post varchar(30) NOT NULL,
									Email varchar(50) UNIQUE, 
									BankInfo varchar(50) NOT NULL UNIQUE, 
									PhoneNumber bigint NOT NULL UNIQUE,
									Salary bigint NOT NULL DEFAULT 10000, 
									Password varchar(30)
									); 
                                    
CREATE TABLE IF NOT EXISTS Vehicles(Status varchar(15) NOT NULL DEFAULT 'Available',
									RegistrationNo varchar(20) NOT NULL UNIQUE,
                                    VehicleID int auto_increment PRIMARY KEY,
                                    Model varchar(10),
                                    LicenseNO varchar(20) NOT NULL UNIQUE,
                                    Colour varchar(10),
                                    Capacity int NOT NULL
                                    );

CREATE TABLE IF NOT EXISTS Customer (Name varchar(50) NOT NULL,
									PhoneNumber bigint NOT NULL UNIQUE,
                                    Rating int NOT NULL,
                                    Email varchar(50) UNIQUE, 
									Password varchar(30), 
									CustomerID int UNIQUE AUTO_INCREMENT PRIMARY KEY
                                    );

CREATE TABLE IF NOT EXISTS Driver(DriverID int AUTO_INCREMENT PRIMARY KEY,
								Name varchar(50) NOT NULL,
								Email varchar(50) UNIQUE, 
								TotalEarning int NOT NULL UNIQUE, 
								PhoneNumber bigint NOT NULL UNIQUE,
								Rating int NOT NULL,
								Password varchar(30), 
								VehicleID int NOT NULL,
								FOREIGN KEY (VehicleID) 
									REFERENCES Vehicles(VehicleID)
										ON UPDATE CASCADE
										ON DELETE CASCADE
                                );


CREATE TABLE IF NOT EXISTS Payment(Expiry_date date NOT NULL,
									Payment_id int UNIQUE AUTO_INCREMENT PRIMARY KEY,
									OTP char(50),
									Type char(50)
								);

CREATE TABLE IF NOT EXISTS Trip (PickupLocation varchar(50) NOT NULL,
								DropLocation varchar(50) NOT NULL,
                                CustomerID int,
                                Price int NOT NULL DEFAULT 200,
                                TripID int UNIQUE AUTO_INCREMENT PRIMARY KEY,
                                VehicleID int NOT NULL,
                                PaymentMethod int NOT NULL,
                                Date date ,
                                FOREIGN KEY (VehicleID) 
								REFERENCES Vehicles(VehicleID)
									ON UPDATE CASCADE
									ON DELETE CASCADE,
								FOREIGN KEY (PaymentMethod) 
								REFERENCES Payment(Payment_iD)
									ON UPDATE CASCADE
									ON DELETE CASCADE,
								FOREIGN KEY (CustomerID) 
								REFERENCES Customer(CustomerID)
									ON UPDATE CASCADE
									ON DELETE CASCADE
                                );     

CREATE TABLE IF NOT EXISTS RentalService(ChargesPerDay int NOT NULL,
										NoCabAvailable int NOT NULL,
                                        DetailsofStand varchar(50),
                                        ServiceID int NOT NULL AUTO_INCREMENT PRIMARY KEY);
                                        

CREATE TABLE IF NOT EXISTS TaxiService(ChargesPerKm int NOT NULL,
										NoTaxiAvailable int NOT NULL,
                                        ServiceID int NOT NULL AUTO_INCREMENT PRIMARY KEY);

CREATE TABLE IF NOT EXISTS HelpService(Employee int,
										serviceid int NOT NULL auto_increment primary key,
                                        Driver int,
                                        Customer int,
                                        FOREIGN KEY (Customer) 
										REFERENCES Customer(CustomerID)
											ON UPDATE CASCADE
											ON DELETE CASCADE,
										FOREIGN KEY (Driver) 
										REFERENCES Driver(DriverID)
											ON UPDATE CASCADE
											ON DELETE CASCADE,
										FOREIGN KEY (Employee) 
										REFERENCES Employees(EmployeeID)
											ON UPDATE CASCADE
											ON DELETE CASCADE
										);
CREATE INDEX cu_id on Customer(CustomerId);
CREATE INDEX tr_id on Trip(Tripid);                     
                                        
                    


