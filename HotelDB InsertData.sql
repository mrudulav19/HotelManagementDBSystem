INSERT INTO RoomTypes(room_type,capacity,base_price)
	VALUES('Single',1,2000),
	       ('Double',2,3500),
		   ('Deluxe',3,5000),
		   ('Suite',4,7500);
select * from RoomTypes;
	
INSERT INTO Rooms(room_number,room_type_id,floor)
	VALUES(101,1,1),
	      (102,1,1),
	      (103,1,1),
		  (104,2,1),
		  (201,2,2),
		  (202,2,2),
		  (203,2,2),
		  (204,3,2),
		  (301,3,3),
		  (302,3,3),
		  (401,4,4),
		  (402,4,4);

SELECT room_type_id,
	   COUNT(*) AS room_count
FROM Rooms
GROUP BY room_type_id;

INSERT INTO Customers (first_name, last_name, email, phone, city)
VALUES
('Alex', 'Carter', 'alex.carter@email.com', '9876543210', 'Chennai'),
('Emma', 'Wilson', 'emma.wilson@email.com', '9876543211', 'Bangalore'),
('Liam', 'Anderson', 'liam.anderson@email.com', '9876543212', 'Chennai'),
('Sophia', 'Martin', 'sophia.martin@email.com', '9876543213', 'Mumbai'),
('Noah', 'Taylor', 'noah.taylor@email.com', '9876543214', 'Hyderabad'),
('Olivia', 'Thomas', 'olivia.thomas@email.com', '9876543215', 'Chennai'),
('Ethan', 'Moore', 'ethan.moore@email.com', '9876543216', 'Bangalore'),
('Ava', 'Jackson', 'ava.jackson@email.com', '9876543217', 'Delhi'),
('James', 'White', 'james.white@email.com', '9876543218', 'Chennai'),
('Mia', 'Harris', 'mia.harris@email.com', '9876543219', 'Mumbai');

select * from Customers;

INSERT INTO Bookings
    (customer_id, room_id, check_in_date, check_out_date, booking_date, status)
VALUES
(1, 1, '2026-09-01', '2026-09-04', '2026-08-20', 'Confirmed'),
(2, 4, '2026-09-02', '2026-09-06', '2026-08-22', 'Confirmed'),
(3, 5, '2026-09-03', '2026-09-05', '2026-08-25', 'Completed'),
(4, 8, '2026-09-04', '2026-09-09', '2026-08-27', 'Completed'),
(5, 11, '2026-09-05', '2026-09-12', '2026-08-28', 'Completed'),
(6, 2, '2026-09-07', '2026-09-10', '2026-08-30', 'Completed'),
(7, 6, '2026-09-08', '2026-09-11', '2026-09-01', 'Completed'),
(8, 9, '2026-09-10', '2026-09-14', '2026-09-02', 'Completed'),
(9, 12, '2026-09-11', '2026-09-15', '2026-09-03', 'Completed'),
(10, 3, '2026-09-12', '2026-09-16', '2026-09-04', 'Completed'),

-- Repeat customers
(1, 7, '2026-09-17', '2026-09-20', '2026-09-06', 'Confirmed'),
(3, 10, '2026-09-18', '2026-09-23', '2026-09-07', 'Confirmed'),
(4, 11, '2026-09-19', '2026-09-25', '2026-09-08', 'Confirmed'),
(6, 1, '2026-09-20', '2026-09-22', '2026-09-09', 'Confirmed'),
(9, 4, '2026-09-21', '2026-09-24', '2026-09-10', 'Confirmed'),

-- Some cancelled bookings
(2, 3, '2026-09-22', '2026-09-25', '2026-09-11', 'Cancelled'),
(5, 6, '2026-09-23', '2026-09-26', '2026-09-12', 'Cancelled'),
(7, 9, '2026-09-24', '2026-09-28', '2026-09-13', 'Cancelled');

SELECT *
FROM Bookings
ORDER BY booking_id;

INSERT INTO Payments
    (booking_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 6000, '2026-08-20', 'Card', 'Paid'),
(2, 14000, '2026-08-22', 'UPI', 'Paid'),
(3, 7000, '2026-08-25', 'Card', 'Paid'),
(4, 25000, '2026-08-27', 'Cash', 'Paid'),
(5, 52500, '2026-08-28', 'Card', 'Paid'),
(6, 6000, '2026-08-30', 'UPI', 'Paid'),
(7, 10500, '2026-09-01', 'Card', 'Paid'),
(8, 20000, '2026-09-02', 'UPI', 'Paid'),
(9, 30000, '2026-09-03', 'Card', 'Paid'),
(10, 8000, '2026-09-04', 'Cash', 'Paid'),

(11, 10500, '2026-09-06', 'Card', 'Paid'),
(12, 25000, '2026-09-07', 'UPI', 'Paid'),
(13, 45000, '2026-09-08', 'Card', 'Paid'),
(14, 4000, '2026-09-09', 'Cash', 'Paid'),
(15, 10500, '2026-09-10', 'UPI', 'Paid'),

(16, 6000, '2026-09-11', 'Card', 'Refunded'),
(17, 10500, '2026-09-12', 'UPI', 'Refunded');

SELECT COUNT(*) AS customer_count FROM Customers;
SELECT COUNT(*) AS room_count FROM Rooms;
SELECT COUNT(*) AS booking_count FROM Bookings;
SELECT COUNT(*) AS payment_count FROM Payments;