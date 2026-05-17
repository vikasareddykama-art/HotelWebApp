<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation – Hotel Management</title>
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
        .form-card { background:var(--dark-card); border:1px solid rgba(201,168,76,0.18); border-radius:14px; padding:40px; max-width:620px; margin:40px auto; }
        .form-label { color:rgba(255,255,255,0.75); font-size:0.85rem; letter-spacing:0.5px; margin-bottom:6px; }
        .form-control {
            background:rgba(255,255,255,0.05); border:1px solid rgba(201,168,76,0.25);
            color:#fff; border-radius:8px; padding:10px 14px;
        }
        .form-control:focus { background:rgba(201,168,76,0.07); border-color:var(--gold); color:#fff; box-shadow:0 0 0 3px rgba(201,168,76,0.15); }
        .form-control::placeholder { color:rgba(255,255,255,0.25); }
        input[type="date"]::-webkit-calendar-picker-indicator { filter:invert(0.7); }
        .btn-gold {
            background:linear-gradient(135deg,var(--gold),#b8902a);
            color:var(--navy); font-weight:700; border:none; border-radius:8px;
            padding:12px 32px; letter-spacing:0.5px; width:100%; font-size:0.95rem;
            transition:opacity 0.2s, transform 0.2s;
        }
        .btn-gold:hover { opacity:0.88; transform:translateY(-1px); color:var(--navy); }
        .btn-outline-back {
            background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2);
            border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none;
            display:inline-block; transition:border-color 0.2s,color 0.2s;
        }
        .btn-outline-back:hover { border-color:var(--gold); color:var(--gold); }
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
                <li class="nav-item"><a class="nav-link active" href="AddReservation"><i class="fas fa-plus-circle me-1"></i>Add</a></li>
                <li class="nav-item"><a class="nav-link" href="UpdateReservation"><i class="fas fa-edit me-1"></i>Update</a></li>
                <li class="nav-item"><a class="nav-link" href="DeleteReservation"><i class="fas fa-trash-alt me-1"></i>Cancel</a></li>
                <li class="nav-item"><a class="nav-link" href="DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link" href="reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h1 class="page-title"><i class="fas fa-calendar-plus me-2"></i>Add Reservation</h1>
        <p class="page-sub">Book a new guest reservation</p>
    </div>
</div>

<div class="container">
    <div class="form-card">

        <%-- Alert message --%>
        <% String message = (String) request.getAttribute("message");
           String msgType  = (String) request.getAttribute("msgType");
           if (message != null && !message.isEmpty()) { %>
            <div class="alert alert-<%= msgType %> alert-dismissible fade show mb-4" role="alert">
                <i class="fas fa-<%= "success".equals(msgType) ? "check-circle" : "exclamation-circle" %> me-2"></i>
                <%= message %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <form action="AddReservation" method="post">
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label">Reservation ID <span class="text-warning">*</span></label>
                    <input type="number" class="form-control" name="reservationID" placeholder="e.g. 1001" required min="1">
                </div>
                <div class="col-12">
                    <label class="form-label">Customer Name <span class="text-warning">*</span></label>
                    <input type="text" class="form-control" name="customerName" placeholder="Full name of guest" required maxlength="100">
                </div>
                <div class="col-12">
                    <label class="form-label">Room Number <span class="text-warning">*</span></label>
                    <input type="text" class="form-control" name="roomNumber" placeholder="e.g. 101, 202A" required maxlength="10">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Check-In Date <span class="text-warning">*</span></label>
                    <input type="date" class="form-control" name="checkIn" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Check-Out Date <span class="text-warning">*</span></label>
                    <input type="date" class="form-control" name="checkOut" required>
                </div>
                <div class="col-12">
                    <label class="form-label">Total Amount (₹) <span class="text-warning">*</span></label>
                    <input type="number" class="form-control" name="totalAmount" placeholder="e.g. 5000.00" step="0.01" required min="0">
                </div>
            </div>

            <hr class="section-divider">

            <button type="submit" class="btn-gold mb-3">
                <i class="fas fa-plus-circle me-2"></i>Add Reservation
            </button>
            <div class="text-center">
                <a href="index.jsp" class="btn-outline-back"><i class="fas fa-arrow-left me-1"></i>Back to Home</a>
            </div>
        </form>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
