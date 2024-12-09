<?php

class App_android_model extends CI_Model
{

    public function insert_data($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function update_date($table, $data, $field_name, $field_value)
    {
        $this->db->where($field_name, $field_value);
        $this->db->update($table, $data);
        return $this->db->affected_rows();
    }

    public function read($select_items, $table, $where_array)
    {
        $this->db->select($select_items);
        $this->db->from($table);
        foreach ($where_array as $field => $value) {
            $this->db->where($field, $value);
        }
        return $this->db->get()->row();
    }
   public function read2($select_items, $table, $orderby, $where_array)
			{
			   
				$this->db->select($select_items);
				$this->db->from($table);
				foreach ($where_array as $field => $value) {
					$this->db->where($field, $value);
					
				}
				$this->db->order_by($orderby,'DESC');
				return $this->db->get()->result();
			}
	public function headcode(){
	$query=$this->db->query("SELECT MAX(HeadCode) as HeadCode FROM acc_coa WHERE HeadLevel='4' And HeadCode LIKE '102030%'");
	return $query->row();
    } 
	public function orderlist($waiter,$status){
		$Today=date('Y-m-d');
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->where('customer_order.waiter_id',$waiter);
		$this->db->where('customer_order.order_status',$status);
		$this->db->where('customer_order.order_date',$Today);
		$this->db->order_by('customer_order.order_id','desc');
		$query = $this->db->get();
		$orderdetails=$query->result();
	    return $orderdetails;
		}
	public function allorderlist($waiter,$status,$limit = null, $start = null){
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->where('customer_order.waiter_id',$waiter);
		$this->db->where('customer_order.order_status',$status);
		$this->db->order_by('customer_order.order_id', 'DESC');
		$this->db->limit($limit, $start);
		$query = $this->db->get();
		$orderdetails=$query->result();
	    return $orderdetails;
		}
	 public function count_comorder($waiter,$status)
	{
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->join('bill','customer_order.order_id=bill.order_id','left');
		$this->db->where('customer_order.waiter_id',$waiter);
		$this->db->where('customer_order.order_status',$status);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->num_rows();  
        }
        return false;
	}  
    public function read_all($select_items, $table, $field_name, $field_value, $order_by_name = NULL, $order_by = NULL)
    {
        $this->db->select($select_items);
        $this->db->from($table);
        $this->db->where($field_name, $field_value);

        if ($order_by_name != NULL && $order_by != NULL)
        {
            $this->db->order_by($order_by_name, $order_by);
        }
        return $this->db->get()->result();
    }
	public function get_all($select_items, $table, $orderby)
		{
			$this->db->select($select_items);
			$this->db->from($table);
			$this->db->order_by($orderby,'ASC');
			return $this->db->get()->result();
		}
 

    public function authenticate_user($table, $data)
    {
        $Type = $data['email'];
        $Password = $data['password'];
        $this->db->select("user.id,user.firstname, user.lastname, user.email, employee_history.picture");
		$this->db->join("employee_history",'employee_history.emp_his_id=user.id','left');
		$this->db->where('employee_history.pos_id', 6);
		$this->db->where('user.email', $data['email']);
        $this->db->where("(user.password = '" . $Password . "' OR user.password =  '" . md5($Password) . "')", NULL, TRUE);
        $query = $this->db->get($table)->row();
        $num_rows = $this->db->count_all_results();
        if ($num_rows > 0)
        {
			return $query;
        }
        else
        {
            return FALSE;
        }
    }

    public function checkEmailOrPhoneIsRegistered($table, $data)
    {
        $this->db->select('email, password');
		$this->db->where('email', $data['email']);
        $query = $this->db->get($table)->row();
        $num_rows = $this->db->count_all_results();

        if ($num_rows > 0)
        {
            return $query;
        }
        else
        {
            return FALSE;
        }
    }


