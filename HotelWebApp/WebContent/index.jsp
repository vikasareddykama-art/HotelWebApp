<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --navy: #0d1b2a;
            --gold: #c9a84c;
            --gold-light: #e8c97a;
            --cream: #f9f5ee;
            --dark-card: #162032;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Lato', sans-serif;
            background: var(--navy);
            color: #fff;
            min-height: 100vh;
        }
        .navbar {
            background: rgba(13,27,42,0.97);
            border-bottom: 1px solid rgba(201,168,76,0.3);
            padding: 14px 0;
        }
        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            color: var(--gold) !important;
            letter-spacing: 1px;
        }
        .nav-link {
            color: rgba(255,255,255,0.8) !important;
            font-size: 0.88rem;
            letter-spacing: 0.5px;
            transition: color 0.2s;
        }
        .nav-link:hover { color: var(--gold) !important; }
        .hero {
            background: linear-gradient(135deg, #0d1b2a 0%, #1a2f46 60%, #0d1b2a 100%);
            padding: 80px 0 60px;
            text-align: center;
            border-bottom: 1px solid rgba(201,168,76,0.2);
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(ellipse at center, rgba(201,168,76,0.06) 0%, transparent 60%);
            pointer-events: none;
        }
        .hero-title {
            font-family: 'Playfair Display', serif;
            font-size: 3.2rem;
            font-weight: 700;
            color: var(--gold);
            text-shadow: 0 2px 20px rgba(201,168,76,0.3);
            margin-bottom: 10px;
        }
        .hero-sub {
            color: rgba(255,255,255,0.6);
            font-size: 1rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 18px;
        }
        .hero-divider {
            width: 80px;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent);
            margin: 0 auto 16px;
        }
        .hero-desc {
            color: rgba(255,255,255,0.7);
            font-size: 1rem;
            max-width: 520px;
            margin: 0 auto;
            line-height: 1.7;
        }
        .section-label {
            font-family: 'Playfair Display', serif;
            font-size: 1.6rem;
            color: var(--gold);
            margin-bottom: 6px;
        }
        .section-sub {
            color: rgba(255,255,255,0.45);
            font-size: 0.82rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 30px;
        }
        .card-module {
            background: var(--dark-card);
            border: 1px solid rgba(201,168,76,0.18);
            border-radius: 12px;
            padding: 32px 24px;
            text-align: center;
            transition: transform 0.25s, border-color 0.25s, box-shadow 0.25s;
            text-decoration: none;
            display: block;
            height: 100%;
        }
        .card-module:hover {
            transform: translateY(-5px);
            border-color: var(--gold);
            box-shadow: 0 12px 40px rgba(201,168,76,0.15);
        }
        .card-icon {
            width: 64px;
            height: 64px;
            background: rgba(201,168,76,0.1);
            border: 1px solid rgba(201,168,76,0.3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 18px;
            font-size: 1.6rem;
            color: var(--gold);
        }
        .card-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.15rem;
            color: #fff;
            margin-bottom: 8px;
        }
        .card-desc {
            color: rgba(255,255,255,0.5);
            font-size: 0.85rem;
            line-height: 1.6;
        }
        .stat-box {
            background: var(--dark-card);
            border: 1px solid rgba(201,168,76,0.15);
            border-radius: 10px;
            padding: 22px 20px;
            text-align: center;
        }
        .stat-num {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            color: var(--gold);
        }
        .stat-label {
            color: rgba(255,255,255,0.5);
            font-size: 0.78rem;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-top: 4px;
        }
        footer {
            border-top: 1px solid rgba(201,168,76,0.15);
            text-align: center;
            padding: 22px;
            color: rgba(255,255,255,0.3);
            font-size: 0.8rem;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-hotel me-2"></i>Hotel Management
        </a>
        <button class="navbar-toggler border-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto gap-1">
                <li class="nav-item"><a class="nav-link" href="AddReservation"><i class="fas fa-plus-circle me-1"></i>Add</a></li>
                <li class="nav-item"><a class="nav-link" href="UpdateReservation"><i class="fas fa-edit me-1"></i>Update</a></li>
                <li class="nav-item"><a class="nav-link" href="DeleteReservation"><i class="fas fa-trash-alt me-1"></i>Cancel</a></li>
                <li class="nav-item"><a class="nav-link" href="DisplayReservations"><i class="fas fa-list me-1"></i>View All</a></li>
                <li class="nav-item"><a class="nav-link" href="WebContent/reports.jsp"><i class="fas fa-chart-bar me-1"></i>Reports</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero">
    <div class="container">
        <div class="hero-sub">Welcome to</div>
        <h1 class="hero-title">Hotel Management System</h1>
        <div class="hero-divider"></div>
        <p class="hero-desc">Manage reservations, track room occupancy, and generate insightful reports — all from one unified platform.</p>
    </div>
</div>

<div class="container py-5">
    <!-- Modules -->
    <div class="text-center mb-4">
        <h2 class="section-label">Modules</h2>
        <p class="section-sub">Core Operations</p>
    </div>
    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <a href="AddReservation" class="card-module">
                <div class="card-icon"><i class="fas fa-calendar-plus"></i></div>
                <div class="card-title">Add Reservation</div>
                <div class="card-desc">Book new guests and assign room numbers with check-in and check-out dates.</div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="UpdateReservation" class="card-module">
                <div class="card-icon"><i class="fas fa-calendar-check"></i></div>
                <div class="card-title">Update Reservation</div>
                <div class="card-desc">Modify existing booking details such as dates, room, or billing amount.</div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="DeleteReservation" class="card-module">
                <div class="card-icon"><i class="fas fa-calendar-times"></i></div>
                <div class="card-title">Cancel Reservation</div>
                <div class="card-desc">Cancel and remove a reservation from the system by Reservation ID.</div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="DisplayReservations" class="card-module">
                <div class="card-icon"><i class="fas fa-th-list"></i></div>
                <div class="card-title">View Reservations</div>
                <div class="card-desc">Browse the full list of all current and past reservations in the hotel.</div>
            </a>
        </div>
    </div>

    <!-- Reports -->
    <div class="text-center mb-4">
        <h2 class="section-label">Reports</h2>
        <p class="section-sub">Analytics & Insights</p>
    </div>
    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <a href="ReportCriteria?reportType=dateRange" class="card-module">
                <div class="card-icon"><i class="fas fa-calendar-alt"></i></div>
                <div class="card-title">Reservations by Date Range</div>
                <div class="card-desc">List all reservations falling within a specified check-in to check-out window.</div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="ReportCriteria?reportType=mostBooked" class="card-module">
                <div class="card-icon"><i class="fas fa-door-open"></i></div>
                <div class="card-title">Most Booked Rooms</div>
                <div class="card-desc">Identify which rooms are booked most frequently for better resource planning.</div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="ReportCriteria?reportType=revenue" class="card-module">
                <div class="card-icon"><i class="fas fa-rupee-sign"></i></div>
                <div class="card-title">Revenue Report</div>
                <div class="card-desc">Calculate total revenue generated over any chosen time period.</div>
            </a>
        </div>
    </div>
</div>

<footer>
    &copy; 2024 Hotel Management System &nbsp;|&nbsp; All Rights Reserved
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
