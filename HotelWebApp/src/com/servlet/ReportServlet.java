package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/Report")
public class ReportServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        request.setAttribute("reportType", reportType);

        try {
            if ("dateRange".equals(reportType)) {
                Date fromDate = Date.valueOf(request.getParameter("fromDate"));
                Date toDate   = Date.valueOf(request.getParameter("toDate"));
                List<Reservation> results = dao.getReservationsByDateRange(fromDate, toDate);
                request.setAttribute("fromDate", fromDate);
                request.setAttribute("toDate", toDate);
                request.setAttribute("reservations", results);

            } else if ("mostBooked".equals(reportType)) {
                List<String[]> results = dao.getMostBookedRooms();
                request.setAttribute("roomStats", results);

            } else if ("revenue".equals(reportType)) {
                Date fromDate = Date.valueOf(request.getParameter("fromDate"));
                Date toDate   = Date.valueOf(request.getParameter("toDate"));
                double revenue = dao.getTotalRevenue(fromDate, toDate);
                request.setAttribute("fromDate", fromDate);
                request.setAttribute("toDate", toDate);
                request.setAttribute("totalRevenue", revenue);
            }

        } catch (Exception e) {
            request.setAttribute("message", "Error generating report: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }

        request.getRequestDispatcher("/report_result.jsp").forward(request, response);
    }
}
