<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports – Hotel Management</title>
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
        .page-header { padding:50px 0 36px; text-align:center; border-bottom:1px solid rgba(201,168,76,0.15); }
        .page-title { font-family:'Playfair Display',serif; font-size:2.4rem; color:var(--gold); }
        .page-sub { color:rgba(255,255,255,0.4); font-size:0.8rem; letter-spacing:3px; text-transform:uppercase; margin-top:8px; }
        .report-card {
            background:var(--dark-card);
            border:1px solid rgba(201,168,76,0.18);
            border-radius:14px;
            padding:36px 28px;
            text-align:center;
            height:100%;
            text-decoration:none;
            display:block;
            transition:transform 0.25s, border-color 0.25s, box-shadow 0.25s;
        }
        .report-card:hover { transform:translateY(-6px); border-color:var(--gold); box-shadow:0 16px 50px rgba(201,168,76,0.15); }
        .report-icon {
            width:72px; height:72px;
            background:rgba(201,168,76,0.08);
            border:1px solid rgba(201,168,76,0.25);
            border-radius:50%;
            display:flex; align-items:center; justify-content:center;
            margin:0 auto 20px;
            font-size:1.8rem;
            color:var(--gold);
        }
        .report-title { font-family:'Playfair Display',serif; font-size:1.2rem; color:#fff; margin-bottom:10px; }
        .report-desc { color:rgba(255,255,255,0.45); font-size:0.85rem; line-height:1.65; margin-bottom:20px; }
        .report-btn {
            display:inline-block;
            background:rgba(201,168,76,0.12);
            color:var(--gold);
            border:1px solid rgba(201,168,76,0.3);
            border-radius:8px;
            padding:8px 24px;
            font-size:0.82rem;
            letter-spacing:0.5px;
        }
        .btn-outline-back { background:transparent; color:rgba(255,255,255,0.6); border:1px solid rgba(255,255,255,0.2); border-radius:8px; padding:10px 24px; font-size:0.88rem; text-decoration:none; }
        .btn-outline-back:hover { border-color:var(--gold); color:var(--gold); }
        footer { border-top:1px solid rgba(201,168,76,0.15); text-align:center; padding:20px; color:rgba(255,255,255,0.3); font-size:0.8rem; margin-top:60px; }
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
                <li class="nav-item"><a class="nav-link" href="../AddReservation"><i class="fas fa-plus-circle me-1"></i>Add</a></li>
                <li class="nav-item"><a class="nav-link" href="../UpdateReservation"><i class="fas fa-edit me-1"></i>Update</a></li>
                <li class="nav-item"><a class="nav-link" href="../DeleteReservation"><i class="fas fa-trash-alt me-1"></i>Cancel</a></li>
                <li class="nav-item"><a class="nav-link" href="../DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link active" href="reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <div class="container">
        <h1 class="page-title"><i class="fas fa-chart-bar me-2"></i>Reports</h1>
        <p class="page-sub">Analytics &amp; Business Insights</p>
    </div>
</div>

<div class="container py-5">
    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <a href="../ReportCriteria?reportType=dateRange" class="report-card">
                <div class="report-icon"><i class="fas fa-calendar-alt"></i></div>
                <div class="report-title">Reservations by Date Range</div>
                <div class="report-desc">View all reservations that fall within a chosen check-in to check-out date window.</div>
                <span class="report-btn"><i class="fas fa-arrow-right me-1"></i>Generate Report</span>
            </a>
        </div>
        <div class="col-md-4">
            <a href="../ReportCriteria?reportType=mostBooked" class="report-card">
                <div class="report-icon"><i class="fas fa-door-open"></i></div>
                <div class="report-title">Most Frequently Booked Rooms</div>
                <div class="report-desc">Identify high-demand rooms to optimise pricing strategies and resource planning.</div>
                <span class="report-btn"><i class="fas fa-arrow-right me-1"></i>Generate Report</span>
            </a>
        </div>
        <div class="col-md-4">
            <a href="../ReportCriteria?reportType=revenue" class="report-card">
                <div class="report-icon"><i class="fas fa-rupee-sign"></i></div>
                <div class="report-title">Total Revenue Report</div>
                <div class="report-desc">Calculate total revenue generated over any specified time period for financial analysis.</div>
                <span class="report-btn"><i class="fas fa-arrow-right me-1"></i>Generate Report</span>
            </a>
        </div>
    </div>

    <div class="text-center mt-5">
        <a href="index.jsp" class="btn-outline-back"><i class="fas fa-arrow-left me-1"></i>Back to Home</a>
    </div>
</div>

<footer>&copy; 2024 Hotel Management System</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
