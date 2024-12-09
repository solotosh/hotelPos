<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| RoomList Module Menu Configuration
|--------------------------------------------------------------------------
*/

// Define menu items for the RoomList module
$config['roomlist_menu'] = [
    [
        'title' => 'View Rooms',
        'url'   => site_url('roomlist/roomlist'),  // Adjust route if necessary
        'icon'  => 'fa fa-bed',  // You can use any icon class, this is for font-awesome
    ],
    [
        'title' => 'Add Room',
        'url'   => site_url('roomlist/roomlist/add'),  // Link to room addition page (for example)
        'icon'  => 'fa fa-plus-circle',
    ],
    // You can add more menu items as needed
];
