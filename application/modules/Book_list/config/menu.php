<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$HmvcMenu["roombooking"] = array(
    "icon" => "<i class='fa fa-bed'></i>",
    "room_list" => array(
        "controller" => "Room_booking",
        "method" => "index",
        "permission" => "read"
    ),
    "book_list" => array(
        "controller" => "Booking_List",
        "method" => "index",
        "permission" => "read"
    ),
);

