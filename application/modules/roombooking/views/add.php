<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kaya Hotel :: Hotel Booking</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo base_url('assets/img/icons/2024-12-02/l1.jpg'); ?>" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php echo base_url('application/modules/template/assets/css/template.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/css/custom.min.css'); ?>" rel="stylesheet">

    <!-- Additional CSS -->
    <link href="<?php echo base_url('assets/css/font-awesome.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/css/select2.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/datatables/css/dataTables.min.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/sweetalert/sweetalert.css'); ?>" rel="stylesheet">
    <link href="<?php echo base_url('assets/toastr/toastr.css'); ?>" rel="stylesheet">

    <!-- jQuery -->
    <script src="<?php echo base_url('assets/js/jquery-3.6.4.min.js'); ?>"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- Bootstrap Bundle with Popper -->



    <!-- Inline Styles -->
    <style>
        .loading:after {
            content: ' .';
            animation: dots 1s steps(5, end) infinite;
        }
        @keyframes dots {
            20%, 20% { color: rgba(0,0,0,1); text-shadow: .25em 0 0 rgba(0,0,0,0), .5em 0 0 rgba(0,0,0,0); }
            40% { color: #F00; text-shadow: .25em 0 0 rgba(0,0,0,0), .5em 0 0 rgba(0,0,0,0); }
            60% { text-shadow: .25em 0 0 #F00, .5em 0 0 rgba(0,0,0,0); }
            80%, 100% { text-shadow: .25em 0 0 #666, .5em 0 0 #666; }
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <!-- Rest of your HTML structure remains the same until the modal -->

    <div class="wrapper">
        <!-- Header -->
        <header class="main-header">
            <a href="<?php echo base_url('dashboard/home'); ?>" class="logo">
                <span class="logo-lg">
                    <img src="<?php echo base_url('assets/img/icons/2024-12-02/l.jpg'); ?>" alt="">
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
                            <a href="<?php echo base_url('reservation/reservation'); ?>" class="dropdown-toggle">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-success reservenotif">0</span>
                            </a>
                        </li>
                        <li class="dropdown dropdown-user">
                            <a href="#" class="dropdown-toggle lang_box" data-toggle="dropdown">ENG</a>
                            <ul class="dropdown-menu lang_options">
                                <li><a href="javascript:;" onclick="addlang(this)" data-url="<?php echo base_url('hungry/setlangue/english'); ?>">English</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Sidebar -->
        <aside class="main-sidebar">
            <div class="sidebar">
                <div class="user-panel text-center">
                    <div class="image">
                        <img src="<?php echo base_url('assets/img/user/m2.png'); ?>" class="img-circle" alt="User Image">
                    </div>
                    <div class="info">
                        <p>Admin Solomon</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Admin</a>
                    </div>
                </div>
                <ul class="sidebar-menu">
                    <li class="treeview">
                        <a href="<?php echo base_url('dashboard/home'); ?>"><i class="ti-home"></i> <span>Dashboard</span></a>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="header-icon"><i class="pe-7s-home"></i></div>
                <div class="header-title">
                    <h1>Room Management</h1>
                    <small>Our Rooms</small>
                </div>
            </section>

            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="panel">
                            <div class="panel-body">
                                <fieldset class="border p-2">
                                    <legend class="w-auto">All Rooms</legend>
                                    <div class="d-flex justify-content-end mb-3">
                                        <a href="" class="btn btn-primary mr-2">

                                            <i class="fa fa-plus"></i> Add Room
 
<a href="<?php echo site_url('roombooking/RoomType/typeroomadd'); ?>" 
class="btn btn-secondary mr-2">Add Room Type</a>


                                    </div>
                                </fieldset>

                                <div class="row">
                                    <div class="col-sm-12" id="findfood">
                                        <table class="table datatable table-fixed table-bordered table-hover bg-white" id="purchaseTable">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">No</th>
                                                    <th class="text-center">Room No</th>
                                                    <th class="text-center">Room Type</th>
                                                    <th class="text-center">Room Name</th>
                                                    <th class="text-center">Customer Name</th>
                                                    <th class="text-center">Date</th>
                                                    <th class="text-right">Amount</th>
                                                    <th class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php if (!empty($rooms)): ?>
                                                    <?php foreach ($rooms as $key => $room): ?>
                                                        <tr>
                                                            <td><?php echo $key + 1; ?></td>
                                                            <td><?php echo $room['room_number']; ?></td>
                                    <td><?php echo $room['room_type']; ?></td>
                                    <td><?php echo $room['room_name']; ?></td>
                                    <td>
                        <?php
                            $customer = isset($room->customer_name) ? $room->customer_name : 'No customer assigned';
                            echo $customer;
                        ?>
                    </td>
                                    <td><?php echo date('Y-m-d'); ?></td> <!-- Placeholder for actual date -->
                                    <td>Amount</td> <!-- Placeholder for actual amount -->

                                    <td>
                                        <!-- Action buttons -->
                                        <a href="#" class="btn btn-info">Edit</a>
                                        <a href="#" class="btn btn-danger">Delete</a>
                                    </td>

                                                        </tr>
                                                    <?php endforeach; ?>
                                                <?php else: ?>
                                                    <tr>
                                                        <td colspan="8" class="text-center">No rooms available.</td>
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
        </div>

        <!-- Footer -->
        <footer class="main-footer">
            <strong>Kaya Hotel You belong Here 2024</strong>
            <a href="<?php echo base_url('ordermanage/order/pendingorder'); ?>">Kaya Hotel</a>
        </footer>
    </div>

    
  

    <!-- Core JS -->
 
    <script src="<?php echo base_url('assets/js/jquery-ui.min.js'); ?>"></script>
    <script src="<?php echo base_url('assets/js/select2.min.js'); ?>"></script>
    <script src="<?php echo base_url('assets/datatables/js/dataTables.min.js'); ?>"></script>
    <script src="<?php echo base_url('assets/sweetalert/sweetalert.min.js'); ?>"></script>
    <script src="<?php echo base_url('assets/toastr/toastr.min.js'); ?>"></script>
    <script src="<?php echo base_url('application/modules/template/assets/js/template.js'); ?>"></script>

    <!-- Custom JS -->
    <script>
        $(document).ready(function() {
            setTimeout(function() {
                $('.page-loader-wrapper').fadeOut();
            }, 2000);

            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success('Welcome Back! Admin Solomon', 'Success');
        });

        $('#addRoomTypeForm').on('submit', function(e) {
            e.preventDefault();
            $.ajax({
                url: '<?php echo site_url("roombooking/Room_booking/add_room_type"); ?>',
                type: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    if (response.success) {
                        $('#addRoomTypeModal').modal('hide');
                        location.reload();
                    } else {
                        alert('Failed to add room type');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Failed to send request", error);
                }
            });
        });
    </script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>