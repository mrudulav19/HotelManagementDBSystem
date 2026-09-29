
--Display the first name, last name, email, and city of every customer who lives in Chennai.
SELECT first_name,last_name,email,city FROM Customers where city='Chennai';

--Display each booking along with the customer's first name, last name, check-in date, check-out date, and booking status.
SELECT c.first_name,c.last_name,b.check_in_date,b.check_out_date,b.status FROM Customers as c JOIN Bookings as b ON c.customer_id=b.customer_id;

--Find all customers who have never made a booking.
SELECT c.first_name,c.last_name FROM Customers as c LEFT JOIN Bookings as b ON  c.customer_id = b.customer_id WHERE b.booking_id IS NULL;
--Display each booking's: customer first name,customer last name,room number,room type,base price

select c.first_name,c.last_name,