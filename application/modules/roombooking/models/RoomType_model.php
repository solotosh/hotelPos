<?php
class RoomType_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function add_room_type($data)
    {
        return $this->db->insert('room_types', $data);
    }
    public function get_room_details()
    {
        $this->db->select('rooms.id, rooms.room_number, roomTypes.name as room_type, customers.name as customer_name');
        $this->db->from('rooms');
        $this->db->join('roomTypes', 'rooms.type_id = roomTypes.id', 'left');
        $this->db->join('customers', 'rooms.customer_id = customers.id', 'left');
        $query = $this->db->get();
        return $query->result_array();
    }













}
