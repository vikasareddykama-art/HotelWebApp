package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayReservations")
public class DisplayReservationsServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Reservation> reservations = dao.getAllReservations();
            request.setAttribute("reservations", reservations);
        } catch (Exception e) {
            request.setAttribute("message", "Error loading reservations: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("/reservationdisplay.jsp").forward(request, response);
    }
}
