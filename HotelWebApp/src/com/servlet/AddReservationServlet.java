package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddReservation")
public class AddReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/reservationadd.jsp").forward(request, response);
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

            boolean success = dao.addReservation(r);
            if (success) {
                request.setAttribute("message", "Reservation added successfully!");
                request.setAttribute("msgType", "success");
            } else {
                request.setAttribute("message", "Failed to add reservation. Please try again.");
                request.setAttribute("msgType", "danger");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("/reservationadd.jsp").forward(request, response);
    }
}
