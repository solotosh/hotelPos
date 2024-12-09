<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Room_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    // Method to fetch room data
    public function get_rooms()
    {
        $this->db->select('check_in, check_out,
        customer_info.customer_name,
        rooms.room_number,
        room_types.name As room_type_name,
     
          bookings.status,
        '
    );
        $this->db->from('bookings');  // Specify the table
        $this->db->join('customer_info','customer_info.customer_id=bookings.customer_id');
        $this->db->join('rooms','rooms.id=bookings.room_id');
        $this->db->join('room_types','rooms.room_type_id=bookings.room_type_id');

        $query = $this->db->get();
        $query = $this->db->get('rooms');  // Change 'rooms' to your actual table name
        return $query->result_array();  // Return the result as an array
    }

     public function get_booking_by_id($id) {
        $this->db->select('*');
        $this->db->from('bookings');
        $this->db->join('customer_info', 'bookings.customer_id = customer_info.customer_id', 'left');
        $this->db->join('room_types', 'bookings.room_type_id = room_types.id', 'left');
        $this->db->where('bookings.id', $id);
        $query = $this->db->get();
        return $query->row();
    }




    public function get_room_booked_dates($id) {
        // Change 'booked_dates' to 'room_booked_dates'
        $this->db->where('booking_id', $id);
        $query = $this->db->get('room_booked_dates');  // Use the correct table name
        return $query->result();  // Return all booked dates for this booking
    }

    public function get_booking_info($booking_id) {
        // Call the method from the Room_model
        $customer_data = $this->room_model->get_customer_data($booking_id);
        
        if ($customer_data) {
            // If customer data is returned, load the view
            $this->load->view('some_view', ['customer_data' => $customer_data]);
        } else {
            // If no customer data is found, log an error
            log_message('error', 'No customer data found for booking ID: ' . $booking_id);
        }
    }

   
    


    
    // public function get_customer_info($customer_id) {
    //     // Assuming 'customers' is the table name
    //     $this->db->where('customer_id', $customer_id);  // Assuming 'id' is the primary key for customers
    //     $query = $this->db->get('customer_info');  // Use the correct table name
    
    //     if ($query->num_rows() > 0) {
    //         return $query->row();  // Return a single row of customer data
    //     } else {
    //         return null;  // Return null if no customer data is found
    //     }
    // }
    public function get_all_bookings() {
        $this->db->select('
            bookings.id,
            bookings.check_in,
            bookings.check_out,
            bookings.phone_number,
            bookings.number_of_rooms,
            bookings.total_nights,
            bookings.actual_price,
            bookings.payment_method,
            bookings.status,
            customer_info.customer_name,
            customer_info.customer_id,
            customer_info.id_number,
            room_types.name as room_type
        ');
        $this->db->from('bookings');
        $this->db->join('customer_info', 'bookings.customer_id = customer_info.customer_id', 'left');
        $this->db->join('room_types', 'bookings.room_type_id = room_types.id', 'left');
        
        // Ordering by check_in date, descending (most recent first)
        $this->db->order_by('bookings.check_in', 'DESC');
        
        $query = $this->db->get();
        return $query->result();
    }
    


    public function get_room_types() {
        $query = $this->db->get('room_types'); // Select all from the room_types table
        return $query->result_array(); // Return as an array of rows
    }


    // public function get_customer_data($customer_id) {
    //     $this->db->select('*');
    //     $this->db->from('customer_info');
    //     $this->db->where('customer_id', $customer_id);
    //     $query = $this->db->get();
    
    //     // Check if the query returns a result
    //     if ($query->num_rows() > 0) {
    //         return $query->row();  // Return the data
    //     } else {
    //         return null;  // Return null if no data is found
    //     }
    // }
    

    

public function get_customer_data_by_booking_id($id) {
    $this->db->select('customer_id');
    $this->db->from('bookings');
    $this->db->where('id', $id);
    $query = $this->db->get();

    if ($query->num_rows() > 0) {
        return $query->row();  // Return a single result
    } else {
        return null;
    }
}






    public function edit($id) {
        // Load required models
        $this->load->model('Booking_model');
        $this->load->model('Room_type_model');
    
        // Get booking details
        $data['booking'] = $this->Booking_model->get_booking_by_id($id);
        
        // Get room types for dropdown
        $data['room_types'] = $this->Room_type_model->get_all_room_types();
    
        // Load view with data
        $this->load->view('edit_booking', $data);
    }
    
    
    
 
    
    public function update_booking($id, $data) {
        $this->db->where('id', $id);
        return $this->db->update('bookings', $data);
    }
    
    public function get_all_room_types() {
        return $this->db->get('room_types')->result_array();
    }
    





}
