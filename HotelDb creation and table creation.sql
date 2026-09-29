--CREATE DATABASE HotelBookingDB;
--use HotelBookingDB;

CREATE TABLE Customers(
customer_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
city VARCHAR(50),
created_at DATE DEFAULT GETDATE()
);

SELECT *
FROM Customers;

CREATE TABLE RoomTypes(
room_type_id INT IDENTITY(1,1) PRIMARY KEY,
room_type VARCHAR(50) UNIQUE NOT NULL,
capacity INT NOT NULL,
base_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Rooms(
room_id INT IDENTITY(1,1) PRIMARY KEY,
room_number INT UNIQUE NOT NULL,
room_type_id INT NOT NULL ,
floor INT NOT NULL,
status VARCHAR(20) NOT NULL DEFAULT('Available'),
FOREIGN KEY(room_type_id) REFERENCES 
RoomTypes(room_type_id)
);

CREATE TABLE Bookings(
booking_id INT IDENTITY(1,1) PRIMARY KEY,
customer_id INT NOT NULL,
room_id INT NOT NULL,
check_in_date DATE NOT NULL,
check_out_date DATE NOT NULL,
booking_date DATE DEFAULT GETDATE(),
status VARCHAR(20) NOT NULL DEFAULT('confirmed'),
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(room_id) REFERENCES Rooms(room_id),
CHECK (check_out_date > check_in_date)
);

CREATE TABLE Payments(
payment_id INT IDENTITY(1,1) PRIMARY KEY,
booking_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
payment_date DATE DEFAULT GETDATE(),
payment_method VARCHAR(20) NOT NULL,
payment_status VARCHAR(20) NOT NULL DEFAULT('Pending'),
FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id),
CHECK (amount>0),
CHECK (payment_method IN ('Card', 'UPI', 'Cash')),
CHECK (payment_status IN ('Pending','Paid','Failed','Refunded'))
);