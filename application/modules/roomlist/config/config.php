<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| RoomList Module Configuration
|--------------------------------------------------------------------------
*/

// Define any module-specific configurations here
$config['roomlist_module_title'] = 'Room List';
$config['roomlist_default_status'] = 'Available';  // Default status for rooms
$config['roomlist_max_rooms'] = 50;  // Max number of rooms to display
$config['roomlist_room_types'] = ['Single', 'Double', 'Suite'];  // Room types available
