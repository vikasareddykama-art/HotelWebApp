package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteReservation")
public class DeleteReservationServlet extends HttpServlet {

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
                request.setAttribute("message", "Error: " + e.getMessage());
                request.setAttribute("msgType", "danger");
            }
        }
        request.getRequestDispatcher("/reservationdelete.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("reservationID"));
            boolean success = dao.deleteReservation(id);
            if (success) {
                request.setAttribute("message", "Reservation ID " + id + " has been cancelled successfully.");
                request.setAttribute("msgType", "success");
            } else {
                request.setAttribute("message", "Cancellation failed. Reservation ID not found.");
                request.setAttribute("msgType", "danger");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("/reservationdelete.jsp").forward(request, response);
    }
}
