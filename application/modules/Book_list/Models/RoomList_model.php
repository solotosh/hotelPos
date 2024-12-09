<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RoomList_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        // Load the database library
        $this->load->database();
    }

    // Example method to fetch room data
    public function get_room_list()
    {
        $query = $this->db->get('rooms'); // Replace 'rooms' with your actual table name
        return $query->result_array();
    }
}
