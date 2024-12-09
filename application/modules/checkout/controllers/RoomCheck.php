<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RoomCheck extends MX_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Checkout_model');  // Load the model
        $this->load->helper('url');  // For generating URLs
        $this->load->model('Checkout_model'); 
   
    }

    // Method to handle checkout logic
 

    public function viewcheck($booking_id) {
       echo('Loading............');
        
        $this->load->view('view_check', $booking_id);
    }

    public function view($booking_id) {
        // Load the database and model
        $CI = &get_instance();
        $CI->load->database();
    
        // Fetch the booking details from the database based on booking_id
        $booking_query = $CI->db->select('*')
            ->from('booking')
            ->where('id', $booking_id)
            ->get();
    
        $booking_details = $booking_query->row();  // Fetch a single row
    
        // Pass booking details to the view
        if ($booking_details) {
            $data['booking'] = $booking_details;
            $this->load->view('booking_details', $data); // Load the view
        } else {
            echo 'No booking details found.';
        }
        
    }
    
    
    
    


    public function edit($booking_id) {
       
        
        $this->load->view('edit', $booking_id);
    }


}
