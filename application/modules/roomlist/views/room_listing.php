<table>
    <thead>
        <tr>
        <th>Room No.</th>
        <th>Room Type</th>
        <th>Room Status</th>
            <th>Customer Name</th>
            <th>Check-In Date</th>
            <th>Check-Out Date</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($bookings as $booking): ?>
            <tr>
            
            
                 <td><?php echo $booking['room_number']; ?></td> 
                 <td><?php echo $booking['room_type_name']; ?></td> 
                 <td>
                    
                 <?php 
                  
                    if ($booking['status'] == 1) {
                        echo '<span class="badge badge-danger">Booked</span>'; // Badge for "Booked"
                    } elseif ($booking['status'] == 0) {
                        echo '<span class="badge badge-warning">Pending</span>'; // Badge for "Pending"
                    } else {
                        echo '<span class="badge badge-success">Available</span>'; // Badge for "Available"
                    }
                    ?>
                
                
                </td> 
                <td><?php echo $booking['customer_name']; ?></td>  <!-- Display customer name -->
                <td>
                <span class="badge rounded-pill bg-secondary text-dark">
                        <?php echo date('d/m/Y', strtotime($booking['check_in'])); ?>

                    </span>/ <br>
                    <span class="badge bg-info">
                        <?php echo date('d/m/Y', strtotime($booking['check_out'])); ?>
                    </span>
                
                </td> <!-- Format the check-in date -->
                <td></td> <!-- Format the check-out date -->
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
