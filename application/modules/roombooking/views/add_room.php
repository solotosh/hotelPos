<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Media Queries for responsiveness */
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <form action="<?php echo site_url('roombooking/Room_booking/add_room'); ?>" method="POST">
            
        <input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" 
	value="<?php echo $this->security->get_csrf_hash(); ?>" />

        <div> <label for="room_number">Room Number:</label> <input type="text" name="room_number" 
        value="<?php echo $generated_room_number; ?>" readonly /> 
    
      
      
            <div>
                <label for="price">Price:</label>
                <input type="number" name="price" required />
            </div>
            <div> <label for="type">Room Type:</label> <select name="type" required> <!-- Loop through the room_types array to populate the dropdown --> <?php foreach ($room_types as $type): ?>
                 <option value="<?php echo $type->id; ?>">
                    <?php echo $type->name; ?>
                </option> 
                <?php endforeach; ?> 
            </select> 
        </div>
            <div>
                <label for="total_adults">Total Adults:</label>
                <input type="number" name="total_adult" required />
            </div>
            <div>
                <label for="total_child">Total Children:</label>
                <input type="number" name="total_child" required />
            </div>
            <div>
                <label for="room_capacity">Room Capacity:</label>
                <input type="number" name="room_capacity" required />
            </div>
            <div>
                <label for="status">Status:</label>
                <select name="status">
                    <option value="available">Available</option>
                    <option value="booked">Booked</option>
                </select>
            </div>
            <div>
                <button type="submit">Add Room</button>
            </div>
        </form>
    
    </div>
    </div>

</body>
</html>
