<?php
// Load the CodeIgniter instance
$CI = &get_instance();
$CI->load->database();

// Fetch all data from room_booked_dates along with associated tables
$query = $CI->db
    ->select('
        room_booked_dates.*, 
        bookings.check_in AS booking_check_in, 
        bookings.check_out AS booking_check_out, 
        bookings.total_price, 
        customers.customer_name, 
        customers.customer_email, 
        customers.phone_number, 
        rooms.room_number, 
        rooms.availability_status, 
        room_types.name AS room_type_name, 
        room_types.price_per_night
    ')
    ->from('room_booked_dates')
    ->join('bookings', 'room_booked_dates.booking_id = bookings.id', 'left')
    ->join('customer_info AS customers', 'room_booked_dates.customer_id = customers.customer_id', 'left')
    ->join('rooms', 'room_booked_dates.room_id = rooms.id', 'left')
    ->join('room_types', 'rooms.room_type_id = room_types.id', 'left')
    ->get();

// Check if results exist
if ($query->num_rows() > 0) {
    $results = $query->result_array();
} else {
    $results = [];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>All Bookings</h1>
    <?php if (!empty($results)): ?>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Room Number</th>
                    <th>Room Type</th>
                    <th>Price/Night</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Total Price</th>
                    <th>Booking Date</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($results as $row): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['booking_id']); ?></td>
                        <td><?php echo htmlspecialchars($row['customer_name']); ?></td>
                        <td><?php echo htmlspecialchars($row['customer_email']); ?></td>
                        <td><?php echo htmlspecialchars($row['phone_number']); ?></td>
                        <td><?php echo htmlspecialchars($row['room_number']); ?></td>
                        <td><?php echo htmlspecialchars($row['room_type_name']); ?></td>
                        <td><?php echo htmlspecialchars($row['price_per_night']); ?></td>
                        <td><?php echo htmlspecialchars($row['booking_check_in']); ?></td>
                        <td><?php echo htmlspecialchars($row['booking_check_out']); ?></td>
                        <td><?php echo htmlspecialchars($row['total_price']); ?></td>
                        <td><?php echo htmlspecialchars($row['book_date']); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No booking records found.</p>
    <?php endif; ?>
</body>
</html>
