-- ============================================================
--  Hotel Management System – MySQL Database Script
--  Database : hoteldb
-- ============================================================

-- 1. Create & select database
CREATE DATABASE IF NOT EXISTS hoteldb;
USE hoteldb;

-- ============================================================
--  TABLE : Reservations
-- ============================================================
CREATE TABLE IF NOT EXISTS Reservations (
    ReservationID  INT            PRIMARY KEY,
    CustomerName   VARCHAR(100)   NOT NULL,
    RoomNumber     VARCHAR(10)    NOT NULL,
    CheckIn        DATE           NOT NULL,
    CheckOut       DATE           NOT NULL,
    TotalAmount    DECIMAL(10,2)  NOT NULL
);

-- ============================================================
--  SAMPLE DATA  (20 records)
-- ============================================================
INSERT INTO Reservations (ReservationID, CustomerName, RoomNumber, CheckIn, CheckOut, TotalAmount) VALUES
(1001, 'Arjun Sharma',       '101', '2024-01-05', '2024-01-08', 4500.00),
(1002, 'Priya Nair',         '202', '2024-01-10', '2024-01-14', 8000.00),
(1003, 'Rahul Verma',        '303', '2024-01-15', '2024-01-17', 3200.00),
(1004, 'Sneha Iyer',         '101', '2024-02-01', '2024-02-05', 6000.00),
(1005, 'Vikram Patel',       '405', '2024-02-10', '2024-02-12', 2800.00),
(1006, 'Ananya Reddy',       '202', '2024-02-18', '2024-02-22', 7200.00),
(1007, 'Karan Mehta',        '301', '2024-03-01', '2024-03-04', 5100.00),
(1008, 'Deepika Joshi',      '102', '2024-03-10', '2024-03-15', 9500.00),
(1009, 'Suresh Kumar',       '404', '2024-03-20', '2024-03-22', 2400.00),
(1010, 'Meera Pillai',       '303', '2024-04-02', '2024-04-06', 6800.00),
(1011, 'Aditya Singh',       '101', '2024-04-10', '2024-04-13', 4200.00),
(1012, 'Kavya Menon',        '202', '2024-04-20', '2024-04-25', 8500.00),
(1013, 'Rohit Desai',        '501', '2024-05-01', '2024-05-03', 3600.00),
(1014, 'Pooja Tiwari',       '102', '2024-05-12', '2024-05-16', 7000.00),
(1015, 'Nikhil Bhat',        '404', '2024-05-20', '2024-05-23', 4800.00),
(1016, 'Lakshmi Rao',        '301', '2024-06-01', '2024-06-05', 6400.00),
(1017, 'Manish Gupta',       '202', '2024-06-15', '2024-06-18', 5400.00),
(1018, 'Divya Krishnan',     '303', '2024-07-04', '2024-07-08', 7600.00),
(1019, 'Sanjay Patil',       '501', '2024-07-20', '2024-07-24', 8200.00),
(1020, 'Riya Chakraborty',   '101', '2024-08-01', '2024-08-05', 5800.00);

-- ============================================================
--  VERIFY
-- ============================================================
SELECT * FROM Reservations ORDER BY ReservationID;
