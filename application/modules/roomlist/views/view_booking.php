<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kaya Hotel :: View Booking</title>
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/custom.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/style.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/sidebar.css">
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Header -->
        <header class="main-header">
            <a href="http://127.0.0.1/hotel/dashboard/home" class="logo">
                <span class="logo-lg">
                    <img src="http://127.0.0.1/hotel/assets/img/icons/2024-12-02/l.jpg" alt="">
                </span>
            </a>
            <nav class="navbar navbar-static-top">
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="pe-7s-keypad"></span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li><a id="fullscreen" href="#" class="getid1"><i class="pe-7s-expand1"></i></a></li>
                        <li class="dropdown messages-menu">
                            <a href="http://127.0.0.1/hotel/reservation/reservation" class="dropdown-toggle">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-success reservenotif">0</span>
                            </a>
                        </li>
                        <li class="dropdown dropdown-user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="pe-7s-settings"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="http://127.0.0.1/hotel/dashboard/home/profile"><i class="pe-7s-users"></i> Profile</a></li>
                                <li><a href="http://127.0.0.1/hotel/dashboard/home/setting"><i class="pe-7s-settings"></i> Setting</a></li>
                                <li><a href="http://127.0.0.1/hotel/logout"><i class="pe-7s-key"></i> Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Sidebar -->
        <aside class="main-sidebar">
            <div class="sidebar">
                <ul class="sidebar-menu">
                    <li class="treeview">
                        <a href="http://127.0.0.1/hotel/dashboard/home"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="header-icon"><i class="pe-7s-note2"></i></div>
                <div class="header-title">
                    <h1>Booking Details</h1>
                    <small>View Booking Information</small>
                </div>
            </section>

            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="panel panel-bd lobidrag">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4>Booking Information</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Client Name</th>
                                                <th>Phone Number</th>
                                                <th>ID Number</th>
                                                <th>Check-In Date</th>
                                                <th>Check-Out Date</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><?php echo htmlspecialchars($booking->customer_name); ?></td>
                                                <td><?php echo htmlspecialchars($booking->phone_number); ?></td>
                                                <td><?php echo htmlspecialchars($booking->id_number); ?></td>
                                                <td>
                                                    <span class="badge rounded-pill bg-secondary text-dark">
                                                        <?php echo date('d/m/Y', strtotime($booking->check_in)); ?>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge bg-info">
                                                        <?php echo date('d/m/Y', strtotime($booking->check_out)); ?>
                                                    </span>
                                                </td>
                                                <td>
                                                    <?php 
                                                    if ($booking->payment_status == '1') {
                                                        echo '<span class="badge badge-success">Paid</span>';
                                                    } else {
                                                        echo '<span class="badge badge-warning">Pending</span>';
                                                    }
                                                    ?>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="card mt-2"> <!-- Changed from mt-4 to mt-2 to reduce spacing -->
                                    <div class="card-header">
                                        <h4>Additional Booking Details</h4>
                                    </div>
                                    <div class="card-body">
                                        <p><strong>Total Nights:</strong> <?php echo htmlspecialchars($booking->total_nights); ?></p>
                                        <p><strong>Number of Rooms:</strong> <?php echo htmlspecialchars($booking->number_of_rooms); ?></p>
                                        <p><strong>Room Type:</strong> <?php echo htmlspecialchars($booking->room_type_id); ?></p>
                                        <p><strong>Actual Price:</strong> KES <?php echo number_format($booking->actual_price, 2); ?></p>
                                        <p><strong>Subtotal:</strong> KES <?php echo number_format($booking->subtotal, 2); ?></p>
                                        <p><strong>Total Price:</strong> KES <?php echo number_format($booking->total_price, 2); ?></p>
                                        <p><strong>Payment Method:</strong> <?php echo htmlspecialchars($booking->payment_method); ?></p>
                                        <p><strong>Transaction ID:</strong> <?php echo htmlspecialchars($booking->transcation_id); ?></p>
                                        <p><strong>Booking Date:</strong> <?php echo htmlspecialchars($booking->booking_date); ?></p>
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                Kaya Road
            </div>
            <strong>Kaya Hotel You belong Here 2024</strong>
            <a href="http://127.0.0.1/hotel/dashboard/user/form">Kaya Hotel</a>
        </footer>
    </div>

    <!-- Include JS files -->
    <script src="http://127.0.0.1/hotel/assets/js/jquery-1.12.4.min.js"></script>
    <script src="http://127.0.0.1/hotel/assets/js/bootstrap.min.js"></script>
    <script src="http://127.0.0.1/hotel/assets/js/toastr.min.js"></script>
</body>
</html>
