<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reservation_model extends CI_Model {
	
	private $table = 'tblreservation';
 
	public function create($data = array())
	{
		return $this->db->insert($this->table, $data);
	}

		// ... existing code ...
	
		public function all_rooms()
		{
			$this->db->select('*');
			$this->db->from('rooms'); // Assuming 'rooms' is the table name for rooms
			$query = $this->db->get();
			if ($query->num_rows() > 0) {
				return $query->result();
			}
			return false;
		}
	
		public function add_room($data = array())
		{
			return $this->db->insert('rooms', $data); // Assuming 'rooms' is the table name for rooms
		}
	
		// ... existing code ...
	}



