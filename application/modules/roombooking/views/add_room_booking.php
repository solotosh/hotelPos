<html>
<head>
    <title>Add Room Booking</title>
</head>
<body>
    <h1>Add Room Booking</h1>
    <form action="<?php echo site_url('roombooking/Room_booking/save_booking'); ?>" method="post">
        <label for="customer">Customer:</label>
        <select name="customer_id" id="customer">
            <!-- Dynamically populate options from customer_info -->
        </select>
        <br>
        <label for="room">Room:</label>
        <select name="room_id" id="room">
            <!-- Dynamically populate options from rooms -->
        </select>
        <br>
        <label for="checkin">Check-in Date:</label>
        <input type="date" name="checkin_date" id="checkin">
        <br>
        <label for="checkout">Check-out Date:</label>
        <input type="date" name="checkout_date" id="checkout">
        <br>
        <input type="submit" value="Book Room">
    </form>
</body>
</html>
