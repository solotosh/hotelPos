<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= $title ?></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1><?= $title ?></h1>
        <a href="<?= base_url('roomtype/add') ?>" class="btn btn-primary mb-3">Add Room Type</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Room Type Name</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($room_types)): ?>
                    <?php foreach ($room_types as $key => $room_type): ?>
                        <tr>
                            <td><?= $key + 1 ?></td>
                            <td><?= $room_type->name ?></td>
                            <td><?= $room_type->created_at ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="3" class="text-center">No room types found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
