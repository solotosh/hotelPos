<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings</title>
</head>
<body>
    <h1>All Room Bookings</h1>

    <?php if (!empty($bookings)): ?>
        <table border="1">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Room</th>
                    <th>Customer</th>
                    <th>Booking Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($bookings as $booking): ?>
                    <tr>
                        <td><?php echo $booking->id; ?></td>
                        <td><?php echo $booking->room_name; ?></td>
                        <td><?php echo $booking->customer_name; ?></td>
                        <td><?php echo $booking->booking_date; ?></td>
                        <td>
                            <!-- You can add action buttons like View, Edit, or Delete here -->
                            <a href="#">View</a> | <a href="#">Edit</a> | <a href="#">Delete</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No bookings available.</p>
    <?php endif; ?>
</body>
</html>
