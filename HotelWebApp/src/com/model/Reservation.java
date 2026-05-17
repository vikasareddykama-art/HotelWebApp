package com.model;

import java.sql.Date;

public class Reservation {

    private int reservationID;
    private String customerName;
    private String roomNumber;
    private Date checkIn;
    private Date checkOut;
    private double totalAmount;

    public Reservation() {}

    public Reservation(int reservationID, String customerName, String roomNumber,
                       Date checkIn, Date checkOut, double totalAmount) {
        this.reservationID = reservationID;
        this.customerName = customerName;
        this.roomNumber = roomNumber;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalAmount = totalAmount;
    }

    public int getReservationID() { return reservationID; }
    public void setReservationID(int reservationID) { this.reservationID = reservationID; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public Date getCheckIn() { return checkIn; }
    public void setCheckIn(Date checkIn) { this.checkIn = checkIn; }

    public Date getCheckOut() { return checkOut; }
    public void setCheckOut(Date checkOut) { this.checkOut = checkOut; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}
