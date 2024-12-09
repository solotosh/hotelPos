<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Booking_List extends MX_Controller {
    public function __construct() {
        parent::__construct();
      $this->load->model('Book_list/Booking_model');
        //$this->load->model('Booking_model');
        $this->load->helper('form');  
        $this->load->library('session');
    }

    public function index() {
        $data['bookings'] = $this->Booking_model->get_all_bookings();
        $this->load->view('Book_listing', $data);
    }

    public function more($page = 1) {
        $this->load->model('Book_list/Booking_model');
   

        $limit = 20;
        $offset = ($page - 1) * $limit;
        $data['bookings'] = $this->Booking_model->get_all_bookings($limit, $offset);

      



 

        $this->load->view('more',$data); // Include the module name as part of the path
    }

    public function edit($id) {
      
        $this->load->model('Booking_model');
        $data['booking'] = $this->Booking_model->get_booking_by_id($id);
        if (!$data['booking']) {
            show_error('The booking you are trying to edit does not exist.');
        }
        $data['room_booked_dates'] = $this->Booking_model->get_room_booked_dates($id);
        $data['customer_info'] = $this->Booking_model->get_customer_info($data['booking']->customer_id);
        $this->load->view('Book_list/edit_book', $data);
    }
    
    public function update() {
        // Get form data
        $id = $this->input->post('id');
        $updated_data = array(
            'customer_name' => $this->input->post('customer_name'),
            'id_number' => $this->input->post('id_number'),
            'phone_number' => $this->input->post('phone_number'),
            'check_in' => $this->input->post('check_in'),
            'check_out' => $this->input->post('check_out'),
            'room_id' => $this->input->post('room_id'),
            'number_of_rooms' => $this->input->post('number_of_rooms'),
            'total_nights' => $this->input->post('total_nights'),
            'payment_status' => $this->input->post('payment_status')
        );
    
        // Load the model and update the record
        $this->load->model('Booking_model');
        $this->Booking_model->update_booking($id, $updated_data);
    
        // Redirect to the booking list page
        redirect('Book_list/Booking_List');
    }
    
    

  

   // Controller: RoomBooking.php
public function get_available_rooms_count() {
    $room_type_id = $this->input->post('room_type_id');
    $check_in = $this->input->post('check_in');
    $check_out = $this->input->post('check_out');

    // Fetch available rooms count from the database
    $available_rooms_count = $this->Room_model->get_available_rooms_count($room_type_id, $check_in, $check_out);
    echo json_encode(['available_rooms' => $available_rooms_count]);
}



public function roomlist() {
    // Fetch room types from the model
    $data['room_types'] = $this->room_model->get_room_types();

    // Load the view and pass the room types data
    $this->load->view('roomlist/room_listing', $data);
}
    
public function book_room() {
    // Fetch room types from the database
    $room_types = $this->Booking_model->get_all_room_types(); // Assume you have this function in the model
    
    // Pass the room types to the view
    $data['room_types'] = $room_types;
    
    // For each room, get its current occupancy
    foreach ($data['room_types'] as &$room_type) {
        $room_type['current_occupancy'] = $this->Room_model->get_current_occupancy($room_type['id']);
    }
    
    // Load the view with the room types and occupancy data
    $this->load->view('Book_list/manage_booking', $data);
}



public function add_booking()
{

   
    $this->load->view('Book_list/manage_booking');
}


public function check_availability()
{

    $check_in = $this->input->post('check_in');
    $check_out = $this->input->post('check_out');
    $room_type_id = $this->input->post('room_id');
    log_message('debug', 'Check-in: ' . $check_in . ', Check-out: ' . $check_out . ', Room ID: ' . $room_id);

    if ($check_in && $check_out && $room_type_id) {
        // Get total rooms for the selected room type
        $this->db->where('room_type_id', $room_type_id);
        $total_rooms = $this->db->count_all_results('rooms');

        // Get booked rooms for the selected type and date range
        $this->db->where('room_type_id', $room_type_id);
        $this->db->group_start();
        $this->db->where("check_in <=", $check_out);
        $this->db->where("check_out >=", $check_in);
        $this->db->group_end();
        $booked_rooms = $this->db->count_all_results('bookings');

        // Calculate available rooms
        $available_rooms = max($total_rooms - $booked_rooms, 0);

        // Return the available rooms count as JSON
        echo json_encode([
            'status' => 'success',
            'available_rooms' => $available_rooms
        ]);
    } else {
        // If any input is missing, return error
        echo json_encode([
            'status' => 'error',
            'message' => 'Invalid input data'
        ]);
    }
}


public function get_bookings() {
    $CI =& get_instance();
    $CI->load->database();

    // Fetch bookings with customer info
    $CI->db->select('b.*, c.customer_name, c.phone_number, c.id_number');
    $CI->db->from('bookings b');
    $CI->db->join('customer_info c', 'b.customer_id = c.customer_id', 'left');  // Join with customer_info table
    $query = $CI->db->get();

    // Return the results
    return $query->result();
}

// var_dump($customer_id);
// die();







public function save_booking() {

    $CI =& get_instance();
    $CI->load->database();

    // Retrieve POST data
    $data = $CI->input->post();

    // Validate required inputs
    if (empty($data['room_id']) || empty($data['persons']) || empty($data['check_in']) || empty($data['check_out']) || 
        empty($data['number_of_rooms']) || empty($data['customer_name']) || empty($data['phone_number'])) {
        $data['error_message'] = 'All required fields must be filled.';
        $this->load->view('more', $data);
        return;
    }

    // Extract input data
    $room_type_id = $data['room_id'];
    $persons = $data['persons'];
    $child_count = $data['child_count'] ?? 0;
    $number_of_rooms = $data['number_of_rooms'];
    $check_in = $data['check_in'];
    $check_out = $data['check_out'];
    $customer_email = $data['customer_email'] ?? '';  // Optional
    $customer_name = $data['customer_name'];
    $phone_number = $data['phone_number'];
    $payment_method = $data['payment_method'] ?? 'Cash';
    $booking_type = $data['booking_type'] ?? 'Instant';
    $id_number = $data['id_number'] ?? '';  // Optional
    $payment_status = $data['payment_status'];

    // Initialize or fetch customer ID
    $customer_id = null;
    if (!empty($customer_email)) {
        // Lookup customer by email
        $customer = $CI->db->select('customer_id')
            ->from('customer_info')
            ->where('customer_email', $customer_email)
            ->get()
            ->row();

        if ($customer) {
            $customer_id = $customer->customer_id;
        } else {
            // Insert new customer record
            $customer_data = [
                'customer_email' => $customer_email,
                'customer_name' => $customer_name,
                'phone_number' => $phone_number,
                'id_number' => $id_number,
                'created_at' => date('Y-m-d H:i:s'),
            ];
            $CI->db->insert('customer_info', $customer_data);
            $customer_id = $CI->db->insert_id();
        }
    } else {
        // Insert customer without email
        $customer_data = [
            'customer_name' => $customer_name,
            'phone_number' => $phone_number,
            'id_number' => $id_number,
            'created_at' => date('Y-m-d H:i:s'),
        ];
        $CI->db->insert('customer_info', $customer_data);
        $customer_id = $CI->db->insert_id();
    }

    // Fetch room type details
    $room_type = $CI->db->select('price_per_night, max_occupancy')
        ->from('room_types')
        ->where('id', $room_type_id)
        ->get()
        ->row();

    if (!$room_type) {
        $data['error_message'] = 'Invalid Room Type Selected.';
        $this->load->view('more', $data);
        return;
    }

    $price_per_night = $room_type->price_per_night;
    $max_occupancy = $room_type->max_occupancy;

    // Calculate booking details
    $check_in_date = new DateTime($check_in);
    $check_out_date = new DateTime($check_out);
    $total_nights = $check_in_date->diff($check_out_date)->days;

    $subtotal = $price_per_night * $number_of_rooms * $total_nights;
    $total_price = $subtotal;

    // Check room availability
    $booked_rooms = $CI->db->select_sum('number_of_rooms')
        ->from('bookings')
        ->where('room_type_id', $room_type_id)
        ->where('check_in <=', $check_out)
        ->where('check_out >=', $check_in)
        ->get()
        ->row()->number_of_rooms ?? 0;

    if ($max_occupancy - $booked_rooms < $number_of_rooms) {
        $data['error_message'] = 'Not Enough Rooms Available.';
        $this->load->view('more', $data);
        return;
    }

    // Begin transaction
    $CI->db->trans_start();

    // Insert booking record
    $booking_data = [
        'customer_id' => $customer_id,
        'room_type_id' => $room_type_id,
        'check_in' => $check_in,
        'check_out' => $check_out,
        'persons' => $persons,
        'child_count' => $child_count,
        'number_of_rooms' => $number_of_rooms,
        'total_nights' => $total_nights,
        'subtotal' => $subtotal,
        'total_price' => $total_price,
        'phone_number'=>$phone_number,
        'customer_email'=>$customer_email,
        'payment_method' => $payment_method,
        'booking_type' => $booking_type,
        'id_number' => $id_number,
        'booking_date' => date('Y-m-d H:i:s'),
        'status' => 1
    ];
    $CI->db->insert('bookings', $booking_data);
    $booking_id = $CI->db->insert_id();

  


    // Insert into room booked dates
    $room_booked_data = [
        'customer_id' => $customer_id,
        'booking_id' => $booking_id,
        'room_id' => $room_type_id,
        'book_date' => date('Y-m-d H:i:s'),
        'check_in' => $check_in,
        'check_out' => $check_out
    ];
    $CI->db->insert('room_booked_dates', $room_booked_data);

    // Commit transaction
    $CI->db->trans_complete();

    if ($CI->db->trans_status() === FALSE) {
        $data['error_message'] = 'An error occurred while saving the booking.';
        $this->load->view('more', $data);
    } else {
        $data['success_message'] = 'Booking successfully created for ' . $customer_name;

        // Fetch updated bookings data
        $data['bookings'] = $CI->db->select('bookings.*, room_types.name as room_type')
            ->from('bookings')
            ->join('room_types', 'bookings.room_type_id = room_types.id', 'left')
            ->join('customer_info', 'bookings.customer_id = customer_info.customer_id', 'left')
            ->order_by('bookings.created_at', 'DESC')
            ->get()
            ->result();

        // Load the view with updated data
        $this->load->view('more', $data);
    }
}














public function fetch_available_room_status() {
    $room_id = $this->input->post('room_id');

    // Query to check if the room is available
    $query = $this->db->query("SELECT availability_status 
                                FROM rooms 
                                WHERE room_id = ? AND availability_status = 'Available'", 
                                array($room_id));
    $result = $query->row();

    if ($result) {
        echo json_encode(['status' => 'success', 'available_rooms' => 1]); // 1 means available
    } else {
        echo json_encode(['status' => 'error', 'available_rooms' => 0]);
    }
}





public function update_booking()
{
    // Load the Booking Model
    $this->load->model('Booking_model');

    // Get POST data
    $id = $this->input->post('id');
    $data = [
        'customer_name' => $this->input->post('customer_name'),
        'id_number' => $this->input->post('id_number'),
        'phone_number' => $this->input->post('phone_number'),
        'customer_email' => $this->input->post('customer_email'),
        'check_in' => $this->input->post('check_in'),
        'check_out' => $this->input->post('check_out'),
        'room_id' => $this->input->post('room_id'),
    ];

    // Update the record
    $this->Booking_model->update_booking($id, $data);

    // Redirect to the booking list with a success message
    $this->session->set_flashdata('success', 'Booking updated successfully!');
    redirect('Book_list');
}


public function get_booking_details() {
    $CI =& get_instance();
    $CI->load->database();

    // Get the booking details along with customer information
    $CI->db->select('b.id AS booking_id, b.id_number, b.room_type, b.check_in, b.check_out, b.number_of_rooms, 
                     b.total_nights, b.actual_price, b.payment_method, b.status, ci.phone_number, ci.id_number AS customer_id_number');
    $CI->db->from('bookings b');
    $CI->db->join('customer_info ci', 'ci.customer_id = b.customer_id', 'left');
    $CI->db->where('b.status', 1);  // Example: Fetch only paid bookings
    $query = $CI->db->get();

    // Pass the result to the view
    $data['bookings'] = $query->result();

    $CI->load->view('more', $data);
}


}
