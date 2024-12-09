<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_model extends CI_Model {

    public function get_all_customers() {
        return $this->db->get('customer_info')->result_array();
    }



    // Method to get customer details by their ID
    public function get_customer_by_id($customer_id) {
        $this->db->where('id', $customer_id);
        $query = $this->db->get('customer_info');
        return $query->row(); // Return a single row object
    }

    // Method to add a new customer
    public function add_customer($customer_data) {
        return $this->db->insert('customer_info', $customer_data); // Insert customer data into 'customer_info' table
    }

    // Method to update customer information
    public function update_customer($customer_id, $customer_data) {
        $this->db->where('id', $customer_id);
        return $this->db->update('customer_info', $customer_data); // Update existing customer data
    }

    // Method to delete a customer by their ID
    public function delete_customer($customer_id) {
        $this->db->where('id', $customer_id);
        return $this->db->delete('customer_info'); // Delete the customer from the database
    }
}
