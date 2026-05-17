package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/UpdateReservation")
public class UpdateReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("reservationID");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Reservation r = dao.getReservationById(id);
                if (r != null) {
                    request.setAttribute("reservation", r);
                } else {
                    request.setAttribute("message", "No reservation found with ID: " + id);
                    request.setAttribute("msgType", "warning");
                }
            } catch (Exception e) {
                request.setAttribute("message", "Error fetching reservation: " + e.getMessage());
                request.setAttribute("msgType", "danger");
            }
        }
        request.getRequestDispatcher("/reservationupdate.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Reservation r = new Reservation();
            r.setReservationID(Integer.parseInt(request.getParameter("reservationID")));
            r.setCustomerName(request.getParameter("customerName"));
            r.setRoomNumber(request.getParameter("roomNumber"));
            r.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
            r.setCheckOut(Date.valueOf(request.getParameter("checkOut")));
            r.setTotalAmount(Double.parseDouble(request.getParameter("totalAmount")));

            boolean success = dao.updateReservation(r);
            if (success) {
                request.setAttribute("message", "Reservation updated successfully!");
                request.setAttribute("msgType", "success");
            } else {
                request.setAttribute("message", "Update failed. Reservation ID not found.");
                request.setAttribute("msgType", "danger");
            }
            request.setAttribute("reservation", r);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("/reservationupdate.jsp").forward(request, response);
    }
}
