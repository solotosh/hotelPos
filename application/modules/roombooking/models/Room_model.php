<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Room_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    public function add_room($data) {
        if ($this->db->insert('rooms', $data)) {
            log_message('debug', 'Last query: ' . $this->db->last_query()); // Log the query
            return true;
        } else {
            log_message('error', 'Insert failed: ' . $this->db->error()); // Log any error
            return false;
        }
    }

    public function add_room_type($data) {
        return $this->db->insert('room_types', $data);
    }

    


public function get_room_by_id($room_id)
{
    // Ensure your query is correct and uses the correct table and column names
    $query = $this->db->get_where('rooms', array('id' => $room_id));
    
    if ($query->num_rows() > 0) {
        return $query->row_array(); // Return the room as an associative array
    } else {
        return null; // Return null if no room is found
    }
}

public function update_room($room_id, $data) {
    log_message('debug', 'Room ID: ' . $room_id);
    log_message('debug', 'Update Data: ' . print_r($data, true));

    $this->db->where('room_id', $room_id);
    if ($this->db->update('rooms', $data)) {
        log_message('debug', 'Room updated successfully');
        return true;
    } else {
        log_message('error', 'Failed to update room: ' . $this->db->last_query());
        return false;
    }
}



public function delete_room($room_id) {
    // Log for debugging purposes
    log_message('debug', 'Deleting Room ID: ' . $room_id);
    
    // Use the correct column name for the primary key (e.g., 'id')
    $this->db->where('id', $room_id);  // Assuming 'id' is the primary key column
    if ($this->db->delete('rooms')) {
        log_message('debug', 'Room deleted successfully');
        return true;
    } else {
        log_message('error', 'Failed to delete room: ' . $this->db->last_query());
        return false;
    }
}



public function getRoomById($room_id)
{
    return $this->db->get_where('rooms', ['id' => $room_id])->row();
}
public function getAllRoomTypes()
{
    return $this->db->get('room_types')->result_array();
}
public function get_all_room_types() {
    $query = $this->db->get('room_types');
    return $query->result();
}




    public function count_rooms()
    {
        return $this->db->count_all('rooms');
    }
    public function get_room_types() 
         { 
            $query = $this->db->get('room_types');
             return $query->result(); }

             public function get_all_rooms() {
                $query = $this->db->get('rooms');
                return $query->result(); // Ensure it returns an array of objects
            }
    public function get_room_list() 
    { 
        $query = $this->db->get('rooms');
         return $query->result();
         }
         public function get_customer_info($customer_id)
          { $this->db->where('id', $customer_id); 
            $query = $this->db->get('customer_info'); 
            return $query->row();
         }
         public function get_rooms_with_customers() {
            $this->db->select('
                rooms.id, 
                rooms.room_number, 
             
             
                room_types.name AS room_type, 
                
               
              
                rooms.availability_status,
                rooms.created_at
            ');
            $this->db->from('rooms');
            $this->db->join('room_types', 'rooms.room_type_id = room_types.id', 'left');
           
            $this->db->order_by('rooms.created_at', 'DESC');
            
            return $this->db->get()->result();
         }
    public function get_rooms($limit, $start)
    {
        return $this->db->limit($limit, $start)
                        ->get('rooms')
                        ->result();
    }

    public function findById($id)
    {
        return $this->db->where('room_id', $id)
                        ->get('rooms')
                        ->row();
    }
    public function room_types_dropdown()
    {
        return $this->db->get('room_types')->result();
    }

    public function get_all_bookings() {
        return $this->db->get('bookings')->result();
    }
    
    
    
}