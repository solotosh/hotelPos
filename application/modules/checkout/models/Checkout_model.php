<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkout_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    public function get_booking_details($booking_id) {
        // Prepare the SQL query to fetch all the details of a specific booking based on its ID
        $sql = "SELECT * FROM booking WHERE booking_id = :booking_id";
        
        // Prepare the statement
        $stmt = $this->pdo->prepare($sql);
        
        // Bind the parameter
        $stmt->bindParam(':booking_id', $booking_id, PDO::PARAM_INT);
        
        // Execute the query
        $stmt->execute();
        
        // Fetch the results as an associative array
        $booking_details = $stmt->fetch(PDO::FETCH_ASSOC);
        
        // Return the fetched details
        return $booking_details;
    }
    
    }














  

