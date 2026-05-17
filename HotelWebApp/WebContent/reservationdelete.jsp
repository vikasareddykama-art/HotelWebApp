<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Reservation – Hotel Management</title>
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
        .page-title { font-family:'Playfair Display',serif; font-size:2.2rem; color:#e74c3c; }
        .page-sub { color:rgba(255,255,255,0.45); font-size:0.8rem; letter-spacing:2.5px; text-transform:uppercase; margin-top:6px; }
        .form-card { background:var(--dark-card); border:1px solid rgba(201,168,76,0.18); border-radius:14px; padding:40px; max-width:620px; margin:40px auto; }
        .search-card { background:rgba(201,168,76,0.06); border:1px solid rgba(201,168,76,0.2); border-radius:10px; padding:22px; margin-bottom:28px; }
        .form-label { color:rgba(255,255,255,0.75); font-size:0.85rem; margin-bottom:6px; }
        .form-control { background:rgba(255,255,255,0.05); border:1px solid rgba(201,168,76,0.25); color:#fff; border-radius:8px; padding:10px 14px; }
        .form-control:focus { background:rgba(201,168,76,0.07); border-color:var(--gold); color:#fff; box-shadow:0 0 0 3px rgba(201,168,76,0.15); }
        .form-control::placeholder { color:rgba(255,255,255,0.25); }
        .form-control:disabled { opacity:0.6; }
        .btn-danger-del { background:linear-gradient(135deg,#e74c3c,#c0392b); color:#fff; font-weight:700; border:none; border-radius:8px; padding:12px 32px; width:100%; font-size:0.95rem; transition:opacity 0.2s; }
        .btn-danger-del:hover { opacity:0.88; color:#fff; }
        .btn-search { background:rgba(201,168,76,0.15); color:var(--gold); border:1px solid rgba(201,168,76,0.4); border-radius:8px; padding:10px 22px; font-size:0.88rem; }
        .btn-search:hover { background:rgba(201,168,76,0.25); color:var(--gold); }
        .btn-outline-back { background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; display:inline-block; }
        .btn-outline-back:hover { border-color:var(--gold); color:var(--gold); }
        .info-row { display:flex; justify-content:space-between; padding:10px 0; border-bottom:1px solid rgba(255,255,255,0.06); }
        .info-label { color:rgba(255,255,255,0.45); font-size:0.82rem; }
        .info-value { color:#fff; font-size:0.88rem; }
        .warn-box { background:rgba(231,76,60,0.1); border:1px solid rgba(231,76,60,0.35); border-radius:8px; padding:16px; margin:20px 0; }
        .section-divider { border-color:rgba(201,168,76,0.15); margin:24px 0; }
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
                <li class="nav-item"><a class="nav-link active" href="DeleteReservation"><i class="fas fa-trash-alt me-1"></i>Cancel</a></li>
                <li class="nav-item"><a class="nav-link" href="DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link" href="reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h1 class="page-title"><i class="fas fa-calendar-times me-2"></i>Cancel Reservation</h1>
        <p class="page-sub">Permanently remove a booking</p>
    </div>
</div>

<div class="container">
    <div class="form-card">

        <%-- Alert --%>
        <% String message = (String) request.getAttribute("message");
           String msgType  = (String) request.getAttribute("msgType");
           if (message != null && !message.isEmpty()) { %>
            <div class="alert alert-<%= msgType %> alert-dismissible fade show mb-4" role="alert">
                <i class="fas fa-<%= "success".equals(msgType) ? "check-circle" : "exclamation-circle" %> me-2"></i>
                <%= message %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <%-- Search --%>
        <div class="search-card">
            <p class="mb-2" style="color:rgba(255,255,255,0.6);font-size:0.85rem;">Enter Reservation ID to look up and cancel:</p>
            <form action="DeleteReservation" method="get" class="d-flex gap-2">
                <input type="number" class="form-control" name="reservationID" placeholder="Reservation ID" required min="1">
                <button type="submit" class="btn btn-search"><i class="fas fa-search me-1"></i>Fetch</button>
            </form>
        </div>

        <%-- Confirm deletion --%>
        <%
            Reservation r = (Reservation) request.getAttribute("reservation");
        %>
        <% if (r != null) { %>
        <div>
            <p style="color:rgba(255,255,255,0.55);font-size:0.85rem;margin-bottom:14px;">Reservation details:</p>
            <div class="info-row"><span class="info-label">Reservation ID</span><span class="info-value">#<%= r.getReservationID() %></span></div>
            <div class="info-row"><span class="info-label">Customer Name</span><span class="info-value"><%= r.getCustomerName() %></span></div>
            <div class="info-row"><span class="info-label">Room Number</span><span class="info-value"><%= r.getRoomNumber() %></span></div>
            <div class="info-row"><span class="info-label">Check-In</span><span class="info-value"><%= r.getCheckIn() %></span></div>
            <div class="info-row"><span class="info-label">Check-Out</span><span class="info-value"><%= r.getCheckOut() %></span></div>
            <div class="info-row"><span class="info-label">Total Amount</span><span class="info-value">₹<%= String.format("%.2f", r.getTotalAmount()) %></span></div>

            <div class="warn-box">
                <i class="fas fa-exclamation-triangle me-2" style="color:#e74c3c;"></i>
                <span style="color:rgba(255,255,255,0.75);font-size:0.85rem;">
                    This action is <strong>irreversible</strong>. The reservation will be permanently removed.
                </span>
            </div>

            <form action="DeleteReservation" method="post">
                <input type="hidden" name="reservationID" value="<%= r.getReservationID() %>">
                <hr class="section-divider">
                <button type="submit" class="btn btn-danger-del mb-3">
                    <i class="fas fa-trash-alt me-2"></i>Confirm Cancellation
                </button>
            </form>
        </div>
        <% } %>

        <div class="text-center mt-2">
            <a href="index.jsp" class="btn-outline-back"><i class="fas fa-arrow-left me-1"></i>Back to Home</a>
        </div>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
