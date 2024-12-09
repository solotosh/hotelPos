<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping_model extends CI_Model {
	
	private $table = 'shipping_method';
 
	public function create($data = array())
	{
		return $this->db->insert($this->table, $data);
	}
	public function delete($id = null)
	{
		$this->db->where('ship_id',$id)
			->delete($this->table);

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	} 




	public function update($data = array())
	{
		return $this->db->where('ship_id',$data["ship_id"])
			->update($this->table, $data);
	}

    public function read($limit = null, $start = null)
	{
	   $this->db->select('*');
        $this->db->from($this->table);
        $this->db->order_by('ship_id', 'desc');
        $this->db->limit($limit, $start);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();    
        }
        return false;
	} 

	public function findById($id = null)
	{ 
		return $this->db->select("*")->from($this->table)
			->where('ship_id',$id) 
			->get()
			->row();
	} 

 
public function countlist()
	{
		$this->db->select('*');
        $this->db->from($this->table);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();  
        }
        return false;
	}
public function read_all($select_items, $table, $orderby,$delitem="",$stype="",$val="")
		{
			$this->db->select($select_items);
			$this->db->from($table);
			if($delitem!=""){
			$this->db->where($delitem,0);
			}
			if($stype!=""){
			$this->db->where($stype,$val);
			}
			$this->db->order_by($orderby,'DESC');
			return $this->db->get()->result();
		}
    
}
