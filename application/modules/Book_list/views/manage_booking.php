<?php
// Load the database instance
$CI = &get_instance();
$CI->load->database();

// Fetch room types
$query = $CI->db->get('room_types'); // 'room_types' is the table name
$room_types = $query->result_array();



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve input values
    $check_in_date = $_POST['check_in_date'];
    $check_out_date = $_POST['check_out_date'];
    $room_cost = (float)$_POST['price'];

    // Convert dates to DateTime objects
    $check_in = new DateTime($check_in_date);
    $check_out = new DateTime($check_out_date);

    // Calculate the number of nights
    $interval = $check_in->diff($check_out);
    $number_of_nights = $interval->days;

    // Calculate total price
    $total_price = $number_of_nights * $room_cost;

    // Output the result
    echo "<h3>Booking Summary:</h3>";
    echo "Check-in Date: $check_in_date<br>";
    echo "Check-out Date: $check_out_date<br>";
    echo "Number of Nights: $number_of_nights<br>";
    echo "Cost Per Night: KES $room_cost<br>";
    echo "<strong>Total Price: KES $total_price</strong>";



   

}
?>

<?php
// Load the database instance
$CI = &get_instance();
$CI->load->database();

// Fetch room types
$query = $CI->db->get('room_types'); // 'room_types' is the table name
$room_types = $query->result_array();

