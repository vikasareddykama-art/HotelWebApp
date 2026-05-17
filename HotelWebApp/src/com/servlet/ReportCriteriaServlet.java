package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReportCriteria")
public class ReportCriteriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        if (reportType != null && !reportType.isEmpty()) {
            request.setAttribute("reportType", reportType);
        }
        request.getRequestDispatcher("/report_form.jsp").forward(request, response);
    }
}
