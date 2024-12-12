<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Room_booking extends MX_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Room_model');
    }

    public function index() {
        //$this->output->delete_cache();
        $this->load->model('Room_model');
        
        $data['rooms'] = $this->Room_model->get_rooms_with_customers();
        $data['room_types'] = $this->Room_model->get_all_room_types();
        $this->load->view('roombooking/room_list', $data);
    }
        public function add_room() {
        $this->load->model('Room_model');
        $data['room_types'] = $this->Room_model->get_all_room_types();
        $data['generated_room_number'] = $this->generate_room_number();
        if ($this->input->method() == 'post') {
            $data = array(
                'room_number' => $this->input->post('room_number'),
                'price' => $this->input->post('price'),
                'type' => $this->input->post('type'),
                'total_adult' => $this->input->post('total_adult'),
                'total_child' => $this->input->post('total_child'),
                'room_capacity' => $this->input->post('room_capacity'),
                'status' => $this->input->post('status')
            );
           if ($this->db->insert('rooms', $data)) {
                redirect('roombooking/Room_booking/index');
            } else {
                $error = $this->db->error();
                log_message('error', 'Insert failed: ' . $error['message']);
                echo 'Error: ' . $error['message'];
            }
        } else {
            $this->load->view('add_room', $data);
        }
    }
    private function generate_room_number() {
        $prefix = "KAYA-";
        $number = str_pad(rand(0, 99999), 5, '0', STR_PAD_LEFT);
        return $prefix . $number;
    }
   
    public function add_roomtype() {
        $this->load->model('Room_model');
    
        if ($this->input->method() == 'post') {
            $this->form_validation->set_rules('name', 'Room Type Name', 'required|trim');
    
            if ($this->form_validation->run()) {
                $data = [
                    'name' => $this->input->post('name')
                ];
    
                if ($this->Room_model->add_room_type($data)) {
                    redirect('roombooking/Room_booking/index');
                } else {
                    $this->session->set_flashdata('error', 'Failed to add room type.');
                }
            } else {
                $this->session->set_flashdata('error', validation_errors());
            }
        }
    
        redirect('roombooking/Room_booking/index');
    }
    

    

    public function get_room_data($room_id)
    {
        // Fetch room data from the database
        $room = $this->room_model->get_room_by_id($room_id);
    
        // Return room data as a JSON response
        echo json_encode($room);
    }
    

   public function update_room() {
    // Load the model
    $this->load->model('Room_model');

    // Retrieve input data
    $room_id = $this->input->post('room_id'); // Ensure 'room_id' is in your form
    $room_number = $this->input->post('room_number');
   
    $room_type_id = $this->input->post('type'); // This is now the ID for the type
    $total_adult = $this->input->post('total_adult');
    $total_child = $this->input->post('total_child');
    $room_capacity = $this->input->post('room_capacity');
    $status = $this->input->post('status');

    // Prepare data for update
    $data = array(
        'room_number' => $room_number,
    
        'type_id' => $room_type_id, // Update type as type_id
        'total_adult' => $total_adult,
        'total_child' => $total_child,
        'room_capacity' => $room_capacity,
        'status' => $status
    );

    // Log the update operation for debugging
    log_message('debug', 'Update Room ID: ' . $room_id);
    log_message('debug', 'Update Data: ' . print_r($data, true));

    // Perform the update
    if ($this->Room_model->update_room($room_id, $data)) {
        log_message('info', 'Room updated successfully for ID: ' . $room_id);
        redirect('roombooking/Room_booking/index'); // Redirect to your desired page
    } else {
        // Log and show an error if the update fails
        log_message('error', 'Failed to update room with ID: ' . $room_id);
        show_error('Failed to update the room.'); // Display a user-friendly error
    }
}

public function delete_room($room_id) {
    // Load the model
    $this->load->model('Room_model');

    // Delete the room using the model method
    if ($this->Room_model->delete_room($room_id)) {
        // Redirect to the room listing page after successful deletion
        redirect('roombooking/Room_booking/index');  // Adjust the URL based on your routes
    } else {
        // Handle failure (optional)
        show_error('Failed to delete the room.');
    }
}

    




    public function edit_room($room_id)
{

    $this->load->model('Room_model');
    
    // Fetch the room data from the database using the ID
    $room = $this->Room_model->get_room_by_id($room_id);
    
    if (!$room) {
        // Handle case where room is not found
        $this->session->set_flashdata('error', 'Room not found');
        redirect('roombooking');
    }


    
    $room_types = $this->Room_model->get_all_room_types();

    $data['room'] = $room;
    $data['room_types'] = $room_types;

    // Load the edit room view
    $this->load->view('edit_room', $data);
}

    
   
    }


















        












   