    public function check_user($data)
    {

        $this->db->where('UserUUID', $data['UserUUID']);
        $this->db->where('Session', $data['Session']);
        $query = $this->db->get('tbluser');

        if ($query->num_rows() > 0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
	public function categorylist($catid){
		$this->db->select('CategoryID,Name,CategoryImage');
        $this->db->from('item_category');
		if(!empty($catid)){
		$this->db->like('Name',$catid);
		}
		$this->db->where('CategoryIsActive',1);
		$this->db->where('parentid',0);
		$this->db->group_by('CategoryID');
		$query = $this->db->get();
		$categorylist=$query->result();
	    return $categorylist;
		}
	public function allfoodlist(){
		$taxitems= $this->taxchecking();
		$this->db->select('item_foods.ProductsID,item_foods.CategoryID,item_foods.ProductName,item_foods.ProductImage,item_foods.component,item_foods.itemnotes,item_foods.descrip,item_foods.productvat,item_foods.OffersRate,item_foods.offerIsavailable,item_foods.offerstartdate,item_foods.offerendate,item_foods.ProductsIsActive,variant.variantid,variant.variantName,variant.price');
        $this->db->from('item_foods');
		$this->db->join('variant','item_foods.ProductsID=variant.menuid','left');
		$this->db->where('item_foods.ProductsIsActive',1);
	    $this->db->where('variant.menuid>0');
		$this->db->group_by('item_foods.ProductsID');
		$query = $this->db->get();
		$itemlist=$query->result();
		//echo $this->db->last_query();
		$output=array();
	    if(!empty($itemlist)){
			$k=0;
			foreach($itemlist as $items){
				$varientinfo=$this->db->select("variant.*,count(menuid) as totalvarient")->from('variant')->where('menuid',$items->ProductsID)->get()->row();
				if(!empty($varientinfo)){
					$output[$k]['variantid']=$varientinfo->variantid;
					$output[$k]['totalvarient']=$varientinfo->totalvarient;
					$output[$k]['variantName']=$varientinfo->variantName;
					$output[$k]['price']=$varientinfo->price;
				}else{
					$output[$k]['variantid']='';
					$output[$k]['totalvarient']=0;
					$output[$k]['variantName']='';
					$output[$k]['price']='';
					}
				$output[$k]['ProductsID']=$items->ProductsID;
				$output[$k]['CategoryID']=$items->CategoryID;
				$output[$k]['ProductName']=$items->ProductName;
				$output[$k]['ProductImage']=$items->ProductImage;
				$output[$k]['bigthumb']=$items->bigthumb;
				$output[$k]['medium_thumb']=$items->medium_thumb;
				$output[$k]['small_thumb']=$items->small_thumb;
				$output[$k]['component']=$items->component;
				$output[$k]['descrip']=$items->descrip;
				$output[$k]['itemnotes']=$items->itemnotes;
				$output[$k]['menutype']=$items->menutype;
				$output[$k]['productvat']=$items->productvat;
				if(!empty($taxitems)){
                        $tx=0;
                        foreach ($taxitems as $taxitem) {
                           $field_name = 'tax'.$tx; 
                           $fieldlebel=$taxitem['tax_name'];
                           $output[$k][$fieldlebel]=$items->$field_name;
                           $tx++;
                        }
				}
				$output[$k]['special']=$items->special;
				$output[$k]['OffersRate']=$items->OffersRate;
				$output[$k]['offerIsavailable']=$items->offerIsavailable;
				$output[$k]['offerstartdate']=$items->offerstartdate;
				$output[$k]['offerendate']=$items->offerendate;
				$output[$k]['Position']=$items->Position;
				$output[$k]['kitchenid']=$items->kitchenid;
				$output[$k]['isgroup']=$items->isgroup;
				$output[$k]['is_customqty']=$items->is_customqty;
				$output[$k]['cookedtime']=$items->cookedtime;
				$output[$k]['ProductsIsActive']=$items->ProductsIsActive;
				$k++;	
				}
		}
		 return $output;
		}
	public function allsublist($catid){
		$this->db->select('CategoryID,Name,CategoryImage');
        $this->db->from('item_category');
		$this->db->where('parentid',$catid);
		$query = $this->db->get();
		$categorylist=$query->result();
		//print_r($categorylist);
	    return $categorylist;
		}
	public function foodlist($CategoryID=null){
		/*$this->db->select('item_foods.ProductsID,item_foods.ProductName,item_foods.ProductImage,item_foods.component,item_foods.itemnotes,item_foods.descrip,item_foods.productvat,item_foods.OffersRate,item_foods.offerIsavailable,item_foods.offerstartdate,item_foods.offerendate,item_foods.ProductsIsActive,variant.variantid,variant.variantName,variant.price');
        $this->db->from('item_foods');
		$this->db->join('variant','item_foods.ProductsID=variant.menuid','left');
		$this->db->where('item_foods.ProductsIsActive',1);
		$this->db->where('item_foods.CategoryID',$CategoryID);
	    $this->db->where('variant.menuid>0');*/
		$taxitems= $this->taxchecking();
		$this->db->select('*');
        $this->db->from('item_foods');
		$this->db->where('ProductsIsActive',1);
		$this->db->where('CategoryID',$CategoryID);		
		$query = $this->db->get();
		$itemlist=$query->result();
		$output=array();
	    if(!empty($itemlist)){
			$k=0;
			foreach($itemlist as $items){
				$varientinfo=$this->db->select("variant.*,count(menuid) as totalvarient")->from('variant')->where('menuid',$items->ProductsID)->get()->row();
				if(!empty($varientinfo)){
					$output[$k]['variantid']=$varientinfo->variantid;
					$output[$k]['totalvarient']=$varientinfo->totalvarient;
					$output[$k]['variantName']=$varientinfo->variantName;
					$output[$k]['price']=$varientinfo->price;
				}else{
					$output[$k]['variantid']='';
					$output[$k]['totalvarient']=0;
					$output[$k]['variantName']='';
					$output[$k]['price']='';
					}
				$output[$k]['ProductsID']=$items->ProductsID;
				$output[$k]['CategoryID']=$items->CategoryID;
				$output[$k]['ProductName']=$items->ProductName;
				$output[$k]['ProductImage']=$items->ProductImage;
				$output[$k]['bigthumb']=$items->bigthumb;
				$output[$k]['medium_thumb']=$items->medium_thumb;
				$output[$k]['small_thumb']=$items->small_thumb;
				$output[$k]['component']=$items->component;
				$output[$k]['descrip']=$items->descrip;
				$output[$k]['itemnotes']=$items->itemnotes;
				$output[$k]['menutype']=$items->menutype;
				$output[$k]['productvat']=$items->productvat;
				if(!empty($taxitems)){
                        $tx=0;
                        foreach ($taxitems as $taxitem) {
                           $field_name = 'tax'.$tx; 
                           $fieldlebel=$taxitem['tax_name'];
                           $output[$k][$fieldlebel]=$items->$field_name;
                           $tx++;
                        }
				}
				$output[$k]['special']=$items->special;
				$output[$k]['OffersRate']=$items->OffersRate;
				$output[$k]['offerIsavailable']=$items->offerIsavailable;
				$output[$k]['offerstartdate']=$items->offerstartdate;
				$output[$k]['offerendate']=$items->offerendate;
				$output[$k]['Position']=$items->Position;
				$output[$k]['kitchenid']=$items->kitchenid;
				$output[$k]['isgroup']=$items->isgroup;
				$output[$k]['is_customqty']=$items->is_customqty;
				$output[$k]['cookedtime']=$items->cookedtime;
				$output[$k]['ProductsIsActive']=$items->ProductsIsActive;
				$k++;	
				}
		}
	    return $output;
		}
		public function foodlistallcat($CategoryID){
		$taxitems= $this->taxchecking();
	    $weherein='item_foods.CategoryID IN('.$CategoryID.')';
		$this->db->select('*');
        $this->db->from('item_foods');
		$this->db->where('ProductsIsActive',1);
		$weherein='item_foods.CategoryID IN('.$CategoryID.')';	
		$query = $this->db->get();
		$itemlist=$query->result();
		$output=array();
	    if(!empty($itemlist)){
			$k=0;
			foreach($itemlist as $items){
				$varientinfo=$this->db->select("variant.*,count(menuid) as totalvarient")->from('variant')->where('menuid',$items->ProductsID)->get()->row();
				if(!empty($varientinfo)){
					$output[$k]['variantid']=$varientinfo->variantid;
					$output[$k]['totalvarient']=$varientinfo->totalvarient;
					$output[$k]['variantName']=$varientinfo->variantName;
					$output[$k]['price']=$varientinfo->price;
				}else{
					$output[$k]['variantid']='';
					$output[$k]['totalvarient']=0;
					$output[$k]['variantName']='';
					$output[$k]['price']='';
					}
				$output[$k]['ProductsID']=$items->ProductsID;
				$output[$k]['CategoryID']=$items->CategoryID;
				$output[$k]['ProductName']=$items->ProductName;
				$output[$k]['ProductImage']=$items->ProductImage;
				$output[$k]['bigthumb']=$items->bigthumb;
				$output[$k]['medium_thumb']=$items->medium_thumb;
				$output[$k]['small_thumb']=$items->small_thumb;
				$output[$k]['component']=$items->component;
				$output[$k]['descrip']=$items->descrip;
				$output[$k]['itemnotes']=$items->itemnotes;
				$output[$k]['menutype']=$items->menutype;
				$output[$k]['productvat']=$items->productvat;
				if(!empty($taxitems)){
                        $tx=0;
                        foreach ($taxitems as $taxitem) {
                           $field_name = 'tax'.$tx; 
                           $fieldlebel=$taxitem['tax_name'];
                           $output[$k][$fieldlebel]=$items->$field_name;
                           $tx++;
                        }
				}
				$output[$k]['special']=$items->special;
				$output[$k]['OffersRate']=$items->OffersRate;
				$output[$k]['offerIsavailable']=$items->offerIsavailable;
				$output[$k]['offerstartdate']=$items->offerstartdate;
				$output[$k]['offerendate']=$items->offerendate;
				$output[$k]['Position']=$items->Position;
				$output[$k]['kitchenid']=$items->kitchenid;
				$output[$k]['isgroup']=$items->isgroup;
				$output[$k]['is_customqty']=$items->is_customqty;
				$output[$k]['cookedtime']=$items->cookedtime;
				$output[$k]['ProductsIsActive']=$items->ProductsIsActive;
				$k++;	
				}
		}
	    return $output;
		}
	public function findaddons($id = null)
	{ 
		$this->db->select('add_ons.*');
        $this->db->from('menu_add_on');
		$this->db->join('add_ons','menu_add_on.add_on_id = add_ons.add_on_id','left');
		$this->db->where('menu_id',$id);
		$query = $this->db->get();
		$addons=$query->result();
	    return $addons;
	}

   public function allincomminglist(){
			$currentdate=date('Y-m-d');
			$condition="(customer_order.waiter_id IS NULL OR customer_order.waiter_id='') AND customer_order.order_date='".$currentdate."' AND customer_order.order_status!=5";
			$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
			$this->db->from('customer_order');
			$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
			$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
			$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
			$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
			$this->db->where('customer_order.isthirdparty',0);
			$this->db->where('customer_order.cutomertype',2);
			$this->db->where($condition);
			$this->db->order_by('customer_order.order_id', 'ASC');
			$query = $this->db->get();
			//echo $this->db->last_query();
			return $orderdetails=$query->result();
		} 
	
    	public function get_ongoingorder(){
		$cdate=date('Y-m-d');
		$where="customer_order.order_date = '".$cdate."' AND ((customer_order.order_status = 1 OR customer_order.order_status = 2 OR customer_order.order_status = 3) AND ((customer_order.cutomertype = 99 AND customer_order.orderacceptreject = 1) || (customer_order.cutomertype = 3 || customer_order.orderacceptreject != 1) || (customer_order.cutomertype = 4 || customer_order.orderacceptreject != 1) || (customer_order.cutomertype = 1 || customer_order.orderacceptreject != 1)))";
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->where($where);
		$this->db->order_by('customer_order.order_id','desc');
		$query = $this->db->get();
		//echo $this->db->last_query();
		$orderdetails=$query->result();
	    return $orderdetails;
		}
		public function get_completeorder(){
		$cdate=date('Y-m-d');
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename,bill.bill_status');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->join('bill','customer_order.order_id=bill.order_id','left');
		$this->db->where('customer_order.order_date',$cdate);
		$this->db->where('bill.bill_status',1);
		$this->db->order_by('customer_order.order_id','desc');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
		    
		}
		public function get_onlineeorder(){
		$cdate=date('Y-m-d');
		$previousday = date('Y-m-d', strtotime($cdate. ' -2 days'));
		$condi = "customer_order.order_date BETWEEN '".$previousday."' AND '".$cdate."'";
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename,bill.bill_status');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->join('bill','customer_order.order_id=bill.order_id','left');
		$this->db->where($condi);
		$this->db->where('customer_order.cutomertype',2);
		$this->db->order_by('customer_order.order_id','desc');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
		    
		}
		public function get_qrorder(){
		$cdate=date('Y-m-d');
		$previousday = date('Y-m-d', strtotime($cdate. ' -2 days'));
		$condi = "customer_order.order_date BETWEEN '".$previousday."' AND '".$cdate."'";
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename,bill.bill_status');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->join('bill','customer_order.order_id=bill.order_id','left');
		$this->db->where($condi);
		$this->db->where('customer_order.cutomertype',99);
		$this->db->order_by('customer_order.order_id','desc');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $query->result();
		    
		}
	public function get_orderlist(){
		$cdate=date('Y-m-d');
		$where="customer_order.order_date = '".$cdate."' AND ((customer_order.order_status = 1 OR customer_order.order_status = 2 OR customer_order.order_status = 3) AND ((customer_order.cutomertype = 2 AND customer_order.orderacceptreject = 1) || (customer_order.cutomertype = 99 AND customer_order.orderacceptreject = 1) || (customer_order.cutomertype = 1 || customer_order.orderacceptreject != 1)))";
		$this->db->select('customer_order.*,customer_info.customer_name,customer_type.customer_type,employee_history.first_name,employee_history.last_name,rest_table.tablename');
        $this->db->from('customer_order');
		$this->db->join('customer_info','customer_order.customer_id=customer_info.customer_id','left');
		$this->db->join('customer_type','customer_order.cutomertype=customer_type.customer_type_id','left');
		$this->db->join('employee_history','customer_order.waiter_id=employee_history.emp_his_id','left');
		$this->db->join('rest_table','customer_order.table_no=rest_table.tableid','left');
		$this->db->where($where);
		$this->db->group_by('customer_order.order_id');
		$this->db->order_by('customer_order.order_status','desc');
		$query = $this->db->get();
		//echo $this->db->last_query();
		$orderdetails=$query->result();
	    return $orderdetails;
		}
	public function get_itemlist($id){
			$this->db->select('order_menu.*,item_foods.ProductName,variant.variantid,variant.variantName,variant.price');
			$this->db->from('order_menu');
			$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','left');
			$this->db->join('variant','order_menu.varientid=variant.variantid','left');
			$this->db->where('order_menu.order_id',$id);
			$query = $this->db->get();
			$orderinfo=$query->result();
			return $orderinfo;
		}
	public function banklist()
	{
		 $data = $this->db->select("*")->from('tbl_bank')->get()->result();
		 return $data;
	}
	public function terminallist()
	{
		$data = $this->db->select("*")->from('tbl_card_terminal')->get()->result();
		return $data;
	}
	public function paymetmethodlist()
	{
		$data = $this->db->select("*")->from('payment_method')->where('is_active',1)->get()->result();
		return $data;
	}
	public function customerorder($id,$nststus=null){
		if(!empty($nststus)){
		$where="order_menu.order_id = '".$id."' AND order_menu.isupdate='".$nststus."' ";
		}
		else{
			$where="order_menu.order_id = '".$id."' ";
			}
		$sql="SELECT order_menu.row_id,order_menu.order_id,order_menu.groupmid as menu_id,order_menu.notes,order_menu.add_on_id,order_menu.addonsqty,order_menu.groupvarient as varientid,order_menu.addonsuid,order_menu.qroupqty as menuqty,order_menu.price as price,order_menu.isgroup,order_menu.food_status,order_menu.allfoodready,order_menu.isupdate, item_foods.ProductName, variant.variantid, variant.variantName, variant.price as mprice FROM order_menu LEFT JOIN item_foods ON order_menu.groupmid=item_foods.ProductsID LEFT JOIN variant ON order_menu.groupvarient=variant.variantid WHERE {$where} AND order_menu.isgroup=1 Group BY order_menu.groupmid UNION SELECT order_menu.row_id,order_menu.order_id,order_menu.menu_id as menu_id,order_menu.notes,order_menu.add_on_id,order_menu.addonsqty,order_menu.varientid as varientid,order_menu.addonsuid,order_menu.menuqty as menuqty,order_menu.price as price,order_menu.isgroup,order_menu.food_status,order_menu.allfoodready,order_menu.isupdate, item_foods.ProductName, variant.variantid, variant.variantName, variant.price as mprice FROM order_menu LEFT JOIN item_foods ON order_menu.menu_id=item_foods.ProductsID LEFT JOIN variant ON order_menu.varientid=variant.variantid WHERE {$where} AND order_menu.isgroup=0";
		$query=$this->db->query($sql);
		//echo $this->db->last_query();
        return $query->result();
		}
	#check productiondetails
	public function checkproductiondetails($foodid,$fvid,$foodqty)
	{
		$checksetitem=$this->db->select('ProductsID,isgroup')->from('item_foods')->where('ProductsID',$foodid)->where('isgroup',1)->get()->row();
		if(!empty($checksetitem)){
			$groupitemlist=$this->db->select('items,varientid,item_qty')->from('tbl_groupitems')->where('gitemid',$checksetitem->ProductsID)->get()->result();
			foreach($groupitemlist as $groupitem){
				$this->db->select('*');
				$this->db->from('production_details');
				$this->db->where('foodid',$groupitem->items);
				$this->db->where('pvarientid',$groupitem->varientid);
				$productiondetails = $this->db->get()->result();
					 foreach($productiondetails as $productiondetail){
							$r_stock = $productiondetail->qty*($foodqty*$groupitem->item_qty);
							/*add stock in ingredients*/
							$this->db->set('stock_qty', 'stock_qty-'.$r_stock, FALSE);
							$this->db->where('id', $productiondetail->ingredientid);
							$this->db->update('ingredients');
							/*end add ingredients*/
					 }
				}
		}else{
			$this->db->select('*');
				$this->db->from('production_details');
				$this->db->where('foodid',$foodid);
				$this->db->where('pvarientid',$fvid);
				$productiondetails = $this->db->get()->result();
				foreach($productiondetails as $productiondetail){
					$r_stock = $productiondetail->qty*$foodqty;
					/*add stock in ingredients*/
						$this->db->set('stock_qty', 'stock_qty-'.$r_stock, FALSE);
						$this->db->where('id', $productiondetail->ingredientid);
						$this->db->update('ingredients');
						/*end add ingredients*/
				}
			}


	}
	public function insert_product($foodid,$vid,$foodqty)
	{
		$saveid=$this->input->post('id');
		$p_id = $foodid;
		$newdate= date('Y-m-d');
		$exdate= date('Y-m-d');
		$data=array(
			'itemid'				  =>	$foodid,
			'itemvid'				  =>	$vid,
			'itemquantity'			  =>	$foodqty,
			'savedby'	     		  =>	$saveid,
			'saveddate'	              =>	$newdate,
			'productionexpiredate'	  =>	$exdate
		);
		$this->checkproductiondetails($foodid,$vid,$foodqty);
		 $this->db->insert('production',$data);

		$returnid = $this->db->insert_id();
		return true;
	
	}
	public function margeview($id){
		$this->db->select('customer_order.*,order_menu.*,item_foods.ProductName,variant.variantid,variant.variantName,variant.price');
        $this->db->from('customer_order');		
		$this->db->join('order_menu','customer_order.order_id=order_menu.order_id','left');
		$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','Inner');
		$this->db->join('variant','order_menu.varientid=variant.variantid','Inner');
		$this->db->where('customer_order.marge_order_id',$id);
		$query = $this->db->get();
		//echo $this->db->last_query();
		if ($query->num_rows() > 0) {
			return $query->result();	
		}
		return false;
		}
	public function margebill($id){
		$this->db->select('customer_order.*,bill.total_amount,bill.bill_amount,bill.bill_status,bill.service_charge,bill.discount,bill.VAT');
        $this->db->from('customer_order');		
		$this->db->join('bill','customer_order.order_id=bill.order_id','left');
		$this->db->where('customer_order.marge_order_id',$id);
		$query = $this->db->get();
		if ($query->num_rows() > 0) {
			return $query->result();	
		}
		return false;
		}
	public function settinginfo()
	{ 
		return $this->db->select("*")->from('setting')
			->get()
			->row();
	}
	public function currencysetting($id = null)
	{ 
		return $this->db->select("*")->from('currency')
			->where('currencyid',$id) 
			->get()
			->row();
	}
	public function billinfo($id = null){
		$this->db->select('*');
        $this->db->from('bill');
		$this->db->where('order_id',$id);
		$query = $this->db->get();
		$billinfo=$query->row();
		return $billinfo;
		}
	public function updateSuborderData($rowid){
		$this->db->select('order_menu.*,item_foods.ProductName,variant.variantid,variant.variantName,variant.price');
        $this->db->from('order_menu');
		$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','left');
		$this->db->join('variant','order_menu.varientid=variant.variantid','left');
		$this->db->where('order_menu.row_id',$rowid);
		
		$query = $this->db->get();
		$orderinfo=$query->row();
	    return $orderinfo;
	}
	public function updateSuborderDatalist($rowidarray){
		$this->db->select('order_menu.*,item_foods.*,variant.variantName,variant.price');
        $this->db->from('order_menu');
		$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','left');
		$this->db->join('variant','order_menu.varientid=variant.variantid','left');
		$this->db->where_in('order_menu.row_id',$rowidarray);
		
		$query = $this->db->get();
		$orderinfo=$query->result();
		//echo $this->db->last_query();
	    return $orderinfo;
	}
 public function getiteminfo($id = null)
	{ 
		$this->db->select('*');
        $this->db->from('item_foods');
		$this->db->where('ProductsID',$id);
		$query = $this->db->get();
		$itemlist=$query->row();
	    return $itemlist;
	}
  private function taxchecking()
    {
		$taxinfos = '';
    	if ($this->db->table_exists('tbl_tax')) {
    		$taxsetting = $this->db->select('*')->from('tbl_tax')->get()->row();
    	}
    	if($taxsetting->tax == 1){
    	$taxinfos = $this->db->select('*')->from('tax_settings')->get()->result_array();
    		}
    		
          return $taxinfos;

    }
    public function counterlist()
	{ 
		$this->db->select('*');
        $this->db->from('tbl_cashcounter');
		$query = $this->db->get();
		$itemlist=$query->result();
	    return $itemlist;
	}
 public function collectcash($id,$tdate){
		$crdate=date('Y-m-d H:i:s');
		$where="bill.create_at Between '$tdate' AND '$crdate'";
		$this->db->select('bill.*,multipay_bill.payment_type_id,SUM(multipay_bill.amount) as totalamount,payment_method.payment_method');
        $this->db->from('multipay_bill');
		$this->db->join('bill','bill.order_id=multipay_bill.order_id','left');
		$this->db->join('payment_method','payment_method.payment_method_id=multipay_bill.payment_type_id','left');
		$this->db->where('bill.create_by',$id);
		$this->db->where($where);
		$this->db->where('bill.bill_status',1);
		$this->db->group_by('multipay_bill.payment_type_id');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $orderdetails=$query->result();
		}
	
    public function billsummery($id,$tdate,$crdate){
		$where="bill.create_at Between '$tdate' AND '$crdate'";
		$this->db->select('SUM(bill.total_amount) as nitamount, SUM(bill.discount) as discount, SUM(bill.service_charge) as service_charge, SUM(bill.VAT) as VAT,SUM(bill.bill_amount) as bill_amount');
        $this->db->from('bill');
		$this->db->where('bill.create_by',$id);
		$this->db->where($where);
		$this->db->where('bill.bill_status',1);
		$query = $this->db->get();
		return $billinfo=$query->row();
		}
	public function collectcashsummery($id,$tdate,$crdate){
		$where="bill.create_at Between '$tdate' AND '$crdate'";
		$this->db->select('bill.*,multipay_bill.payment_type_id,SUM(multipay_bill.amount) as totalamount,payment_method.payment_method');
        $this->db->from('multipay_bill');
		$this->db->join('bill','bill.order_id=multipay_bill.order_id','left');
		$this->db->join('payment_method','payment_method.payment_method_id=multipay_bill.payment_type_id','left');
		$this->db->where('bill.create_by',$id);
		$this->db->where($where);
		$this->db->where('bill.bill_status',1);
		$this->db->group_by('multipay_bill.payment_type_id');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $orderdetails=$query->result();
		}
	public function changecashsummery($id,$tdate,$crdate){
		$where="bill.create_at Between '$tdate' AND '$crdate'";
		$this->db->select('bill.*,SUM(customer_order.totalamount) as totalexchange');
        $this->db->from('customer_order');
		$this->db->join('bill','bill.order_id=customer_order.order_id','left');
		$this->db->where('bill.create_by',$id);
		$this->db->where($where);
		$this->db->where('bill.bill_status',1);
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $changetotal=$query->row();
		}
	public function summeryiteminfo($id,$tdate,$frdate){
		$where="create_at Between '$tdate' AND '$frdate'";
		$this->db->select('bill.order_id');
        $this->db->from('bill');
		$this->db->where('create_by',$id);
		$this->db->where($where);
		$this->db->where('bill_status',1);
		$query = $this->db->get();
		$changetotal=$query->result();
		return $changetotal;
		
		}
	public function closingiteminfo($order_ids){
		$this->db->select('order_menu.*,SUM(order_menu.menuqty) as totalqty,SUM(order_menu.price*order_menu.menuqty) as fprice,item_foods.*,variant.variantName,variant.price');
        $this->db->from('order_menu');
		$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','left');
		$this->db->join('variant','order_menu.varientid=variant.variantid','left');
		$this->db->where_in('order_menu.order_id',$order_ids);
		$this->db->group_by('order_menu.menu_id');
		$this->db->group_by('order_menu.varientid');
		$query = $this->db->get();
		$orderinfo=$query->result();
		//echo $this->db->last_query();
		return $orderinfo;
	}
	public function closingaddons($order_ids){
		$newids="'".implode("','",$order_ids)."'";
			$condition="order_menu.order_id IN($newids) ";
		    $sql="SELECT * FROM order_menu WHERE {$condition} AND order_menu.add_on_id!=''";
		
		$query=$this->db->query($sql);
		$orderinfo=$query->result();
	    return $orderinfo;
	}
	public function customerupdateorderkitchen($id,$kitchen){
		$this->db->select('tbl_apptokenupdate.*,MAX(tbl_apptokenupdate.updateid) as id,item_foods.ProductsID,item_foods.ProductName,item_foods.kitchenid,item_foods.cookedtime,variant.variantid,variant.variantName,variant.price');
        $this->db->from('tbl_apptokenupdate');
		$this->db->join('item_foods','tbl_apptokenupdate.menuid=item_foods.ProductsID','left');
		$this->db->join('variant','tbl_apptokenupdate.varientid=variant.variantid','left');
		$this->db->where('tbl_apptokenupdate.ordid',$id);
		$this->db->where('item_foods.kitchenid',$kitchen);
		$this->db->where('tbl_apptokenupdate.isprint',0);
		$this->db->group_by('tbl_apptokenupdate.menuid');
		$this->db->group_by('tbl_apptokenupdate.varientid');
		$this->db->order_by('tbl_apptokenupdate.updateid');
		$query = $this->db->get();
		$orderinfo=$query->result();
		//echo $this->db->last_query();		
	    return $orderinfo;
		}
	public function customerorderkitchen($id,$kitchen){
		$this->db->select('order_menu.*,item_foods.ProductName,item_foods.kitchenid,item_foods.cookedtime,variant.variantid,variant.variantName,variant.price');
        $this->db->from('order_menu');
		$this->db->join('item_foods','order_menu.menu_id=item_foods.ProductsID','left');
		$this->db->join('variant','order_menu.varientid=variant.variantid','left');
		$this->db->where('order_menu.order_id',$id);
		$this->db->where('item_foods.kitchenid',$kitchen);
		$query = $this->db->get();
		$orderinfo=$query->result();		
	    return $orderinfo;
		}
	public function printerorder(){
			$sql="SELECT * FROM customer_order Where invoiceprint!=0 AND splitpay_status=0 AND customer_order.marge_order_id IS NULL UNION SELECT * FROM customer_order Where invoiceprint!=0 AND splitpay_status=0 AND customer_order.marge_order_id IS NOT NULL GROUP BY customer_order.marge_order_id order by order_id ASC";
		
		$query=$this->db->query($sql);
		
		$orderdetails=$query->result();
	    return $orderdetails;
		} 
}
