<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Booking_model extends CI_Model {
  
    public function get_all_bookings($limit = 20, $offset = 0) {
        $this->db->select('
            bookings.id,
            bookings.check_in,
            bookings.check_out,
            bookings.number_of_rooms,
            bookings.total_nights,
            bookings.actual_price,
            bookings.total_price,
            bookings.subtotal,
            bookings.payment_method,
            bookings.id_number,
            bookings.status,
            customer_info.customer_name,
            customer_info.customer_id,
            customer_info.id_number,
            customer_info.phone_number,
            room_types.name as room_type,
            customer_info.customer_name,
        ');
        $this->db->from('bookings');
        $this->db->join('customer_info', 'bookings.customer_id = customer_info.customer_id', 'left');
        $this->db->join('room_types', 'bookings.room_type_id = room_types.id', 'left');  // Ensure room type join is correct
        $this->db->limit($limit, $offset);
        $this->db->order_by('bookings.created_at', 'DESC');
        
        $query = $this->db->get();

        $this->output->set_header('Cache-Control: no-cache, no-store, must-revalidate');
        $this->output->set_header('Pragma: no-cache');
        $this->output->set_header('Expires: 0');
        
        // Debug the query if needed:
        // echo $this->db->last_query(); 
        
        echo $CI->db->last_query();
        exit;
    }
    
    
    public function count_all_bookings() {
        $this->db->from('bookings');
        return $this->db->count_all_results();
    }



    public function add_booking($data) {
        $this->db->insert('bookings', $data);
        return $this->db->insert_id(); // Return the ID of the inserted booking
    }
    public function get_current_occupancy($room_id) {
        // Example query to count bookings for a given room_id
        $query = "SELECT COUNT(*) AS occupancy FROM bookings WHERE room_id = ?";
        $result = $this->db->query($query, array($room_id))->row();
        return $result->occupancy;
    }


// Model: Room_model.php
public function get_available_rooms_count($room_type_id, $check_in, $check_out) {
    $query = $this->db->query("
        SELECT COUNT(*) AS available_rooms
        FROM rooms
        WHERE room_type_id = ? 
        AND status = 'available'
        AND id NOT IN (
            SELECT room_id 
            FROM bookings 
            WHERE (check_in <= ? AND check_out >= ?)
        )
    ", [$room_type_id, $check_out, $check_in]);

    return $query->row()->available_rooms;
}

// models/Booking_model.php

public function get_room_types() {
    $query = $this->db->get('room_types'); // Select all from the room_types table
    return $query->result_array(); // Return as an array of rows
}

public function delete_room_booked_dates_by_id_number($id_number) {
    $this->db->where('id_number', $id_number);
    $this->db->delete('room_booked_dates');
}

// Delete from bookings based on id_number
public function delete_booking_by_id_number($id_number) {
    $this->db->where('id_number', $id_number);
    $this->db->delete('bookings');
}

// Optionally, delete the customer info based on id_number (if desired)
// public function delete_customer_info_by_id_number($id_number) {
//     $this->db->where('id_number', $id_number);
//     $this->db->delete('customer_info');
// }



public function get_booking_by_id($id) {
    $query = $this->db->get_where('bookings', ['id' => $id]);
    return $query->row_array(); // Ensure table 'bookings' exists
}

public function get_room_booked_dates($booking_id)
{
    return $this->db->get_where('room_booked_dates', ['booking_id' => $booking_id])->result();
}

public function get_customer_info($customer_id)
{
    return $this->db->get_where('customer_inf', ['id' => $customer_id])->row();
}




public function update_booking($id, $data) {
    $this->db->where('id', $id);
    $this->db->update('bookings', $data);
    return $this->db->affected_rows();
}




}
