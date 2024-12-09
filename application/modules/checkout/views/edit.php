<?php
// Load the CodeIgniter instance
$CI = &get_instance();
$CI->load->database();

// Get the booking ID from the URL segment
$booking_id = $CI->uri->segment(3);

// Check if booking ID is provided
if (!$booking_id) {
    echo '<p>Booking ID not provided.</p>';
    exit;
}

// Fetch booking details
$booking_query = $CI->db->select('*')
    ->from('bookings')
    ->where('id', $booking_id)
    ->get();

$booking = $booking_query->row();

if (!$booking) {
    echo '<p>No booking found with the provided ID.</p>';
    exit;
}

// Fetch room type details
$room_query = $CI->db->select('*')
    ->from('room_types')
    ->where('id', $booking->room_type_id)
    ->get();

$room = $room_query->row();

if (!$room) {
    echo '<p>Room type not found for the provided booking.</p>';
    exit;
}

// Start database transaction
$CI->db->trans_start();

// Update the room's availability status
$CI->db->where('id', $booking->room_id);
$CI->db->update('rooms', ['availability_status' => 'available']);

// Update max occupancy in the room_types table
$new_max_occupancy = $room->max_occupancy + $booking->persons;
$CI->db->where('id', $room->id);
$CI->db->update('room_types', ['max_occupancy' => $new_max_occupancy]);

// Delete the booking record
$CI->db->delete('bookings', ['id' => $booking_id]);

// Complete the transaction
$CI->db->trans_complete();

$checkout_status = $CI->db->trans_status();



?>


<?php
// After checkout operation
$checkout_status = $CI->db->trans_status();
$redirect_url = 'dashboard/home'; // Redirect directly to dashboard/home without data
?>
    

    <?php
// Redirect to the dashboard directly
header('Location: /hotel/dashboard/home');
exit;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            max-width: 600px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        p {
            font-size: 18px;
            margin: 10px 0;
        }
        .success {
            color: #28a745;
        }
        .failure {
            color: #dc3545;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>Checkout Status</h1>
        <p class="<?php echo $checkout_status ? 'success' : 'failure'; ?>">
            <?php echo $checkout_status 
                ? 'Room successfully checked out.'
                : 'There was an error updating the database.'; ?>
        </p>
        <a href="/hotel/dashboard/home" class="btn">Go to Dashboard</a>
    </div>
    <script>
    setTimeout(function() {
        window.location.href = '/hotel/dashboard/home';  // Correct URL path
    }, 3000);  // 3 seconds delay
</script>
</body>
</html>
