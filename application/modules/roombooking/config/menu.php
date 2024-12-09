<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$HmvcMenu["roombooking"] = array(
    "icon" => "<i class='fa fa-bed'></i>", 
    "Room List" => array(
        "controller" => "Room_booking",
        "method" => "index",
        "permission" => "read"
    ),
    "Add Room" => array(
        "controller" => "Room_booking",
        "method" => "add",
        "permission" => "create"
    )
);
