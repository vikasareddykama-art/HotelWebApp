<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Result – Hotel Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root { --navy:#0d1b2a; --gold:#c9a84c; --dark-card:#162032; }
        body { font-family:'Lato',sans-serif; background:var(--navy); color:#fff; min-height:100vh; }
        .navbar { background:rgba(13,27,42,0.97); border-bottom:1px solid rgba(201,168,76,0.3); padding:14px 0; }
        .navbar-brand { font-family:'Playfair Display',serif; font-size:1.5rem; color:var(--gold)!important; }
        .nav-link { color:rgba(255,255,255,0.8)!important; font-size:0.88rem; }
        .nav-link:hover { color:var(--gold)!important; }
        .page-header { padding:40px 0 30px; text-align:center; border-bottom:1px solid rgba(201,168,76,0.15); }
        .page-title { font-family:'Playfair Display',serif; font-size:2.2rem; color:var(--gold); }
        .page-sub { color:rgba(255,255,255,0.45); font-size:0.8rem; letter-spacing:2.5px; text-transform:uppercase; margin-top:6px; }
        .result-wrap { background:var(--dark-card); border:1px solid rgba(201,168,76,0.18); border-radius:14px; overflow:hidden; margin:40px 0; }
        .result-header { padding:20px 26px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid rgba(201,168,76,0.15); }
        .result-title { font-family:'Playfair Display',serif; font-size:1.1rem; color:var(--gold); }
        .result-meta { color:rgba(255,255,255,0.4); font-size:0.78rem; }
        table { width:100%; border-collapse:collapse; }
        thead tr { background:rgba(201,168,76,0.08); }
        th { padding:13px 18px; color:rgba(255,255,255,0.5); font-size:0.75rem; letter-spacing:1.5px; text-transform:uppercase; font-weight:400; text-align:left; border-bottom:1px solid rgba(201,168,76,0.12); }
        td { padding:13px 18px; color:rgba(255,255,255,0.85); font-size:0.88rem; border-bottom:1px solid rgba(255,255,255,0.05); }
        tbody tr:hover { background:rgba(201,168,76,0.05); }
        tbody tr:last-child td { border-bottom:none; }
        .room-badge { background:rgba(201,168,76,0.12); color:var(--gold); border-radius:6px; padding:3px 10px; font-size:0.82rem; font-weight:600; }
        .count-bar-bg { background:rgba(255,255,255,0.07); border-radius:4px; height:8px; flex:1; }
        .count-bar { background:var(--gold); border-radius:4px; height:8px; }
        .revenue-box { text-align:center; padding:50px 20px; }
        .revenue-label { color:rgba(255,255,255,0.4); font-size:0.8rem; letter-spacing:2px; text-transform:uppercase; margin-bottom:12px; }
        .revenue-amount { font-family:'Playfair Display',serif; font-size:3.5rem; color:var(--gold); font-weight:700; }
        .revenue-range { color:rgba(255,255,255,0.35); font-size:0.82rem; margin-top:10px; }
        .empty-state { text-align:center; padding:50px 20px; color:rgba(255,255,255,0.3); }
        .btn-outline-back { background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; }
        .btn-outline-back:hover { border-color:var(--gold); color:var(--gold); }
        .btn-reports { background:rgba(201,168,76,0.12); color:var(--gold); border:1px solid rgba(201,168,76,0.3); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; margin-left:12px; }
        .btn-reports:hover { background:rgba(201,168,76,0.22); color:var(--gold); }
        footer { border-top:1px solid rgba(201,168,76,0.15); text-align:center; padding:20px; color:rgba(255,255,255,0.3); font-size:0.8rem; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><i class="fas fa-hotel me-2"></i>Hotel Management</a>
        <button class="navbar-toggler border-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto gap-1">
                <li class="nav-item"><a class="nav-link" href="AddReservation"><i class="fas fa-plus-circle me-1"></i>Add</a></li>
                <li class="nav-item"><a class="nav-link" href="UpdateReservation"><i class="fas fa-edit me-1"></i>Update</a></li>
                <li class="nav-item"><a class="nav-link" href="DeleteReservation"><i class="fas fa-trash-alt me-1"></i>Cancel</a></li>
                <li class="nav-item"><a class="nav-link" href="DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link active" href="WebContent/reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h1 class="page-title"><i class="fas fa-chart-line me-2"></i>Report Result</h1>
        <p class="page-sub">Generated Report Output</p>
    </div>
</div>

<div class="container">
    <%-- Error alert --%>
    <% String message = (String) request.getAttribute("message");
       String msgType  = (String) request.getAttribute("msgType");
       if (message != null && !message.isEmpty()) { %>
        <div class="alert alert-<%= msgType %> mt-4" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i><%= message %>
        </div>
    <% } %>

    <%
        String reportType = (String) request.getAttribute("reportType");
        if (reportType == null) reportType = "";
    %>

    <!-- ============================================================
         REPORT 1 – Reservations by Date Range
    ============================================================ -->
    <% if ("dateRange".equals(reportType)) {
           List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
           Object fromDate = request.getAttribute("fromDate");
           Object toDate   = request.getAttribute("toDate");
           int count = (reservations != null) ? reservations.size() : 0;
    %>
    <div class="result-wrap">
        <div class="result-header">
            <span class="result-title"><i class="fas fa-calendar-alt me-2"></i>Reservations: <%= fromDate %> → <%= toDate %></span>
            <span class="result-meta"><%= count %> record<%= count != 1 ? "s" : "" %> found</span>
        </div>
        <% if (reservations == null || reservations.isEmpty()) { %>
        <div class="empty-state"><i class="fas fa-search" style="font-size:2.5rem;color:rgba(201,168,76,0.2);display:block;margin-bottom:12px;"></i>No reservations found in this date range.</div>
        <% } else { %>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr><th>ID</th><th>Customer Name</th><th>Room</th><th>Check-In</th><th>Check-Out</th><th>Amount (₹)</th></tr>
                </thead>
                <tbody>
                    <% for (Reservation r : reservations) { %>
                    <tr>
                        <td style="color:var(--gold);font-weight:600;">#<%= r.getReservationID() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><span class="room-badge"><%= r.getRoomNumber() %></span></td>
                        <td><%= r.getCheckIn() %></td>
                        <td><%= r.getCheckOut() %></td>
                        <td>₹<%= String.format("%.2f", r.getTotalAmount()) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>
    </div>

    <!-- ============================================================
         REPORT 2 – Most Booked Rooms
    ============================================================ -->
    <% } else if ("mostBooked".equals(reportType)) {
           List<String[]> roomStats = (List<String[]>) request.getAttribute("roomStats");
           int maxCount = 1;
           if (roomStats != null && !roomStats.isEmpty()) {
               try { maxCount = Integer.parseInt(roomStats.get(0)[1]); } catch (Exception e) {}
           }
    %>
    <div class="result-wrap">
        <div class="result-header">
            <span class="result-title"><i class="fas fa-door-open me-2"></i>Room Booking Frequency</span>
            <span class="result-meta">All-time rankings</span>
        </div>
        <% if (roomStats == null || roomStats.isEmpty()) { %>
        <div class="empty-state"><i class="fas fa-door-closed" style="font-size:2.5rem;color:rgba(201,168,76,0.2);display:block;margin-bottom:12px;"></i>No room data available.</div>
        <% } else { %>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr><th>#</th><th>Room Number</th><th>Booking Count</th><th>Frequency</th></tr>
                </thead>
                <tbody>
                    <% int rank = 1;
                       for (String[] row : roomStats) {
                           int cnt = 0;
                           try { cnt = Integer.parseInt(row[1]); } catch (Exception e) {}
                           int pct = (maxCount > 0) ? (cnt * 100 / maxCount) : 0;
                    %>
                    <tr>
                        <td style="color:rgba(255,255,255,0.4);"><%= rank++ %></td>
                        <td><span class="room-badge"><%= row[0] %></span></td>
                        <td style="color:var(--gold);font-weight:600;"><%= cnt %> booking<%= cnt != 1 ? "s" : "" %></td>
                        <td style="min-width:160px;">
                            <div style="display:flex;align-items:center;gap:10px;">
                                <div class="count-bar-bg"><div class="count-bar" style="width:<%= pct %>%;"></div></div>
                                <span style="font-size:0.78rem;color:rgba(255,255,255,0.4);"><%= pct %>%</span>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>
    </div>

    <!-- ============================================================
         REPORT 3 – Total Revenue
    ============================================================ -->
    <% } else if ("revenue".equals(reportType)) {
           Object revenue  = request.getAttribute("totalRevenue");
           Object fromDate = request.getAttribute("fromDate");
           Object toDate   = request.getAttribute("toDate");
           double rev = (revenue != null) ? (Double) revenue : 0.0;
    %>
    <div class="result-wrap">
        <div class="result-header">
            <span class="result-title"><i class="fas fa-rupee-sign me-2"></i>Revenue Report</span>
            <span class="result-meta"><%= fromDate %> → <%= toDate %></span>
        </div>
        <div class="revenue-box">
            <div class="revenue-label">Total Revenue Generated</div>
            <div class="revenue-amount">₹<%= String.format("%,.2f", rev) %></div>
            <div class="revenue-range">Period: <%= fromDate %> to <%= toDate %></div>
        </div>
    </div>
    <% } %>

    <div class="text-center pb-5">
        <a href="/reports.jsp" class="btn-reports"><i class="fas fa-chart-bar me-1"></i>Back to Reports</a>
        <a href="index.jsp" class="btn-outline-back ms-2"><i class="fas fa-home me-1"></i>Home</a>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
