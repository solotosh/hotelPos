
<?php
// Load the database
// Load the database


$CI = &get_instance();
$CI->load->database();

// Fetch all room types with their total capacity
$room_types_query = $CI->db->select('id, name as room_type_name, max_occupancy')
    ->from('room_types')
    ->get();
$room_types = $room_types_query->result();

// Initialize an array to store room details
$room_status = [];

// Loop through each room type to calculate its details
foreach ($room_types as $room_type) {
    // Total rooms for this type
    $total_rooms = $room_type->max_occupancy;

    // Calculate booked rooms for this type
    $query_booked = $CI->db->select_sum('number_of_rooms', 'booked_rooms')
        ->from('bookings')
        ->where('room_type_id', $room_type->id)
        ->where('check_out >=', date('Y-m-d')) // Only consider bookings that haven't ended
        ->get();
    $booked_result = $query_booked->row();
    $booked_rooms = $booked_result->booked_rooms ? $booked_result->booked_rooms : 0; // Handle null case

    // Calculate available rooms for this type
    $available_rooms = $total_rooms - $booked_rooms;

    // Add details to the room status array
    $room_status[] = [
        'room_type_name' => $room_type->room_type_name, // Here we use the aliased column name
        'booked_rooms' => $booked_rooms,
        'available_rooms' => $available_rooms,
    ];
}

// Display the room details in HTML
?>


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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Toastr CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
    .icon-buttons {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 2px;
    }
    .icon-buttons a {
        padding: 2px;
    }
    .icon-buttons i {
        font-size: 8px;
    }
</style>

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
            padding: 5px 5px; /* Increase padding for more space */
            font-size: 10px; /* Increase font size */
        }

        .badge-primary:hover {
            background-color: #0056b3;
        }
    </style>
<style>
    /* Room Status Container */
.room-status-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px; /* Reduced space between items */
}

/* Room Type Styling */
.room-type {
    flex: 1 1 22%; /* Adjusted to allow more room per item */
    min-width: 150px; /* Reduced minimum width */
    padding: 8px; /* Reduced padding */
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    font-size: 14px; /* Reduced font size */
}

/* Title Styling */
.room-status h3 {
    text-align: center;
    margin-bottom: 10px; /* Reduced space between the title and content */
    font-size: 10px;
}

/* Table Styling */
.room-table table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px; /* Reduced space from other elements */
}

.room-table th, .room-table td {
    padding: 8px; /* Reduced padding for smaller cells */
    font-size: 10px; /* Reduced font size */
    border: 1px solid #ddd;
}

.room-table th {
    background-color: #f4f4f4;
}

.room-table tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
}

.room-table tbody tr:hover {
    background-color: #f1f1f1;
}

</style>
<style>
    .small-table td, .small-table th {
        padding: 4px;
        vertical-align: middle;
        font-size: 12px;
    }
</style>
<!-- Add the following CSS styles -->
<!-- Add the following CSS styles -->

</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Header -->
      

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
            <div>
            <div class="room-status">
    <h5>Room Status by Type</h5>
    <div class="room-status-container">
        <?php foreach ($room_status as $status): ?>
            <div class="room-type">
                <p><strong><?php echo $status['room_type_name']; ?>:</strong> 
                    Booked - <?php echo $status['booked_rooms']; ?>, 
                    Available - <?php echo $status['available_rooms']; ?>
                </p>
            </div>
        <?php endforeach; ?>
    </div>
</div>

            </div>

                <div class="header-icon"><i class="pe-7s-note2"></i></div>
                <div class="header-title">
                <div class="room-status">
    

</div>
<a href="<?php echo site_url('roombooking/add_booking'); ?>" class="btn btn-primary btn-lg mr-2" style="font-size: 1.5rem; padding: 15px 30px; margin-top: -15px;">Add Booking</a>


                    <a href="<?php echo site_url('roomlist/roomlist'); ?>" class="btn btn-success mb-3">View RoomList</a>
                    <small>Manage Bookings</small>
                </div>

              
                




                <?php if (!empty($error_message)): ?>
        <p style="color: red;"><?php echo $error_message; ?></p>
    <?php endif; ?>

    <?php if (!empty($success_message)): ?>
        <p style="color: green;"><?php echo $success_message; ?></p>
    <?php endif; ?>





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




                                        <table class="table table-bordered table-hover small-table">
                                            <thead>
                                                <tr>
                                                    <th>Id No</th>
                                                  
                                                    <th>Client Name</th>
                                                    <th>Phone</th>
                                                   
                                                    <th>Room Type</th>
                                                    <th>Check In/Out</th>
                                                    <th>Total Room</th>
                                                    <th>Total Nights</th>
                                                    <th>Total Amount</th>
                                                    <th>Payment Method</th> 
                                                     <th>Booking Status</th>
                                                  
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($bookings as $booking): ?>
                                                    <tr>
                                                    <td>
                                                
       
        <?php echo $booking->id_number; ?>
    
</td>


                                                        <td><?php echo $booking->customer_name; ?></td>
                                                        <td><?php echo $booking->phone_number; ?></td>
                                                      
                                                        <td><?php echo $booking->room_type; ?></td>
                                                        <td><span class="badge bg-primary"><?php echo $booking->check_in; ?></span>/<br><span class="badge bg-secondary">  <?php echo $booking->check_out; ?></span></td>
                                                        <td><?php echo $booking->number_of_rooms; ?></td>
                                                        <td><?php echo $booking->total_nights; ?></td>
                                                        <td><?php echo $booking->total_price; ?></td>
                                                        <td><?php echo $booking->payment_method; ?></td>

                                                        <td>
                <?php if ($booking->status == 1): ?>
                    <span class="badge badge-success">Paid</span>
                <?php else: ?>
                    <span class="badge badge-warning">Pending</span>
                <?php endif; ?>
            </td>

<td class="text-center">
    <div class="icon-buttons">
        <a href="<?php echo site_url('checkout/edit/' . $booking->id); ?>" 
           class="btn btn-sm btn-warning" title="Checkout Customer">
           <i class="fas fa-sign-out-alt"></i>
        </a>

        <a href="<?php echo site_url('checkout/view/' . $booking->id); ?>" 
           class="btn btn-sm btn-info" title="View Booking">
            <i class="fa fa-eye"></i>
        </a>
       

    </div>
</td>


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
