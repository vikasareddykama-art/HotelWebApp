package com.dao;

import com.model.Reservation;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ReservationDAO {

    private static final String DB_URL      = "jdbc:mysql://localhost:3306/hoteldb";
    private static final String DB_USER     = "root";
    private static final String DB_PASSWORD = "PASSWORD1234";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /* ──────────────────────────────────────────
       ADD
    ────────────────────────────────────────── */
    public boolean addReservation(Reservation r) throws Exception {
        String sql = "INSERT INTO Reservations (ReservationID, CustomerName, RoomNumber, " +
                     "CheckIn, CheckOut, TotalAmount) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, r.getReservationID());
            ps.setString(2, r.getCustomerName());
            ps.setString(3, r.getRoomNumber());
            ps.setDate(4, r.getCheckIn());
            ps.setDate(5, r.getCheckOut());
            ps.setDouble(6, r.getTotalAmount());
            return ps.executeUpdate() > 0;
        }
    }

    /* ──────────────────────────────────────────
       UPDATE
    ────────────────────────────────────────── */
    public boolean updateReservation(Reservation r) throws Exception {
        String sql = "UPDATE Reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, " +
                     "CheckOut=?, TotalAmount=? WHERE ReservationID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getCustomerName());
            ps.setString(2, r.getRoomNumber());
            ps.setDate(3, r.getCheckIn());
            ps.setDate(4, r.getCheckOut());
            ps.setDouble(5, r.getTotalAmount());
            ps.setInt(6, r.getReservationID());
            return ps.executeUpdate() > 0;
        }
    }

    /* ──────────────────────────────────────────
       DELETE
    ────────────────────────────────────────── */
    public boolean deleteReservation(int reservationID) throws Exception {
        String sql = "DELETE FROM Reservations WHERE ReservationID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, reservationID);
            return ps.executeUpdate() > 0;
        }
    }

    /* ──────────────────────────────────────────
       GET ALL
    ────────────────────────────────────────── */
    public List<Reservation> getAllReservations() throws Exception {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations ORDER BY CheckIn DESC";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    /* ──────────────────────────────────────────
       GET BY ID
    ────────────────────────────────────────── */
    public Reservation getReservationById(int reservationID) throws Exception {
        String sql = "SELECT * FROM Reservations WHERE ReservationID=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, reservationID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    /* ──────────────────────────────────────────
       REPORT 1 – Reservations in a date range
    ────────────────────────────────────────── */
    public List<Reservation> getReservationsByDateRange(Date fromDate, Date toDate) throws Exception {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ? " +
                     "ORDER BY CheckIn";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, fromDate);
            ps.setDate(2, toDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    /* ──────────────────────────────────────────
       REPORT 2 – Most frequently booked rooms
    ────────────────────────────────────────── */
    public List<String[]> getMostBookedRooms() throws Exception {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT RoomNumber, COUNT(*) AS BookingCount " +
                     "FROM Reservations GROUP BY RoomNumber ORDER BY BookingCount DESC";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new String[]{ rs.getString("RoomNumber"),
                                       String.valueOf(rs.getInt("BookingCount")) });
            }
        }
        return list;
    }

    /* ──────────────────────────────────────────
       REPORT 3 – Total revenue over a period
    ────────────────────────────────────────── */
    public double getTotalRevenue(Date fromDate, Date toDate) throws Exception {
        String sql = "SELECT SUM(TotalAmount) AS Revenue FROM Reservations " +
                     "WHERE CheckIn >= ? AND CheckOut <= ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, fromDate);
            ps.setDate(2, toDate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getDouble("Revenue");
            }
        }
        return 0.0;
    }

    /* ──────────────────────────────────────────
       HELPER – map ResultSet row → Reservation
    ────────────────────────────────────────── */
    private Reservation mapRow(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.setReservationID(rs.getInt("ReservationID"));
        r.setCustomerName(rs.getString("CustomerName"));
        r.setRoomNumber(rs.getString("RoomNumber"));
        r.setCheckIn(rs.getDate("CheckIn"));
        r.setCheckOut(rs.getDate("CheckOut"));
        r.setTotalAmount(rs.getDouble("TotalAmount"));
        return r;
    }
}