// Default values
$available_rooms = 0;
$total_price = 0;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve input values from form submission
    $check_in_date = $_POST['check_in'];
    $check_out_date = $_POST['check_out'];
    $room_type_id = $_POST['room_id'];

    // Ensure the fields are not empty
    if ($check_in_date && $check_out_date && $room_type_id) {
        // Get the total rooms for the selected room type
        $CI->db->where('room_type_id', $room_type_id);
        $total_rooms = $CI->db->count_all_results('rooms');

        // Get the booked rooms for the selected type and date range
        $CI->db->where('room_type_id', $room_type_id);
        $CI->db->group_start();
        $CI->db->where("check_in <=", $check_out_date);
        $CI->db->where("check_out >=", $check_in_date);
        $CI->db->group_end();
        $booked_rooms = $CI->db->count_all_results('bookings');

        // Calculate available rooms
        $available_rooms = max($total_rooms - $booked_rooms, 0);

        // Calculate number of nights
        $check_in = new DateTime($check_in_date);
        $check_out = new DateTime($check_out_date);
        $interval = $check_in->diff($check_out);
        $number_of_nights = $interval->days;

        // Calculate the total price for the room
        $CI->db->where('id', $room_type_id);
        $room = $CI->db->get('room_types')->row(); // Assuming 'room_types' table has the price
        $room_cost = isset($room->price) ? (float)$room->price : 0; // Room price
        $total_price = $number_of_nights * $room_cost;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kaya Hotel :: Add Booking</title>
    <!-- Include CSS files -->
    <link rel="stylesheet" href="<?php echo base_url('assets/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/font-awesome.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/custom.min.css'); ?>">
    <!-- Additional CSS files -->
    <link rel="stylesheet" href="<?php echo base_url('assets/css/style.css'); ?>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <!-- Add Select2 for better dropdowns -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- Include Font Awesome for Icons (if not already included) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <style>
        .form-section {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        .section-title {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #007bff;
            color: #2c3e50;
            font-weight: 600;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 30px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: translateY(-2px);
        }
        .form-group label {
            font-weight: 500;
            color: #34495e;
            margin-bottom: 8px;
        }
        .required:after {
            content: " *";
            color: red;
        }
        .datepicker {
            border-radius: 4px;
        }
       
        
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">
    <!-- Add loading spinner -->
    <!-- <div class="loading">
        <div class="loading-spinner">
            <i class="fa fa-spinner fa-spin fa-3x"></i>
        </div>
    </div> -->

    <div class="wrapper">
        <!-- Header -->
        <header class="main-header">
            <!-- <a href="http://127.0.0.1/hotel/dashboard/home" class="logo">
                <span class="logo-lg">
                    <img src="http://127.0.0.1/hotel/assets/img/icons/2024-12-02/l.jpg" alt="Hotel Logo">
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
            </nav> -->
       
        </header>

        <!-- Sidebar -->
        <aside class="main-sidebar">
            <div class="sidebar">
                <ul class="sidebar-menu">
                    <li class="treeview">
                    <a href="<?php echo base_url('dashboard/home'); ?>">Home</a>
                    <i class="ti-home"></i> <span>Dashboard</span></a>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
        <section class="content-header">
    <div class="header-icon">
        <i class="pe-7s-note2"></i>
    </div>
    <?php if ($this->session->flashdata('error_message')): ?>
        <div style="color: red; text-align: center; margin-top: 10px;">
            <?php echo $this->session->flashdata('error_message'); ?>
        </div>
    <?php endif; ?>

    <?php if ($this->session->flashdata('success_message')): ?>
        <div style="color: green; text-align: center; margin-top: 10px;">
            <?php echo $this->session->flashdata('success_message'); ?>
        </div>
    <?php endif; ?>

    <div class="header-title">
        <small>Add New Booking</small>
    </div>
</section>


            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="panel panel-bd lobidrag">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4>Add Booking Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                       
                                <form id="booking-form" method="post" action="<?php echo site_url('Book_list/Booking_List/save_booking'); ?>" class="form-horizontal">
                                   
                                <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" />
                                
                                
                                <div class="row">
                                        <!-- Column 1: Personal Information -->
                                        <div class="col-md-4">
                                            <div class="form-section">
                                                <h5 class="section-title">Personal Information</h5>
                                                <div class="form-group">
                                                    <label class="required">Client Name</label>
                                                    <input type="text" class="form-control" name="customer_name" required pattern="[A-Za-z\s]+" title="Please enter a valid name (letters only)">
                                                </div>
                                                <div class="form-group">
                                                    <label class="required">ID Number/ Passport</label>
                                                    <input type="number" class="form-control" name="id_number" required pattern="[0-9]+" title="Please enter a valid ID number">
                                                </div>
                                                <div class="form-group">
                                                    <label class="required">Phone Number</label>
                                                    <input type="tel" class="form-control" name="phone_number" required pattern="[0-9]{10}" title="Please enter a valid 10-digit phone number">
                                                </div>
                                                <div class="form-group">
                                                    <label class="">Email</label>
                                                    <input type="email" class="form-control" name="customer_email" >
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Column 2: Booking Details -->
                                        <div class="col-md-4">
                                            <div class="form-section">
                                                <h5 class="section-title">Booking Details</h5>
                                           
<div class="form-group">
    <label for="check_in" class="required">Check-in Date</label>
    <input type="date" class="form-control" name="check_in" id="check_in" required>
</div>
<div class="form-group">
    <label for="check_out" class="required">Check-out Date</label>
    <input type="date" class="form-control" name="check_out"  id="check_out" required>
</div>

<div class="form-group">
    <label for="room_id" class="required">Room Type</label>
    <select class="form-control" name="room_id" id="room_id" required>
        <option value="">Select Room Type</option>
        <?php foreach ($room_types as $room_type): ?>
                <option value="<?php echo $room_type['id']; ?>"
                    <?php echo set_select('room_id', $room_type['id']); ?>>
                    <?php echo $room_type['name']; ?>
                </option>
            <?php endforeach; ?>
    </select>
</div>





                            <div class="form-group">
                                                  <label class="required">Number of Rooms</label>
                                                     <input type="number" class="form-control" name="number_of_rooms" required min="1" max="10">
                                                        <input type="hidden" name="available_room" id ="available_room"  >
                                           
                                                    
                                                        <!-- <label for="available_rooms">Available Rooms</label>
                                                        <input type="number" class="form-control" id="available_rooms" name="available_rooms" readonly> -->

        


        </span>
    
                                                      
                                                    </div>
                                                <!-- <div class="form-group">
                                                    <label class="required">Room Capacity</label>
                                                    <input type="number" class="form-control" name="room_capacity" required min="1" max="10">
                                                </div> -->

                                                <div class="form-group">
                                          
                                        </div>

                                        <div class="form-group">
                                        <label class="required">Number of Guest</label>
                                        <input type="number" class="form-control" name="persons" required min="1" max="10" id="number_of_persons" >
                                        </div>
                                            </div>
                                         
                                        </div>
                                       

                                       
                                        <!-- Column 3: Additional Details -->
                                        <div class="col-md-4">
                                            <div class="form-section">
                                                <h5 class="section-title">Additional Details</h5>
                                                <div class="form-group">
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <label>Number of Children</label>
                                                    <input type="number" class="form-control" name="child_count" min="0" value="<?= set_value('child_count', 0) ?>" max="5">
                                                
                                                </div>
                                                <div class="form-group">
                                                <label>Total Nights</label>
    <input type="number" class="form-control" id="total_nights" name="total_nights" readonly>

</div>
                                                <div class="form-group">
                                                    <label class="required">Amount Ksh</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"></span>
                                                        </div>
                                                        <input type="number" class="form-control" id="actual_price" name="actual_price" required min="0" step="0.01" >
                                                        <input type="hidden" id="price_per_room" value="1000"> <!-- Replace 1000 with the actual price per room -->
                                                    </div>
                                                </div>

                                                <div class="form-group">
    <label for="paymentMethod" class="required">Payment Method</label>
    <select id="paymentMethod" class="form-control select2">
        <option value="">Select Payment Method</option>
        <option value="mpesa">M-Pesa</option>
        <option value="cash">Cash</option>
        <option value="bank">Bank</option>
    </select>
</div>

<div class="form-group" id="mpesaDetails" style="display: none;">
    <label for="mpesaCode">Enter M-Pesa CODE:</label>
    <input type="text" id="mpesaCode" class="form-control" name="mpesaCode" placeholder="Enter M-Pesa CODE"><br>
    <button type="button" class="btn btn-success btn-sm" id="verifyMpesa">Verify M-Pesa Details</button>
    <div id="mpesaResponse"></div>
</div>




                                                   
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Booking Status Section -->
                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="form-section">
                                                <div class="row">
                                                <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="required">Payment Status</label>
                                                            <select class="form-control select2" id="payment_status" name="payment_status" required>
                                                                <option value="0" selected>Pending</option>
                                                                <option value="1">Paid</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="required">Booking Type</label>
                                                            <select class="form-control select2" id="booking_type" name="booking_type" required>
                                                                <option value="Instant" selected>Instant</option>
                                                                <option value="Reserve">Reserve</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                   

                                                   
                                    





                                    <div class="row mt-4">
                                        <div class="col-12 text-center">
                                            <button type="button" class="btn btn-secondary btn-lg mr-2" onclick="window.history.back()">Cancel</button>
                                            <button type="submit" class="btn btn-primary btn-lg">Submit Booking</button>
                                        </div>
                                    </div>
                                </form>
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
            < href="<?php echo base_url('dashboard/user/form'); ?>">
            User Form</a>
            Kaya Hotel</a>
        </footer>
    </div>

    <!-- Include JS files -->
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
   
   $(document).ready(function () {
    // Initially hide the M-Pesa details
    $("#mpesaDetails").hide();

    // Show or hide M-Pesa section based on payment method selection
    $('#paymentMethod').change(function () {
        var selectedMethod = $(this).val();

        if (selectedMethod === 'mpesa') {
            $('#mpesaDetails').slideDown(); // Show M-Pesa details
        } else {
            $('#mpesaDetails').slideUp(); // Hide M-Pesa details
        }
    });

    // Handle M-Pesa verification
    $('#verifyMpesa').click(function () {
        var mpesaCode = $('#mpesaCode').val(); // Get the M-Pesa code entered

        if (!mpesaCode) {
            alert('Please enter your M-Pesa code.');
            return;
        }

        // Show a spinner while verifying (optional)
        var spinner = $('<div class="spinner">Verifying...</div>'); 
        $('#mpesaResponse').html(spinner);

        // Simulate M-Pesa verification (this should be replaced with your actual verification logic)
        setTimeout(function () {
            if (mpesaCode === "SLB919KF5T") { // Simulated valid code (replace with real verification)
                // Successful verification - Show green tick and success message
                $('#mpesaResponse').html('<p class="success"><i class="fas fa-check-circle" style="color: green;"></i> M-Pesa verification successful!</p>');

                // Change payment status to 'Paid' (value 1)
                $('#payment_status').val('1'); // Update payment status to 'Paid'

            } else {
                // Failed verification - Show red cross and error message
                $('#mpesaResponse').html('<p class="error"><i class="fas fa-times-circle" style="color: red;"></i> Invalid M-Pesa code. Please Let The Client Provide The Correct Code.</p>');
            }
        }, 3000); // Simulating a 3-second verification delay
    });
});

       




</script>




    <script>
    $(document).ready(function () {
        
        function calculateTotalNights() {
            var checkIn = new Date($('input[name="check_in"]').val());
            var checkOut = new Date($('input[name="check_out"]').val());

            if (checkIn && checkOut && checkOut > checkIn) {
                var timeDiff = checkOut - checkIn;
                var nights = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
                $('#total_nights').val(nights); // Set the value in the input field
            } else {
                $('#total_nights').val(0); // Default to 0 if invalid dates
                if (checkOut <= checkIn) {
                    toastr.error('Check-out date must be after the check-in date');
                }
            }
        }

        // Trigger calculation when dates change
        $('input[name="check_in"], input[name="check_out"]').on('change', calculateTotalNights);
    });
    </script>

   
</body>
</html>
