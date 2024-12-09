<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RoomType extends MX_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('roombooking/RoomType_model'); // HMVC Model Load
        $this->load->helper(['form', 'url']);
        $this->load->library('form_validation');
        $this->load->database();

    }

    public function typeroomadd()
    { 
        $this->form_validation->set_rules('name', 'Name', 'required');
        if ($this->form_validation->run() == FALSE) 
        { 
            $this->load->view('roomtypeadd'); 
        } 
        else 
        { 
            $data = ['name' => $this->input->post('name')];
            if ($this->RoomType_model->add_room_type($data)) {
                // Load the add.php view after successful insertion
                $this->load->view('add', ['message' => 'Room type added successfully!']);
            } else {
                // Handle the error, e.g., show an error message
                echo "Failed to add room type. Please try again.";
            }
        }
    }
    public function success() 
    { 
        echo "Room type added successfully!";
    }

    public function get_all_room_types() {
        $query = $this->db->get('room_types'); // Assuming 'room_types' is your table name
        return $query->result_array();
    }

}
