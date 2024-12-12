<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kaya Hotel :: Room List</title>
    <!-- Include CSS files -->
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/custom.min.css">
    <!-- Additional CSS files -->
    <link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/style.css">
    <style>
        .table>tbody>tr>td, 
        .table>tbody>tr>th, 
        .table>thead>tr>td, 
        .table>thead>tr>th {
            padding: 4px !important; /* Reduced padding */
            font-size: 13px; /* Smaller font size */
            line-height: 1.2; /* Reduced line height */
        }
        .btn-sm {
            padding: 2px 5px;
            font-size: 12px;
        }
        .table-responsive {
            margin-bottom: 10px;
        }
        .panel-body {
            padding: 10px;
        }
    </style>
</head>
<link rel="stylesheet" href="http://127.0.0.1/hotel/assets/css/sidebar.css">
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
                    <li class="treeview">
                </ul>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="header-icon"><i class="pe-7s-home"></i></div>
                <div class="header-title">
                    <h1>Room List</h1>
                    <small>Manage Rooms</small>
                </div>
            </section>

            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="panel panel-bd lobidrag">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="btn-group">
                                        <a href="<?php echo site_url('roombooking/Room_booking/add_room'); ?>" class="btn btn-success btn-sm">Add Room</a> 
                                        <a href="javascript:void(0);" class="btn btn-info btn-sm" data-toggle="modal" data-target="#addRoomTypeModal">Add Room Type</a>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Room Number</th>
                                                <th>Price(Kshs.)</th>
                                                <th>Room Type</th>
                                                <!-- <th>Customer Name</th> -->
                                               
                                              
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (!empty($rooms)): ?>
                                                <?php foreach ($rooms as $room): ?>
                                                    <tr>
                                                        <td><?php echo $room->room_number; ?></td>
                                                       
                                                        
                                                        <td><?php echo $room->room_type; ?></td>
                                                        
                                                       
                                                       
                                                        <td><?php echo $room->availability_status; ?></td>
                                                        <td>
                                                            <a href="<?php echo site_url('roombooking/edit_room/' . $room->id); ?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>
                                                            <a href="<?php echo site_url('roombooking/Room_booking/delete_room/' . $room->id); ?>" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure you want to delete this room?');"><i class="fa fa-trash"></i></a>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="9" class="text-center">No rooms available.</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
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
