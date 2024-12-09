<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RoomList extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        // Load the Room_model
        $this->load->library('pdfgenerator');
        $this->load->model('roomlist/Room_model');
        $this->load->model('roomlist/Room_model', 'room_model');
        if (!isset($this->room_model)) {
            log_message('error', 'Room_model is not loaded properly.');
        } else {
            log_message('info', 'Room_model is loaded successfully.');
        }
    }

    // Method to load the room listing page
    public function index()
    {
        // Get room data from the model
        $data['rooms'] = $this->Room_model->get_rooms();

        // Load the view and pass data
        $this->load->view('roomlist/room_listing', $data);
    }



    public function edit($id) {
        // Load necessary model
        $this->load->model('room_model');
        
        // Fetch booking data
        $data['booking'] = $this->room_model->get_booking_by_id($id);
        
        if (!$data['booking']) {
            show_error('The booking you are trying to edit does not exist.');
        }
    
        // Fetch booked dates for the room
        $data['room_booked_dates'] = $this->room_model->get_room_booked_dates($id);
       
        // You can now load your view with the data
        $this->load->view('roomlist/edit_booking', $data);
    }
    

   
        
        public function confirm_checkout($booking_id) {
            echo('Loading .........');
            echo 'Function confirm_checkout called with booking ID: ' . $booking_id;
            echo $booking_id;
            $data['booking_id'] = $booking_id;
                $CI->load->view('roomlist/checkout',$data);
                
            }
    
        
    
   



public function get_booking_info($booking_id) {
    // Now use the model
    $customer_data = $this->room_model->get_customer_data($booking_id);
    if ($customer_data) {
        $this->load->view('some_view', ['customer_data' => $customer_data]);
    } else {
        log_message('error', 'No customer data found for booking ID: ' . $booking_id);
    }
}

public function update($id) {
    // Validate form input
    $this->form_validation->set_rules('customer_name', 'Customer Name', 'required');
    $this->form_validation->set_rules('id_number', 'ID Number', 'required');
    $this->form_validation->set_rules('phone_number', 'Phone Number', 'required');
    $this->form_validation->set_rules('customer_email', 'Email', 'required|valid_email');
    $this->form_validation->set_rules('check_in', 'Check-in Date', 'required');
    $this->form_validation->set_rules('check_out', 'Check-out Date', 'required');
    $this->form_validation->set_rules('room_id', 'Room Type', 'required');
    $this->form_validation->set_rules('number_of_rooms', 'Number of Rooms', 'required|numeric');
    $this->form_validation->set_rules('persons', 'Number of Guests', 'required|numeric');
    $this->form_validation->set_rules('actual_price', 'Amount', 'required|numeric');
    $this->form_validation->set_rules('payment_method', 'Payment Method', 'required');
    $this->form_validation->set_rules('payment_status', 'Payment Status', 'required');
    $this->form_validation->set_rules('booking_type', 'Booking Type', 'required');
    $this->form_validation->set_rules('status', 'Booking Status', 'required');

    if ($this->form_validation->run() === FALSE) {
        // If validation fails, reload form with errors
        $this->edit($id);
    } else {
        // Prepare data for update
        $data = array(
            'customer_name' => $this->input->post('customer_name'),
            'id_number' => $this->input->post('id_number'), 
            'phone_number' => $this->input->post('phone_number'),
            'customer_email' => $this->input->post('customer_email'),
            'check_in' => $this->input->post('check_in'),
            'check_out' => $this->input->post('check_out'),
            'room_id' => $this->input->post('room_id'),
            'number_of_rooms' => $this->input->post('number_of_rooms'),
            'persons' => $this->input->post('persons'),
            'child_count' => $this->input->post('child_count'),
            'total_nights' => $this->input->post('total_nights'),
            'actual_price' => $this->input->post('actual_price'),
            'payment_method' => $this->input->post('payment_method'),
            'payment_status' => $this->input->post('payment_status'),
            'booking_type' => $this->input->post('booking_type'),
            'status' => $this->input->post('status'),
            'updated_at' => date('Y-m-d H:i:s')
        );

        // Update booking
        $this->load->model('Booking_model');
        if($this->Booking_model->update_booking($id, $data)) {
            $this->session->set_flashdata('success', 'Booking updated successfully');
            redirect('roomlist/bookings');
        } else {
            $this->session->set_flashdata('error', 'Error updating booking');
            $this->edit($id);
        }
    }
}

    
    




}
