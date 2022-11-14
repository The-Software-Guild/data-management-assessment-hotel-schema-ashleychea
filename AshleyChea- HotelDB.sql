DROP DATABASE IF EXISTS Hotel;

CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE Room (
RoomNumber INT PRIMARY KEY NOT NULL,
RoomType VARCHAR(8) NOT NULL,
IsADA TINYINT(1) NOT NULL,
StandardOccupancy INT NOT NULL,
MaximumOccupancy INT NOT NULL,
BasePrice DECIMAL (5, 2) NOT NULL,
ExtraPerson DECIMAL (2, 0) NOT NULL
);

CREATE TABLE Amenity (
AmenityId INT PRIMARY KEY AUTO_INCREMENT,
AmenityType VARCHAR(40)
);

CREATE TABLE RoomAmentiy (
RoomNumber INT NOT NULL,
AmenityId INT NOT NULL,
PRIMARY KEY pk_RoomAmentiy(RoomNumber, AmenityID),
FOREIGN KEY fk_RoomAmentiy_Room (RoomNumber)
		REFERENCES Room(RoomNumber),
FOREIGN KEY fk_AmenitId_Amenity (AmenityId)
		REFERENCES Amenity(AmenityId)
);

CREATE TABLE Guest (
	GuestID INT PRIMARY KEY AUTO_INCREMENT,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Street varchar(100) NOT NULL,
City varchar(50),
State char(2),
Zip char(5),
Phone char(14)
);

CREATE TABLE Reservation (
	ReservationId INT PRIMARY KEY AUTO_INCREMENT,
Adults INT NOT NULL,
Children INT NOT NULL,
CheckInDate DATE,
CheckOutDate DATE,
TotalRoomCost DECIMAL(6, 2) NOT NULL
);

CREATE TABLE GuestReservation (
	GuestId INT,
ReservationId INT,
PRIMARY KEY pk_GuestReservation (GuestId, ReservationId),
FOREIGN KEY fk_GuestReservation_Guest (GuestId)
	REFERENCES Guest (GuestId),
FOREIGN KEY fk_GuestReservation_Reservation (ReservationId)
	REFERENCES Reservation (ReservationId)
);

CREATE TABLE RoomReservation (
	RoomNumber INT,
    ReservationId INT,
PRIMARY KEY pk_RoomReservation (RoomNumber, ReservationID),
FOREIGN KEY fk_RoomReservation_Room (RoomNumber)
	REFERENCES Room (RoomNumber),
FOREIGN KEY fk_RoomReservation_Reservation (ReservationId)
	REFERENCES Reservation (ReservationId)
);
