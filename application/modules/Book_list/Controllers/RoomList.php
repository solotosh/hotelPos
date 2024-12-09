<?php
defined('BASEPATH') or exit('No direct script access allowed');

class RoomList extends MX_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Book_List/RoomList_model'); // Load the RoomList model
    }

    public function room()
    {
   echo('Loading........');
        $data['rooms'] = $this->RoomList_model->get_room_list();

        // Load the Room List view and pass data
        $this->load->view('Book_list/roomlist', $data);
    }


}
