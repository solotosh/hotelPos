
<?php


$data['rooms'] = $this->Room_model->get_all_rooms();
$data['customers'] = $this->Customer_model->get_all_customers();

echo "<pre>";
print_r($data);
echo "</pre>";
exit;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
</head>
<body>
    <h1><?php echo $title; ?></h1>
    
    <h2>Rooms</h2>
    <ul>
        <?php foreach ($rooms as $room): ?>
            <li><?php echo $room['name']; ?> - <?php echo $room['type']; ?></li>
        <?php endforeach; ?>
    </ul>

    <h2>Customers</h2>
    <ul>
        <?php foreach ($customers as $customer): ?>
            <li><?php echo $customer['name']; ?> - <?php echo $customer['email']; ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
