checkout
<div class="room-status">
    <h3>Room Status by Type</h3>
    <?php foreach ($room_status as $status): ?>
        <div class="room-type">
            <p><strong><?php echo $status['room_type_name']; ?>:</strong> 
                Booked - <?php echo $status['booked_rooms']; ?>, 
                Available - <?php echo $status['available_rooms']; ?>
            </p>
        </div>
    <?php endforeach; ?>
</div>