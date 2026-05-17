<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Reservations – Hotel Management</title>
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
        .table-wrap { background:var(--dark-card); border:1px solid rgba(201,168,76,0.18); border-radius:14px; overflow:hidden; margin:40px 0; }
        .table-header { padding:20px 24px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid rgba(201,168,76,0.15); }
        .table-title { font-family:'Playfair Display',serif; font-size:1.1rem; color:var(--gold); }
        .badge-count { background:rgba(201,168,76,0.15); color:var(--gold); border:1px solid rgba(201,168,76,0.3); border-radius:20px; padding:4px 14px; font-size:0.78rem; }
        table { width:100%; border-collapse:collapse; }
        thead tr { background:rgba(201,168,76,0.08); }
        th { padding:14px 18px; color:rgba(255,255,255,0.5); font-size:0.75rem; letter-spacing:1.5px; text-transform:uppercase; font-weight:400; text-align:left; border-bottom:1px solid rgba(201,168,76,0.12); }
        td { padding:14px 18px; color:rgba(255,255,255,0.85); font-size:0.88rem; border-bottom:1px solid rgba(255,255,255,0.05); }
        tbody tr:hover { background:rgba(201,168,76,0.05); }
        tbody tr:last-child td { border-bottom:none; }
        .room-badge { background:rgba(201,168,76,0.12); color:var(--gold); border-radius:6px; padding:3px 10px; font-size:0.82rem; font-weight:600; }
        .action-btn { border-radius:6px; padding:5px 12px; font-size:0.78rem; text-decoration:none; display:inline-block; }
        .btn-edit { background:rgba(52,152,219,0.15); color:#5dade2; border:1px solid rgba(52,152,219,0.3); }
        .btn-edit:hover { background:rgba(52,152,219,0.25); color:#5dade2; }
        .btn-del { background:rgba(231,76,60,0.12); color:#e74c3c; border:1px solid rgba(231,76,60,0.25); margin-left:6px; }
        .btn-del:hover { background:rgba(231,76,60,0.22); color:#e74c3c; }
        .empty-state { text-align:center; padding:60px 20px; color:rgba(255,255,255,0.3); }
        .empty-icon { font-size:3rem; margin-bottom:14px; color:rgba(201,168,76,0.2); }
        .btn-outline-back { background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; }
        .btn-outline-back:hover { border-color:var(--gold); color:var(--gold); }
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
                <li class="nav-item"><a class="nav-link active" href="DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link" href="reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h1 class="page-title"><i class="fas fa-th-list me-2"></i>All Reservations</h1>
        <p class="page-sub">Current Occupancy Overview</p>
    </div>
</div>

<div class="container">
    <%-- Alert --%>
    <% String message = (String) request.getAttribute("message");
       String msgType  = (String) request.getAttribute("msgType");
       if (message != null && !message.isEmpty()) { %>
        <div class="alert alert-<%= msgType %> alert-dismissible fade show mt-4" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <%
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        int count = (reservations != null) ? reservations.size() : 0;
    %>
    <div class="table-wrap">
        <div class="table-header">
            <span class="table-title"><i class="fas fa-table me-2"></i>Reservation Records</span>
            <span class="badge-count"><%= count %> record<%= count != 1 ? "s" : "" %></span>
        </div>

        <% if (reservations == null || reservations.isEmpty()) { %>
        <div class="empty-state">
            <div class="empty-icon"><i class="fas fa-calendar-times"></i></div>
            <p>No reservations found in the system.</p>
            <a href="AddReservation" style="color:var(--gold);font-size:0.88rem;">+ Add your first reservation</a>
        </div>
        <% } else { %>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Room</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Amount (₹)</th>
                        <th>Actions</th>
                    </tr>
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
                        <td>
                            <a href="UpdateReservation?reservationID=<%= r.getReservationID() %>" class="action-btn btn-edit">
                                <i class="fas fa-edit me-1"></i>Edit
                            </a>
                            <a href="DeleteReservation?reservationID=<%= r.getReservationID() %>" class="action-btn btn-del">
                                <i class="fas fa-trash me-1"></i>Cancel
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>
    </div>

    <div class="text-center pb-4">
        <a href="index.jsp" class="btn-outline-back"><i class="fas fa-arrow-left me-1"></i>Back to Home</a>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
