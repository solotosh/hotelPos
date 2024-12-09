<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kaya Hotel :: Booking List</title>
    <!-- Include CSS files -->
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/custom.min.css">
    <!-- Additional CSS files -->
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        .btn-link {
            color: #007bff; /* Customize the link color */
        }

        .btn-link:hover {
            text-decoration: underline; /* Underline on hover */
        }

        .badge-primary {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px; /* Increase padding for more space */
            font-size: 12px; /* Increase font size */
        }

        .badge-primary:hover {
            background-color: #0056b3;
        }
    </style>


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
                        <a href="http://127.0.0.1/hotel/dashboard/home"><i class="ti-home"></i> <span>Dashboard</span></a>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="header-icon"><i class="pe-7s-note2"></i></div>
                <div class="header-title">
                    <h1>Bookings</h1>
                    <a href="<?php echo site_url('roombooking/add_booking'); ?>" class="btn btn-success mb-3">Add Booking</a>
                    <a href="<?php echo site_url('roomlist/roomlist'); ?>" class="btn btn-success mb-3">View RoomList</a>
                    <small>Manage Bookings</small>
                </div>
            </section>

            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="panel panel-bd lobidrag">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4>All Bookings</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <?php if (!empty($bookings)): ?>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id No</th>
                                                  
                                                    <th>Client Name</th>
                                                    <th>Phone</th>
                                                   
                                                    <th>Room Type</th>
                                                    <th>Check In/Out</th>
                                                    <th>Total Room</th>
                                                    <th>Total Nights</th>
                                                    <!-- <th>Guest</th>
                                                    <th>Payment Type</th> -->
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($bookings as $booking): ?>
                                                    <tr>
                                                    <td>
    <a href="<?php echo site_url('roombooking/edit_booking/' . $booking->id_number); ?>" 
       class="btn btn-link text-decoration-none">
        <span class="badge badge-primary"><?php echo $booking->id_number; ?></span>
    </a>
</td>


                                                        <td><?php echo $booking->customer_name; ?></td>
                                                        <td><?php echo $booking->customer_phone; ?></td>
                                                      
                                                        <td><?php echo $booking->room_type; ?></td>
                                                        <td><span class="badge bg-primary"><?php echo $booking->check_in; ?></span>/<br><span class="badge bg-secondary">  <?php echo $booking->check_out; ?></span></td>
                                                        <td><?php echo $booking->number_of_rooms; ?></td>
                                                        <td><?php echo $booking->total_night; ?></td>
                                                        <td>Actions</td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    <?php else: ?>
                                        <p class="text-center">No bookings found.</p>
                                    <?php endif; ?>
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
