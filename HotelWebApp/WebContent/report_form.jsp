<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Criteria – Hotel Management</title>
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
        .form-card { background:var(--dark-card); border:1px solid rgba(201,168,76,0.18); border-radius:14px; padding:40px; max-width:540px; margin:40px auto; }
        .report-type-info { background:rgba(201,168,76,0.07); border:1px solid rgba(201,168,76,0.2); border-radius:10px; padding:18px 20px; margin-bottom:26px; display:flex; align-items:center; gap:14px; }
        .report-type-icon { color:var(--gold); font-size:1.6rem; }
        .report-type-name { font-family:'Playfair Display',serif; font-size:1rem; color:var(--gold); }
        .report-type-desc { color:rgba(255,255,255,0.45); font-size:0.8rem; margin-top:2px; }
        .form-label { color:rgba(255,255,255,0.75); font-size:0.85rem; margin-bottom:6px; }
        .form-control { background:rgba(255,255,255,0.05); border:1px solid rgba(201,168,76,0.25); color:#fff; border-radius:8px; padding:10px 14px; }
        .form-control:focus { background:rgba(201,168,76,0.07); border-color:var(--gold); color:#fff; box-shadow:0 0 0 3px rgba(201,168,76,0.15); }
        input[type="date"]::-webkit-calendar-picker-indicator { filter:invert(0.7); }
        .btn-gold { background:linear-gradient(135deg,var(--gold),#b8902a); color:var(--navy); font-weight:700; border:none; border-radius:8px; padding:12px 32px; width:100%; font-size:0.95rem; transition:opacity 0.2s; }
        .btn-gold:hover { opacity:0.88; color:var(--navy); }
        .btn-outline-back { background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; display:inline-block; }
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
        <h1 class="page-title"><i class="fas fa-sliders-h me-2"></i>Report Criteria</h1>
        <p class="page-sub">Configure Report Parameters</p>
    </div>
</div>

<div class="container">
    <div class="form-card">
        <%
            String reportType = (String) request.getAttribute("reportType");
            if (reportType == null) reportType = "";
            String iconClass = "fas fa-chart-bar";
            String reportName = "Select Report";
            String reportDesc = "";
            boolean needsDates = true;

            if ("dateRange".equals(reportType)) {
                iconClass  = "fas fa-calendar-alt";
                reportName = "Reservations by Date Range";
                reportDesc = "Enter a from-date and to-date to filter reservations.";
            } else if ("mostBooked".equals(reportType)) {
                iconClass  = "fas fa-door-open";
                reportName = "Most Frequently Booked Rooms";
                reportDesc = "No date filter required — shows all-time booking frequency.";
                needsDates = false;
            } else if ("revenue".equals(reportType)) {
                iconClass  = "fas fa-rupee-sign";
                reportName = "Total Revenue Report";
                reportDesc = "Enter a date range to calculate total revenue earned.";
            }
        %>

        <%-- Report type info bar --%>
        <div class="report-type-info">
            <div class="report-type-icon"><i class="<%= iconClass %>"></i></div>
            <div>
                <div class="report-type-name"><%= reportName %></div>
                <div class="report-type-desc"><%= reportDesc %></div>
            </div>
        </div>

        <form action="Report" method="post">
            <input type="hidden" name="reportType" value="<%= reportType %>">

            <% if (needsDates) { %>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">From Date <span class="text-warning">*</span></label>
                    <input type="date" class="form-control" name="fromDate" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">To Date <span class="text-warning">*</span></label>
                    <input type="date" class="form-control" name="toDate" required>
                </div>
            </div>
            <% } else { %>
            <div class="text-center py-3" style="color:rgba(255,255,255,0.45);font-size:0.88rem;">
                <i class="fas fa-info-circle me-1" style="color:var(--gold);"></i>
                No additional criteria needed. Click below to generate.
            </div>
            <% } %>

            <hr class="section-divider">
            <button type="submit" class="btn-gold mb-3">
                <i class="fas fa-chart-line me-2"></i>Generate Report
            </button>
        </form>

        <div class="text-center">
            <a href="reports.jsp" class="btn-outline-back"><i class="fas fa-arrow-left me-1"></i>Back to Reports</a>
        </div>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
