<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Module configuration
$config['module_name'] = 'Booking List';
$config['module_description'] = 'Module for managing room bookings.';
$config['version'] = '1.0.0';

// Database configuration for the module
$HmvcConfig['Book_list']["_title"] = "Booking List";
$HmvcConfig['Book_list']["_description"] = "Manage All Room Bookings";

// Register your module tables (only the ones that need to be imported during module installation)
$HmvcConfig['Book_list']['_database'] = true;
$HmvcConfig['Book_list']["_tables"] = array(
    'bookings', // List of tables related to the module
);
