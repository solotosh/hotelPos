<!DOCTYPE html>
<html>
<head>
    <title>Booking Receipt</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 80%; margin: auto; padding: 20px; border: 1px solid #ddd; }
        .header { text-align: center; margin-bottom: 20px; }
        .details { margin-bottom: 20px; }
        .details th, .details td { padding: 8px; text-align: left; }
        .footer { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Booking Receipt</h1>
            <p>Receipt for Booking ID: <?= $booking->id ?></p>
        </div>

        <div class="details">
            <table>
                <tr><th>Customer Name:</th><td><?= $booking->customer_name ?></td></tr>
                <tr><th>Phone Number:</th><td><?= $booking->phone_number ?></td></tr>
                <tr><th>Check-In:</th><td><?= $booking->check_in ?></td></tr>
                <tr><th>Check-Out:</th><td><?= $booking->check_out ?></td></tr>
                <tr><th>Total Nights:</th><td><?= $booking->total_nights ?></td></tr>
                <tr><th>Total Price:</th><td><?= $booking->total_price ?></td></tr>
                <tr><th>Payment Status:</th><td><?= $booking->payment_status == 1 ? 'Paid' : 'Unpaid' ?></td></tr>
            </table>
        </div>

        <div class="footer">
            <p>Thank you for booking with us!</p>
        </div>
    </div>
</body>
</html>
