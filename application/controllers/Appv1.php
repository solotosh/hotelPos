<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Appv1 extends MY_Controller
{

	protected $FILE_PATH;
	public $themeinfo = '';
	public function __construct()
	{
		parent::__construct();
		$this->load->library('lsoft_setting');
		$this->load->model('App_android_model');
		$this->themeinfo = $this->db->select('*')->from('themes')->where('status', 1)->get()->row();
		$this->FILE_PATH = base_url('upload/');
	}

	public function index()
	{
		redirect('myurl');
	}

	public function sign_in()
	{
		// TO DO / Email or Phone only one required
		$this->load->library('form_validation');
		$this->form_validation->set_rules('email', 'Email', 'required|xss_clean|trim|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'required|xss_clean|trim');
		$this->form_validation->set_rules('token', 'token', 'xss_clean|trim');


		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$data['email']      = $this->input->post('email', TRUE);
			$data['password']   = $this->input->post('password', TRUE);
			//$token=$this->input->post('token', TRUE);

			$IsReg = $this->App_android_model->checkEmailOrPhoneIsRegistered('user', $data);

			if (!$IsReg) {
				return $this->respondUserNotReg('Cet e-mail ou ce numéro de téléphone n\'a pas encore été enregistré.');
			}
			$result = $this->App_android_model->authenticate_user('user', $data);

			//if(empty($result->waiter_kitchenToken)){
			$updatetData['waiter_kitchenToken']    			= $this->input->post('token', TRUE);
			$this->App_android_model->update_date('user', $updatetData, 'id', $result->id);
			//}

			$webseting =$this->App_android_model->read('powerbytxt,currency,servicecharge,logo,address,service_chargeType', 'setting', array('id' => 2));
				$currencyinfo = $this->App_android_model->read('currencyname,curr_icon', 'currency', array('currencyid' => $webseting->currency));
				$getmodule=$this->db->select('*')->from('module')->where('directory','qrapp')->get()->row();
				$placeorder=$this->db->select('*')->from('tbl_posetting')->get()->row();
				$quickorder=$this->db->select('*')->from('tbl_quickordersetting')->get()->row();
				if(!empty($getmodule)){
				$modulestatus=1;
				}else{
				$modulestatus=0;
				}
                if ($result != FALSE) {
                    $checkuser = $this->db->select('*')->from('tbl_cashregister')->where('userid',$result->id)->where('status',0)->order_by('id','DESC')->get()->row(); 
                    //print_r($checkuser);
		            $openamount = $this->db->select('closing_balance')->from('tbl_cashregister')->where('userid',$result->id)->where('closing_balance>','0.000')->order_by('id','DESC')->get()->row();
		            if(empty($checkuser)){
    		            if($openamount->closing_balance>'0.000'){
    				        $openingbalance=$openamount->closing_balance;
    			        }
            			else{
            				$openingbalance="0.000";
            				}
            		$counter="";
            		$registerid="";
		            }else{
		               $openingbalance=$checkuser->opening_balance; 
		               $counter=$checkuser->counter_no;
		               $registerid=$checkuser->id;
		            }
		            $closeinfo = $this->App_android_model->collectcash($result->id,$checkuser->opendate);
		           
					$str = substr($result->picture, 2);
					$result->{"UserPictureURL"}=base_url().$str;
					$result->{"logo"}=base_url().$webseting->logo;
					$result->{"address"}=$webseting->address;
					$result->{"PowerBy"}=$webseting->powerbytxt;
					$result->{"currencycode"}=$currencyinfo->currencyname;
					$result->{"currencysign"}=$currencyinfo->curr_icon;
					$result->{"servicecharge"}=$webseting->servicecharge;
					$result->{"service_chargeType"}=$webseting->service_chargeType;
					$result->{"placeorder"}=$placeorder;
					$result->{"quickorder"}=$quickorder;
					$result->{"qrmodule"}=$modulestatus;
					$result->{"cashregisterbalance"}=$openingbalance;
					$result->{"counter"}=$counter;
					$result->{"registerid"}=$registerid;
					$result->{"closebalance"}=$closeinfo;
				return $this->respondWithSuccess('Vous vous êtes connecté avec succès.', $result);
			} else {
				return $this->respondWithError('L\'e-mail et le mot de passe que vous avez saisis ne correspondent pas.', $result);
			}
		}
	}
	public function printcashregister(){
				$this->load->library('form_validation');
				$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
				if ($this->form_validation->run() == FALSE)
				{
					$errors = $this->form_validation->error_array();
					return $this->respondWithValidationError($errors);
				}
				else
				{
              	$output = array();
				$saveid= $this->input->post('id');
				$checkuser = $this->db->select('*')->from('tbl_cashregister')->where('userid',$saveid)->where('status',1)->order_by('id','DESC')->get()->row();
				$startdate= $checkuser->opendate;
				$enddate= $checkuser->closedate;
				
				$iteminfo=$this->App_android_model->summeryiteminfo($saveid,$startdate,$enddate);
				$i =0;
				$order_ids = array('');
				foreach($iteminfo as $orderid){
					 $order_ids[$i] = $orderid->order_id;
					 $i++;
					}
				$addonsitem  = $this->App_android_model->closingaddons($order_ids);		
					$k=0;
				   $test=array();
				   foreach($addonsitem as $addonsall){
							$addons=explode(",",$addonsall->add_on_id);
							$addonsqty=explode(",",$addonsall->addonsqty);
							$x=0;
							foreach($addons as $addonsid){
									$test[$k][$addonsid]=$addonsqty[$x];
									$x++;
							}
							$k++;
					   }
					   
					$final = array();
					array_walk_recursive($test, function($item, $key) use (&$final){
						$final[$key] = isset($final[$key]) ?  $item + $final[$key] : $item;
					});
					$totalprice=0;
					foreach($final as $key=>$item){
						$addonsinfo=$this->db->select("*")->from('add_ons')->where('add_on_id',$key)->get()->row();
						$totalprice=$totalprice+($addonsinfo->price*$item);
					}
					
				$userinfo=$this->db->select("*")->from('user')->where('id',$saveid)->get()->row();	
				$invsetting=$this->db->select('*')->from('tbl_invoicesetting')->where('invstid',1)->get()->row();
				$addonsprice=$totalprice;
				$registerinfo=$checkuser;
				$billinfo=$this->App_android_model->billsummery($saveid,$startdate,$enddate);
				$totalamount=$this->App_android_model->collectcashsummery($saveid,$startdate,$enddate);
				$totalchange=$this->App_android_model->changecashsummery($saveid,$startdate,$enddate);
				$itemsummery=$this->App_android_model->closingiteminfo($order_ids);
				$output['OpenDate']= $startdate;
				$output['CloseDate']=$enddate;
				$output['Counter']=$registerinfo->counter_no;
				$output['User']=$userinfo->firstname.' '.$userinfo->lastname;
				$output['TotalNetSale']=number_format($billinfo->nitamount,2);
				$output['Tax']=number_format($billinfo->VAT,2);
				$output['TotalSD']=number_format($billinfo->service_charge,2);
				$output['TotalSale']=number_format($totalsales,2);
				$output['TotalDiscount']=number_format($billinfo->discount,2);
				$output['TotalSD']=number_format($billinfo->service_charge,2);
				$output['AddonsPrice']=number_format($addonsprice,2);
				
				if($invsetting->isitemsummery==1){
				$output['isitemsummery']=1;
				}else{
				$output['isitemsummery']=1;
				}
				$itemtotal=0;
				$i=0;
				foreach($itemsummery as $item){
				$itemprice=$item->totalqty*$item->fprice;
				$itemtotal=$item->fprice+$itemtotal;
				$output['itemsummery'][$i]['productName']= $item->ProductName;
				$output['itemsummery'][$i]['quantity']=    $item->totalqty;
				$output['itemsummery'][$i]['price']=	   $item->fprice;
				$i++;	
				}
				$output['NetSales']=number_format($itemtotal+$addonsprice,2);
				$tototalsum= array_sum(array_column($totalamount, 'totalamount'));
				$changeamount=$tototalsum-$totalchange->totalexchange;
				$total=0;
				$k=0;
				foreach ($totalamount as $amount) {
					if($amount->payment_type_id==4){
						$payamount=$amount->totalamount-$changeamount;
					}else{
						$payamount=$amount->totalamount;
					}
					$total=$total+$payamount;
					$output['payment'][$k]['name']=$amount->payment_method;
					$output['payment'][$k]['amount']=number_format($payamount,2);
					$k++;
					
				}
				$output['TotalPayment']=number_format($total,2);
				$output['Totalchange']=number_format($changeamount,2);
				$output['Dayopening']=number_format($registerinfo->opening_balance,2);
				$output['Daycloseing']=number_format($registerinfo->closing_balance,2);
				$output['PrintDate']=date('Y-m-d H:i');
				return $this->respondWithSuccess('Day Closeing Report.', $output);
				}
			}
public function closinginfo(){
            $this->load->library('form_validation');
            $this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
            if ($this->form_validation->run() == FALSE)
            {
                $errors = $this->form_validation->error_array();
                return $this->respondWithValidationError($errors);
            }
            else
            {
              $output = array();
              $id= $this->input->post('id', TRUE);
              $checkuser = $this->db->select('*')->from('tbl_cashregister')->where('userid',$id)->where('status',0)->order_by('id','DESC')->get()->row(); 
              $closeinfo = $this->App_android_model->collectcash($id,$checkuser->opendate);
              $output['closebalance']=$closeinfo;
              return $this->respondWithSuccess('All Category List.', $output);  
            }
}
	public function sign_up()
	{
		// TO DO / Email or Phone only one required
		$this->load->library('form_validation');
		$this->form_validation->set_rules('customer_name', 'Customer Name', 'required|max_length[100]');
		$this->form_validation->set_rules('email', 'Email', 'required|is_unique[customer_info.customer_email]');
		$this->form_validation->set_rules('mobile', 'Mobile', 'required|is_unique[customer_info.customer_phone]');
		$this->form_validation->set_rules('password', 'Password', 'required');
		$this->form_validation->set_message('is_unique', 'Désolé, cette adresse %s a déjà été utilisée !');

		$coa = $this->App_android_model->headcode();
		if ($coa->HeadCode != NULL) {
			$headcode = $coa->HeadCode + 1;
		} else {
			$headcode = "102030101";
		}
		$lastid = $this->db->select("*")->from('customer_info')->order_by('cuntomer_no', 'desc')->get()->row();
		$sl = $lastid->cuntomer_no;
		if (empty($sl)) {
			$sl = "cus-0001";
		} else {
			$sl = $sl;
		}
		$supno = explode('-', $sl);
		$nextno = $supno[1] + 1;
		$si_length = strlen((int)$nextno);

		$str = '0000';
		$cutstr = substr($str, $si_length);
		$sino = $supno[0] . "-" . $cutstr . $nextno;

		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationregisError($errors);
		} else {
			$URL = base_url('assets/img/user/');
			// File Uplaod
			if (!empty($_FILES['UserPicture'])) {
				$config['upload_path']      = 'assets/img/user/';
				$config['allowed_types']    = 'gif|jpg|png|jpeg';
				$config['max_size']         = '5120';
				$config['file_name']        =  mt_rand() . '_' . time();
				$config['remove_spaces']    = TRUE;

				$this->load->library('upload', $config);

				if (!$this->upload->do_upload('UserPicture')) {
					return $this->respondWithError($this->upload->display_errors('', ''));
				}

				$upload_data = $this->upload->data();

				//resize
				$config['source_image']     = $upload_data['full_path'];
				$config['maintain_ratio']   = TRUE;
				$config['width']            = 350;
				$config['height']           = 265;

				$this->load->library('image_lib', $config);
				$this->image_lib->resize();

				$data['customer_picture'] = $upload_data['file_name'];

				$this->image_lib->clear();
			} else {
				$data['customer_picture'] = '';
			}

			$data['cuntomer_no']                = $sino;
			$data['customer_name']    			= $this->input->post('customer_name', TRUE);
			$data['customer_email']  			= $this->input->post('email', TRUE);
			$data['password']            		= md5($this->input->post('password', TRUE));
			$data['customer_address']    		= $this->input->post('Address', TRUE);
			$data['customer_phone']      		= $this->input->post('mobile', TRUE);
			//$data['customer_picture']    		= $this->input->post('UserPicture', TRUE);
			$data['favorite_delivery_address']  = $this->input->post('favouriteaddress', TRUE);
			$insert_ID = $this->App_android_model->insert_data('customer_info', $data);
			if ($insert_ID) {
				$output = $this->App_android_model->read("*", 'customer_info', array('customer_id' => $insert_ID));
				$output->{"UserPictureURL"} = $this->_get_user_profile_picture_url($output);
				$c_name = $this->input->post('customer_name');
				$c_acc = $sino . '-' . $c_name;
				$createdate = date('Y-m-d H:i:s');
				$postData1 = array(
					'HeadCode'         => $headcode,
					'HeadName'         => $c_acc,
					'PHeadName'        => 'Customer Receivable',
					'HeadLevel'        => '4',
					'IsActive'         => '1',
					'IsTransaction'    => '1',
					'IsGL'             => '0',
					'HeadType'         => 'A',
					'IsBudget'         => '0',
					'IsDepreciation'   => '0',
					'DepreciationRate' => '0',
					'CreateBy'         => $insert_ID,
					'CreateDate'       => $createdate,
				);
				$this->App_android_model->insert_data('acc_coa', $postData1);
				return $this->respondWithSuccess('Vous vous êtes inscrit avec succès.', $output);
			} else {
				return $this->respondWithError('Désolé, inscription annulée. Une erreur s\'est produite lors de l\'inscription. Veuillez réessayer plus tard.');
			}
		}
	}
	public function _get_user_profile_picture_url($data)
	{

		//print_r($data->customer_picture);
		return $this->FILE_PATH . '/' . $data->customer_picture;
	}
	public function categorylist()
	{
		// TO DO / Email or Phone only one required
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$catid = $this->input->post('Name', TRUE);
			$result = $this->App_android_model->categorylist($catid);
			$output = $categoryIDs = array();
			if ($result != FALSE) {
				$i = 0;
				foreach ($result as $list) {
					$image = substr($list->CategoryImage, 2);
					$output[$i]['CategoryID']  		= $list->CategoryID;
					$output[$i]['Name']  	   		= $list->Name;
					$output[$i]['categoryimage']  	= base_url() . $image;

					$i++;
				}
				return $this->respondWithSuccess('Liste de toutes les catégories.', $output);
			} else {
				//$output[0]['empty']="";
				return $this->respondWithError('Aucune catégorie trouvée.!!!', $output);
			}
		}
	}
	public function checktable()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('tableid', 'Table No', 'required');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$tableid = $this->input->post('tableid');
			$custinfo = $this->App_android_model->read('*', 'rest_table', array('tableid' => $tableid));
			if (!empty($custinfo)) {
				$output['table_no'] = $tableid;
				return $this->respondWithSuccess('La table existe.', $output);
			} else {
				$output['table_no'] = "";
				return $this->respondWithError('Table non trouvée!!!', $output);
			}
		}
	}
	public function allfoodlist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$taxitems = $this->taxchecking();
			$output = array();
			$result = $this->App_android_model->allfoodlist();
			if ($result != FALSE) {
				$restinfo = $this->App_android_model->read('vat', 'setting', array('id' => 2));
				$output['PcategoryID']  = $CategoryID;
				if ($restinfo == FALSE) {
					$output['Restaurantvat']  = 0;
				} else {
					$output['Restaurantvat']  = $restinfo->vat;
				}
				if (!empty($taxitems)) {
					$output['customevat']  = 1;
					$tx1 = 0;
					foreach ($taxitems as $taxitem) {
						$fieldlebel = $taxitem['tax_name'];
						$output[$fieldlebel] = $taxitem['default_value'];
						$tx1++;
					}
				} else {
					$output['customevat']  = 0;
				}
				$k = 0;
				foreach ($result as $productlist) {
					$productlist = (object)$productlist;
					if (!empty($productlist->ProductImage)) {
						$image = $productlist->ProductImage;
					} else {
						$image = "assets/img/no-image.png";
					}
					$addonsinfo = $this->App_android_model->findaddons($productlist->ProductsID);
					$output['foodinfo'][$k]['ProductsID']      = $productlist->ProductsID;
					$output['foodinfo'][$k]['CategoryID']      = $productlist->CategoryID;
					$output['foodinfo'][$k]['ProductName']      = $productlist->ProductName;
					$output['foodinfo'][$k]['ProductImage']     =  base_url() . $image;
					$output['foodinfo'][$k]['component']  	 	 = $productlist->component;
					$output['foodinfo'][$k]['destcription']  	 = $productlist->descrip;
					$output['foodinfo'][$k]['itemnotes']  	 	 = $productlist->itemnotes;
					$output['foodinfo'][$k]['productvat'] 		 = $productlist->productvat;
					$output['foodinfo'][$k]['OffersRate'] 		 = $productlist->OffersRate;
					$output['foodinfo'][$k]['offerIsavailable'] = $productlist->offerIsavailable;
					$output['foodinfo'][$k]['offerstartdate'] 	 = $productlist->offerstartdate;
					$output['foodinfo'][$k]['offerendate']		 = $productlist->offerendate;
					$output['foodinfo'][$k]['variantid'] 		 = $productlist->variantid;
					$output['foodinfo'][$k]['variantName'] 	 = $productlist->variantName;
					$output['foodinfo'][$k]['price'] 			 = $productlist->price;
					$output['foodinfo'][$k]['totalvariant'] 	 = $productlist->totalvarient;
					if (!empty($taxitems)) {
						$tx = 0;
						foreach ($taxitems as $taxitem) {
							$field_name = 'tax' . $tx;
							$fieldlebel = $taxitem['tax_name'];
							$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
							$tx++;
						}
					}
					if ($productlist->totalvarient > 1) {
						$allvarients = $this->App_android_model->read_all('*', 'variant', 'menuid', $productlist->ProductsID, 'menuid', 'ASC');
						$v = 0;
						foreach ($allvarients as $varientlist) {
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantid'] = $varientlist->variantid;
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantName'] = $varientlist->variantName;
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantPrice'] = $varientlist->price;
							$v++;
						}
					} else {
						$output['foodinfo'][$k]['varientlist'][0]['multivariantid'] = '';
						$output['foodinfo'][$k]['varientlist'][0]['multivariantName'] = '';
						$output['foodinfo'][$k]['varientlist'][0]['multivariantPrice'] = '';
					}
					if ($addonsinfo != FALSE) {
						$output['foodinfo'][$k]['addons'] 			 = 1;
						$x = 0;
						foreach ($addonsinfo as $alladdons) {
							$output['foodinfo'][$k]['addonsinfo'][$x]['addonsid']   	= $alladdons->add_on_id;
							$output['foodinfo'][$k]['addonsinfo'][$x]['add_on_name']   = $alladdons->add_on_name;
							$output['foodinfo'][$k]['addonsinfo'][$x]['addonsprice']   = $alladdons->price;
							if (!empty($taxitems)) {
								$txn = 0;
								foreach ($taxitems as $taxitem) {
									$field_name = 'tax' . $txn;
									$fieldlebel = $taxitem['tax_name'];
									$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
									$output['foodinfo'][$k]['addonsinfo'][$x][$fieldlebel]   = $alladdons->$field_name;
									$txn++;
								}
							}
							$x++;
						}
					} else {
						$output['foodinfo'][$k]['addons'] 			 = 0;
					}
					$k++;
				}
				return $this->respondWithSuccess('Liste des aliments de toute catégorie.', $output);
			} else {
				return $this->respondWithError('Nourriture introuvable. !!!', $output);
			}
		}
	}
	public function foodlist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('CategoryID', 'CategoryID', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$taxitems = $this->taxchecking();
			$CategoryID = $this->input->post('CategoryID', TRUE);
			$allcategory = $this->App_android_model->allsublist($CategoryID);
			$output = $categoryIDs = array();
			//if ($allcategory != FALSE) {
			if ($allcategory != FALSE) {
				$allcarlist = '';
				foreach ($allcategory as $catid) {
					$allcarlist .= $catid->CategoryID . ',';
				}
				$allcarlist = $allcarlist . $CategoryID;

				$result = $this->App_android_model->foodlistallcat($allcarlist);
			} else {
				$result = $this->App_android_model->foodlist($CategoryID);
			}
			if ($result != FALSE) {
				$restinfo = $this->App_android_model->read('vat', 'setting', array('id' => 2));
				$output['PcategoryID']  = $CategoryID;
				if ($restinfo == FALSE) {
					$output['Restaurantvat']  = 0;
				} else {
					$output['Restaurantvat']  = $restinfo->vat;
				}
				if (!empty($taxitems)) {
					$output['customevat']  = 1;
					$tx1 = 0;
					foreach ($taxitems as $taxitem) {
						$fieldlebel = $taxitem['tax_name'];
						$output[$fieldlebel] = $taxitem['default_value'];
						$tx1++;
					}
				} else {
					$output['customevat']  = 0;
				}
				$i = 1;
				//print_r($allcategory);
				$output['categoryinfo'][0]['CategoryID']  = $CategoryID;
				$output['categoryinfo'][0]['Name']  = "All";
				foreach ($allcategory as $list) {
					$output['categoryinfo'][$i]['CategoryID']  = $list->CategoryID;
					$output['categoryinfo'][$i]['Name']  = $list->Name;
					$i++;
				}

				$k = 0;
				foreach ($result as $productlist) {
					$productlist = (object)$productlist;
					if (!empty($productlist->ProductImage)) {
						$image = $productlist->ProductImage;
					} else {
						$image = "assets/img/no-image.png";
					}
					$addonsinfo = $this->App_android_model->findaddons($productlist->ProductsID);
					$output['foodinfo'][$k]['ProductsID']      = $productlist->ProductsID;
					$output['foodinfo'][$k]['ProductName']      = $productlist->ProductName;
					$output['foodinfo'][$k]['ProductImage']     =  base_url() . $image;
					$output['foodinfo'][$k]['component']  	 	 = $productlist->component;
					$output['foodinfo'][$k]['destcription']  	 = $productlist->descrip;
					$output['foodinfo'][$k]['itemnotes']  	 	 = $productlist->itemnotes;
					$output['foodinfo'][$k]['productvat'] 		 = $productlist->productvat;
					$output['foodinfo'][$k]['OffersRate'] 		 = $productlist->OffersRate;
					$output['foodinfo'][$k]['offerIsavailable'] = $productlist->offerIsavailable;
					$output['foodinfo'][$k]['offerstartdate'] 	 = $productlist->offerstartdate;
					$output['foodinfo'][$k]['offerendate']		 = $productlist->offerendate;
					$output['foodinfo'][$k]['variantid'] 		 = $productlist->variantid;
					$output['foodinfo'][$k]['variantName'] 	 = $productlist->variantName;
					$output['foodinfo'][$k]['price'] 			 = $productlist->price;
					$output['foodinfo'][$k]['totalvariant'] 	 = $productlist->totalvarient;
					if (!empty($taxitems)) {
						$tx = 0;
						foreach ($taxitems as $taxitem) {
							$field_name = 'tax' . $tx;
							$fieldlebel = $taxitem['tax_name'];
							$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
							$tx++;
						}
					}
					if ($productlist->totalvarient > 1) {
						$allvarients = $this->App_android_model->read_all('*', 'variant', 'menuid', $productlist->ProductsID, 'menuid', 'ASC');
						$v = 0;
						foreach ($allvarients as $varientlist) {
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantid'] = $varientlist->variantid;
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantName'] = $varientlist->variantName;
							$output['foodinfo'][$k]['varientlist'][$v]['multivariantPrice'] = $varientlist->price;
							$v++;
						}
					} else {
						$output['foodinfo'][$k]['varientlist'][0]['multivariantid'] = '';
						$output['foodinfo'][$k]['varientlist'][0]['multivariantName'] = '';
						$output['foodinfo'][$k]['varientlist'][0]['multivariantPrice'] = '';
					}
					if ($addonsinfo != FALSE) {
						$output['foodinfo'][$k]['addons'] 			 = 1;
						$x = 0;
						foreach ($addonsinfo as $alladdons) {
							$output['foodinfo'][$k]['addonsinfo'][$x]['addonsid']   	= $alladdons->add_on_id;
							$output['foodinfo'][$k]['addonsinfo'][$x]['add_on_name']   = $alladdons->add_on_name;
							$output['foodinfo'][$k]['addonsinfo'][$x]['addonsprice']   = $alladdons->price;
							if (!empty($taxitems)) {
								$txn = 0;
								foreach ($taxitems as $taxitem) {
									$field_name = 'tax' . $txn;
									$fieldlebel = $taxitem['tax_name'];
									$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
									$output['foodinfo'][$k]['addonsinfo'][$x][$fieldlebel]   = $alladdons->$field_name;
									$txn++;
								}
							}
							$x++;
						}
					} else {
						$output['foodinfo'][$k]['addons'] 			 = 0;
					}
					$k++;
				}
				return $this->respondWithSuccess('Liste des aliments de toute catégorie.', $output);
			} else {
				return $this->respondWithError('Nourriture introuvable. !!!', $output);
			}
		}
	}
	public function foodsearchbycategory()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('CategoryID', 'CategoryID', 'required|xss_clean|trim');
		$this->form_validation->set_rules('PcategoryID', 'Parent Category', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$taxitems = $this->taxchecking();
			$CategoryID = $this->input->post('CategoryID', TRUE);
			$PcategoryID = $this->input->post('PcategoryID', TRUE);
			$allcategory = $this->App_android_model->allsublist($PcategoryID);
			$output = $categoryIDs = array();
			$result = $this->App_android_model->foodlist($CategoryID);
			$restinfo = $this->App_android_model->read('vat', 'setting', array('id' => 2));
			$output['PcategoryID']  = $CategoryID;
			if ($restinfo == FALSE) {
				$output['Restaurantvat']  = 0;
			} else {
				$output['Restaurantvat']  = $restinfo->vat;
			}
			if (!empty($taxitems)) {
				$output['customevat']  = 1;
				$tx1 = 0;
				foreach ($taxitems as $taxitem) {
					$fieldlebel = $taxitem['tax_name'];
					$output[$fieldlebel] = $taxitem['default_value'];
					$tx1++;
				}
			} else {
				$output['customevat']  = 0;
			}
			//print_r($allcategory);
			$output['PcategoryID']  = $PcategoryID;
			$output['categoryinfo'][0]['CategoryID']  = $PcategoryID;
			$output['categoryinfo'][0]['Name']  = "All";
			$i = 1;
			foreach ($allcategory as $list) {
				$output['categoryinfo'][$i]['CategoryID']  = $list->CategoryID;
				$output['categoryinfo'][$i]['Name']  = $list->Name;
				$i++;
			}
			if ($result != FALSE) {
				$k = 0;
				if ($result == FALSE) {
					$output['foodinfo'] = array();
				} else {
					foreach ($result as $productlist) {
						$productlist = (object)$productlist;
						if (!empty($productlist->ProductImage)) {
							$image = $productlist->ProductImage;
						} else {
							$image = "assets/img/no-image.png";
						}
						$addonsinfo = $this->App_android_model->findaddons($productlist->ProductsID);
						$output['foodinfo'][$k]['ProductsID']       = $productlist->ProductsID;
						$output['foodinfo'][$k]['ProductName']      = $productlist->ProductName;
						$output['foodinfo'][$k]['ProductImage']     =  base_url() . $image;
						$output['foodinfo'][$k]['component']  	 	 = $productlist->component;
						$output['foodinfo'][$k]['destcription']  	 = $productlist->descrip;
						$output['foodinfo'][$k]['itemnotes']  	 	 = $productlist->itemnotes;
						$output['foodinfo'][$k]['productvat'] 		 = $productlist->productvat;
						$output['foodinfo'][$k]['OffersRate'] 		 = $productlist->OffersRate;
						$output['foodinfo'][$k]['offerIsavailable'] = $productlist->offerIsavailable;
						$output['foodinfo'][$k]['offerstartdate'] 	 = $productlist->offerstartdate;
						$output['foodinfo'][$k]['offerendate']		 = $productlist->offerendate;
						$output['foodinfo'][$k]['variantid'] 		 = $productlist->variantid;
						$output['foodinfo'][$k]['variantName'] 	 = $productlist->variantName;
						$output['foodinfo'][$k]['price'] 			 = $productlist->price;
						$output['foodinfo'][$k]['totalvariant'] 	 = $productlist->totalvarient;
						if (!empty($taxitems)) {
							$tx = 0;
							foreach ($taxitems as $taxitem) {
								$field_name = 'tax' . $tx;
								$fieldlebel = $taxitem['tax_name'];
								$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
								$tx++;
							}
						}
						if ($productlist->totalvarient > 1) {
							$allvarients = $this->App_android_model->read_all('*', 'variant', 'menuid', $productlist->ProductsID, 'menuid', 'ASC');
							$v = 0;
							foreach ($allvarients as $varientlist) {
								$output['foodinfo'][$k]['varientlist'][$v]['multivariantid'] = $varientlist->variantid;
								$output['foodinfo'][$k]['varientlist'][$v]['multivariantName'] = $varientlist->variantName;
								$output['foodinfo'][$k]['varientlist'][$v]['multivariantPrice'] = $varientlist->price;
								$v++;
							}
						} else {
							$output['foodinfo'][$k]['varientlist'][0]['multivariantid'] = '';
							$output['foodinfo'][$k]['varientlist'][0]['multivariantName'] = '';
							$output['foodinfo'][$k]['varientlist'][0]['multivariantPrice'] = '';
						}
						if ($addonsinfo != FALSE) {
							$output['foodinfo'][$k]['addons'] 			 = 1;
							$x = 0;
							foreach ($addonsinfo as $alladdons) {
								$output['foodinfo'][$k]['addonsinfo'][$x]['addonsid']   	= $alladdons->add_on_id;
								$output['foodinfo'][$k]['addonsinfo'][$x]['add_on_name']   = $alladdons->add_on_name;
								$output['foodinfo'][$k]['addonsinfo'][$x]['addonsprice']   = $alladdons->price;
								if (!empty($taxitems)) {
									$txn = 0;
									foreach ($taxitems as $taxitem) {
										$field_name = 'tax' . $txn;
										$fieldlebel = $taxitem['tax_name'];
										$output['foodinfo'][$k][$fieldlebel] = $productlist->$fieldlebel;
										$output['foodinfo'][$k]['addonsinfo'][$x][$fieldlebel]   = $alladdons->$field_name;
										$txn++;
									}
								}
								$x++;
							}
						} else {
							$output['foodinfo'][$k]['addons'] 			 = 0;
						}
						$k++;
					}
				}
				return $this->respondWithSuccess('Liste des aliments de toute catégorie.', $output);
			} else {
				return $this->respondWithError('Nourriture introuvable. !!!', $output);
			}
		}
	}

	public function tablelist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$alltable = $this->App_android_model->get_all('*', 'rest_table', 'tableid');
			$output = $categoryIDs = array();
			if ($alltable != FALSE) {
				$i = 0;
				foreach ($alltable as $table) {
					$output[$i]['TableId']  = $table->tableid;
					$output[$i]['TableName']  = $table->tablename;
					$i++;
				}

				return $this->respondWithSuccess('Liste de toutes les tables.', $output);
			} else {
				return $this->respondWithError('Table non trouvée.!!!', $output);
			}
		}
	}
	public function customerlist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$memberidID = (int)$this->input->post('id', TRUE);
			$customer = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $memberidID, 'is_active' => 1));
			$output = $categoryIDs = array();
			if ($customer != FALSE) {
				$output['customer_id']  = $customer->customer_id;
				$output['CustomerName']  = $customer->customer_name;

				return $this->respondWithSuccess('informations concernant le client.', $output);
			} else {
				$output['customer_id']  = "";
				$output['CustomerName'] = "";
				return $this->respondWithError('Identifiant client introuvable OU bloqué !!!', $output);
			}
		}
	}
	public function customerfullist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$customerlist = $this->App_android_model->read_all('*', 'customer_info', 'is_active', '1', 'customer_id', 'ASC');
			//print_r( $customer);
			$output = $categoryIDs = array();
			if ($customerlist != FALSE) {
				$i = 0;
				foreach ($customerlist as $customer) {
					$output[$i]['customer_id']  = $customer->customer_id;
					$output[$i]['CustomerName']  = $customer->customer_name;
					$output[$i]['Address']  = $customer->customer_address;
					$output[$i]['phone']  = $customer->customer_phone;
					$i++;
				}
				return $this->respondWithSuccess('informations concernant le client.', $output);
			} else {
				$output['customer_id']  = "";
				$output['CustomerName'] = "";
				$output['Address'] = "";
				$output['phone'] = "";
				return $this->respondWithError('Identifiant de membre introuvable OU bloqué !!!', $output);
			}
		}
	}
	public function allcustomertype()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$customer = $this->App_android_model->get_all('*', 'customer_type', 'customer_type_id');
			$output = $categoryIDs = array();
			if ($customer != FALSE) {
				$i = 0;
				foreach ($customer as $value) {
					$output[$i]['TypeID']    = $value->customer_type_id;
					$output[$i]['TypeName']  = $value->customer_type;
					$i++;
				}
				return $this->respondWithSuccess('Type de client.', $output);
			} else {
				return $this->respondWithError('Type introuvable.!!!', $output);
			}
		}
	}
	public function customertype()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$customer = $this->App_android_model->read('*', 'customer_type', array('customer_type_id' => 1));
			$output = $categoryIDs = array();
			if ($customer != FALSE) {
				$output['TypeID']    = $customer->customer_type_id;
				$output['TypeName']  = $customer->customer_type;

				return $this->respondWithSuccess('Type de client.', $output);
			} else {
				return $this->respondWithError('Type introuvable.!!!', $output);
			}
		}
	}
	public function thirdparty()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$customer = $this->App_android_model->get_all('*', 'tbl_thirdparty_customer', 'companyId');
			$output = $categoryIDs = array();
			if ($customer != FALSE) {
				$i = 0;
				foreach ($customer as $value) {
					$output[$i]['companyId']    = $value->companyId;
					$output[$i]['company_name']  = $value->company_name;
					$i++;
				}
				return $this->respondWithSuccess('Type de client tiers.', $output);
			} else {
				return $this->respondWithError('Type introuvable.!!!', $output);
			}
		}
	}
	public function waiterlist()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$shiftmangment = $this->db->where('directory', 'shiftmangment')->where('status', 1)->get('module')->num_rows();
			if ($shiftmangment == 1) {
				$data = $this->shiftwisecustomer();
			} else {
				$data = $this->waiterwithshift();
			}
			$output =  array();
			if (!empty($data)) {
				$i = 0;
				foreach ($data as $value) {
					$output[$i]['waiterid'] = $value->emp_his_id;
					$output[$i]['Waitername'] = $value->first_name . " " . $value->last_name;
					$i++;
				}
				return $this->respondWithSuccess('Liste de serveurs.', $output);
			} else {
				return $this->respondWithError('Liste de serveurs introuvable.!!!', $output);
			}
		}
	}

	public function waiterwithshift()
	{
		$data = $this->db->select("emp_his_id,first_name,last_name")
			->from('employee_history')
			->where('pos_id', 6)
			->get()
			->result();
		return $data;
	}
	public function shiftwisecustomer()
	{
		$timezone = $this->db->select('timezone')->get('setting')->row();
		$tz_obj = new DateTimeZone($timezone->timezone);
		$today = new DateTime("now", $tz_obj);
		$today_formatted = $today->format('H:i:s');
		$where = "'$today_formatted' BETWEEN start_Time and end_Time";
		$current_shift = $this->db->select('*')
			->from('shifts')
			->where($where)
			->get()
			->row();
		$data = array();
		if (!empty($current_shift)) {
			$this->db->select("emp.emp_his_id,emp.first_name,emp.last_name,emp.employee_id");
			$this->db->from('employee_history as emp');
			$this->db->join('shift_user as s', 'emp.employee_id=s.emp_id', 'left');
			$this->db->where('emp.pos_id', 6);
			$this->db->where('s.shift_id', $current_shift->id);
			$data = $this->db->get()->result();
		}
		return $data;
	}

	public function foodcart()
	{
		// TO DO /
		$this->load->library('form_validation');
		$custype = $this->input->post('ctype', TRUE);
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('VatAmount', 'Total VAT', 'xss_clean|required|trim');
		$this->form_validation->set_rules('CustomerID', 'CustomerID', 'xss_clean|required|trim');
		//$this->form_validation->set_rules('TypeID', 'TypeID', 'xss_clean|required|trim');
		$this->form_validation->set_rules('Total', 'Cart Total', 'xss_clean|required|trim');
		$this->form_validation->set_rules('Grandtotal', 'Grand Total', 'xss_clean|required|trim');
		$this->form_validation->set_rules('foodinfo', 'foodinfo', 'xss_clean|required|trim');
		if ($custype == 1 || $custype == 99) {
			$this->form_validation->set_rules('TableId', 'TableId', 'xss_clean|required|trim');
		}
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {

			$thirdparty = 0;
			$thirdpartyinvoice = NULL;
			if (custype == 3) {
				$thirdparty = $this->input->post('thirdpartyid', TRUE);
				$thirdpartyinvoice = $this->input->post('thirdpartyorderid', TRUE);
			}
			$json = $this->input->post('foodinfo', TRUE);
			// print_r($cartArray);
			$gtotal = $this->input->post('Grandtotal', TRUE);
			$ID                 = $this->input->post('id', TRUE);
			$VAT                = $this->input->post('VAT', TRUE);
			$VatAmount          = $this->input->post('VatAmount', TRUE);
			$TableId        	= $this->input->post('TableId', TRUE);
			$CustomerID      	= $this->input->post('CustomerID', TRUE);
			$TypeID      		= 1;
			$ServiceCharge      = $this->input->post('ServiceCharge', TRUE);
			$Discount 			= $this->input->post('Discount', TRUE);
			$Total        		= $this->input->post('Total', TRUE);
			$Grandtotal        	= $this->input->post('Grandtotal', TRUE);
			$customernote       = $this->input->post('CustomerNote', TRUE);
			$newdate = date('Y-m-d');
			$lastid = $this->db->select("*")->from('customer_order')->order_by('order_id', 'desc')->get()->row();
			$sl = $lastid->order_id;
			if (empty($sl)) {
				$sl = 1;
			} else {
				$sl = $sl + 1;
			}

			$si_length = strlen((int)$sl);

			$str = '0000';
			$str2 = '0000';
			$cutstr = substr($str, $si_length);
			$sino = $cutstr . $sl;

			$todaydate = date('Y-m-d');
			$todaystoken = $this->db->select("*")->from('customer_order')->where('order_date', $todaydate)->order_by('order_id', 'desc')->get()->row();
			if (empty($todaystoken)) {
				$mytoken = 1;
			} else {
				$mytoken = $todaystoken->tokenno + 1;
			}
			$token_length = strlen((int)$mytoken);
			$tokenstr = '00';
			$newtoken = substr($tokenstr, $token_length);
			$tokenno = $newtoken . $mytoken;
			//Inser Order information 
			$data2 = array(
				'customer_id'			=>	$CustomerID,
				'saleinvoice'			=>	$sino,
				'cutomertype'		    =>	$TypeID,
				'isthirdparty'          =>  $thirdparty,
				'thirdpartyinvoiceid'   =>  $thirdpartyinvoice,
				'waiter_id'	        	=>	$ID,
				'order_date'	        =>	$newdate,
				'order_time'	        =>	date('H:i:s'),
				'totalamount'		 	=>  $Grandtotal,
				'table_no'		    	=>	$TableId,
				'tokenno'		        =>	$tokenno,
				'customer_note'		    =>	$customernote,
				'order_status'		    =>	1
			);

			$this->db->insert('customer_order', $data2);
			$orderid = $this->db->insert_id();
			$taxinfos = $this->taxchecking();
			if (!empty($taxinfos)) {
				$multitaxv = $this->input->post('multiplletaxvalue');
				$decodetax = json_decode($multitaxv);
				$multitaxvalue = (array) $decodetax;
				$multitaxvaluedata = unserialize($multitaxvalue);
				$inserttaxarray = array(
					'customer_id' => $CustomerID,
					'relation_id' => $orderid,
					'date' => $newdate
				);
				$inserttaxdata = array_merge($inserttaxarray, $multitaxvaluedata);
				$this->db->insert('tax_collection', $inserttaxdata);
			}


			//print_r($cartArray);
			$cartArray = json_decode($json);
			$output = $categoryIDs = array();

			foreach ($cartArray as $cart) {
				$fooditeminfo = $this->db->select("kitchenid")->from('item_foods')->where('ProductsID', $cart->ProductsID)->get()->row();
				$addonsid = "";
				$addonsqty = "";
				$addonsprice = 0;
				if (@$cart->addons == 1) {
					foreach ($cart->addonsinfo as $adonsinfo) {
						//print_r($adonsinfo);
						if ($adonsinfo->addonsquantity > 0) {
							$addprice = $adonsinfo->addonsquantity * $adonsinfo->addonsprice;
							$addonsid .= $adonsinfo->addonsid . ',';
							$addonsqty .= $adonsinfo->addonsquantity . ',';
							$addonsprice = $addonsprice + $addprice;
						}
					}
				}
				$alladdons = trim($addonsid, ',');
				$alladdonsqty = trim($addonsqty, ',');
				//Insert Item information
				$data3 = array(
					'order_id'				=>	$orderid,
					'menu_id'		        =>	$cart->ProductsID,
					'menuqty'	        	=>	$cart->quantity,
					'notes'                 =>  $cart->itemNote,
					'add_on_id'	        	=>	$alladdons,
					'addonsqty'	        	=>	$alladdonsqty,
					'varientid'		    	=>	$cart->variantid,
				);
				$this->db->insert('order_menu', $data3);
				$this->db->where('waiterid', $ID)->where('ProductsID', $cart->ProductsID)->where('variantid', $cart->variantid)->delete('tbl_waiterappcart');
			}
			$billinfo = array(
				'customer_id'			=>	$CustomerID,
				'order_id'		        =>	$orderid,
				'total_amount'	        =>	$Total,
				'discount'	            =>	$Discount,
				'service_charge'	    =>	$ServiceCharge,
				'VAT'		 	        =>  $VatAmount,
				'bill_amount'		    =>	$Grandtotal,
				'bill_date'		        =>	$newdate,
				'bill_time'		        =>	date('H:i:s'),
				'bill_status'		    =>	0,
				'payment_method_id'		=>	4,
				'create_by'		        =>	$ID,
				'create_date'		    =>	date('Y-m-d')
			);
			$this->db->insert('bill', $billinfo);
			$billid = $this->db->insert_id();
			$cardinfo = array(
				'bill_id'			    =>	$billid,
				'card_no'		        =>	"",
				'issuer_name'	        =>	""
			);

			/*Push Notification*/
			$senderid = array();
			$kinfo = $this->kitcheninfo($orderid);
			foreach ($kinfo as $kitcheninfo) {
				$allemployee = $this->db->select('user.*,tbl_assign_kitchen.userid')->from('tbl_assign_kitchen')->join('user', 'user.id=tbl_assign_kitchen.userid', 'left')->where('tbl_assign_kitchen.kitchen_id', $kitcheninfo->kitchenid)->get()->result();
				foreach ($allemployee as $mytoken) {
					$senderid[] = $mytoken->waiter_kitchenToken;
				}
			}
			$newmsg = array(
				'tag'						=> "Nouvelle commande passée",
				'orderid'					=> $orderid,
				'amount'					=> $Grandtotal
			);
			$message = json_encode($newmsg);
			define('API_ACCESS_KEY', 'AAAAqItjOeE:APA91bElSBCtTP-NOx3rU_afQgpk8uo7AaOgaDLsaoSFVYhGnXHXd1pEwCi63j0q42NvZp9wvR1gExuEnKZIIfU_pmNwt6N-3zLnJRtSONDUFcZQ1rERTNYmnbONnufrHShrzpne0bDY');
			$registrationIds = $senderid;
			$msg = array(
				'message' 					=> "Orderid: " . $orderid . ", Amount:" . number_format($gtotal, 2),
				'title'						=> "Nouvelle commande passée",
				'subtitle'					=> "TSET",
				'tickerText'				=> "TSET",
				'vibrate'					=> 1,
				'sound'						=> 1,
				'largeIcon'					=> "TSET",
				'smallIcon'					=> "TSET"
			);
			$fields2 = array(
				'registration_ids' 	=> $registrationIds,
				'data'			=> $msg
			);
			//print_r($fields2);
			$headers2 = array(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json'
			);

			$ch2 = curl_init();
			curl_setopt($ch2, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
			curl_setopt($ch2, CURLOPT_POST, true);
			curl_setopt($ch2, CURLOPT_HTTPHEADER, $headers2);
			curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch2, CURLOPT_POSTFIELDS, json_encode($fields2));
			$result2 = curl_exec($ch2);
			curl_close($ch2);
			//print_r($result2);
			/*End Notification*/

			$output['orderid'] = $orderid;
			$output['token'] = $tokenno;
			//$this->lsoft_setting->send_sms($orderid,$customerid,$type="CompleteOrder");
			if (!empty($orderid)) {
				return $this->respondWithSuccess('Commande passée avec succès.', $output);
			} else {
				return $this->respondWithError('Commande non passée!!!', $output);
			}
		}
	}
	public function kitcheninfo($orderid)
	{
		$this->db->select('order_menu.order_id,item_foods.ProductsID,item_foods.kitchenid');
		$this->db->from('order_menu');
		$this->db->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'left');
		$this->db->where('order_menu.order_id', $orderid);
		$this->db->group_by('item_foods.kitchenid');
		$query = $this->db->get();
		//echo $this->db->last_query();
		return $kitcheninfo = $query->result();
		print_r($kitcheninfo);
	}
	public function pendingorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('id', TRUE);
			$orderlist = $this->App_android_model->orderlist($waiterid, $status = 1);
			$output = $categoryIDs = array();
			if ($orderlist != FALSE) {
				$i = 0;
				foreach ($orderlist as $order) {
					$output[$i]['order_id']        = $order->order_id;
					$output[$i]['CustomerName']    = $order->customer_name;
					$output[$i]['TableName']       = $order->tablename;
					$output[$i]['OrderDate']       = $order->order_date;
					$output[$i]['TotalAmount']     = $order->totalamount;
					$i++;
				}

				return $this->respondWithSuccess('Liste des commandes en attente.', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}
	public function processingorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('id', TRUE);
			$orderlist = $this->App_android_model->orderlist($waiterid, $status = 2);
			$output = $categoryIDs = array();
			if ($orderlist != FALSE) {
				$i = 0;
				foreach ($orderlist as $order) {
					$output[$i]['order_id']        = $order->order_id;
					$output[$i]['CustomerName']    = $order->customer_name;
					$output[$i]['TableName']       = $order->tablename;
					$output[$i]['OrderDate']       = $order->order_date;
					$output[$i]['TotalAmount']     = $order->totalamount;
					$i++;
				}

				return $this->respondWithSuccess('Liste des commandes en attente.', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}
	public function completeorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('start', 'start', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('id', TRUE);
			$start = $this->input->post('start', TRUE);
			if ($start == 0) {
				$orderlist = $this->App_android_model->allorderlist($waiterid, $status = 4, $limit = 20);
			} else {
				$orderlist = $this->App_android_model->allorderlist($waiterid, $status = 4, $start, $limit = 20);
			}
			$totalorder = $this->App_android_model->count_comorder($waiterid, $status = 4);
			$output = $categoryIDs = array();
			if ($orderlist != FALSE) {
				$output['totalorder']        = $totalorder;
				$i = 0;
				foreach ($orderlist as $order) {
					$output['orderinfo'][$i]['order_id']        = $order->order_id;
					$output['orderinfo'][$i]['CustomerName']    = $order->customer_name;
					$output['orderinfo'][$i]['TableName']       = $order->tablename;
					$output['orderinfo'][$i]['OrderDate']       = $order->order_date;
					$output['orderinfo'][$i]['TotalAmount']     = $order->totalamount;
					$i++;
				}

				return $this->respondWithSuccess('Liste des commandes en attente.', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}
	public function cancelorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('start', 'start', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('id', TRUE);
			$start = $this->input->post('start', TRUE);
			if ($start == 0) {
				$orderlist = $this->App_android_model->allorderlist($waiterid, $status = 5, $limit = 20);
			} else {
				$orderlist = $this->App_android_model->allorderlist($waiterid, $status = 5, $start, $limit = 20);
			}
			$totalorder = $this->App_android_model->count_comorder($waiterid, $status = 5);
			$output = $categoryIDs = array();
			if ($orderlist != FALSE) {
				$output['totalorder']        = $totalorder;
				$i = 0;
				foreach ($orderlist as $order) {
					$output['orderinfo'][$i]['order_id']        = $order->order_id;
					$output['orderinfo'][$i]['CustomerName']    = $order->customer_name;
					$output['orderinfo'][$i]['TableName']       = $order->tablename;
					$output['orderinfo'][$i]['OrderDate']       = $order->order_date;
					$output['orderinfo'][$i]['TotalAmount']     = $order->totalamount;
					$i++;
				}

				return $this->respondWithSuccess('Liste des commandes en attente.', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}

	public function weaitercart()
	{
		$this->form_validation->set_rules('cartdata', 'cartdata', 'required|xss_clean|trim');
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		$waiterid = $this->input->post('waiterid', TRUE);
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('waiterid', TRUE);
			$json = $this->input->post('cartdata', TRUE);
			$cartArray = json_decode($json);
			$ProductsID = $cartArray->foodinfo['0']->ProductsID;
			$variantid = $cartArray->foodinfo['0']->variantid;
			$addonsinfo = $cartArray->foodinfo['0']->addonsinfo;
			$addonsexist = $cartArray->foodinfo['0']->addons;
			$exitsdata = $this->db->select('*')->from('tbl_waiterappcart')->where('waiterid', $waiterid)->where('ProductsID', $ProductsID)->where('variantid', $variantid)->get()->row();
			$output = $categoryIDs = array();
			if (!empty($exitsdata)) {
				$this->db->where('waiterid', $waiterid)->where('ProductsID', $ProductsID)->where('variantid', $variantid)->delete('tbl_waiterappcart');
			}
			if ($addonsexist == 1) {
				for ($i = 0; $i < count($addonsinfo); $i++) {
					$data3 = array(
						'waiterid'						    =>	$waiterid,
						'alladdOnsName'						=>	$cartArray->foodinfo['0']->addOnsName,
						'total_addonsprice'		        	=>	$cartArray->foodinfo['0']->addOnsTotal,
						'totaladdons'	        			=>	$cartArray->foodinfo['0']->addons,
						'addons_name'	        			=>	$addonsinfo[$i]->add_on_name,
						'addons_id'	        				=>	$addonsinfo[$i]->addonsid,
						'addons_price'		    			=>	$addonsinfo[$i]->addonsprice,
						'addonsQty'							=>	$addonsinfo[$i]->addonsquantity,
						'component'		        			=>	$cartArray->foodinfo['0']->component,
						'destcription'	        			=>	$cartArray->foodinfo['0']->destcription,
						'itemnotes'	        				=>	$cartArray->foodinfo['0']->itemnotes,
						'offerIsavailable'	        		=>	$cartArray->foodinfo['0']->offerIsavailable,
						'offerstartdate'		    		=>	$cartArray->foodinfo['0']->offerstartdate,
						'OffersRate'						=>	$cartArray->foodinfo['0']->OffersRate,
						'offerendate'		        		=>	$cartArray->foodinfo['0']->offerendate,
						'price'	        					=>	$cartArray->foodinfo['0']->price,
						'ProductsID'	        			=>	$cartArray->foodinfo['0']->ProductsID,
						'ProductImage'	        			=>	$cartArray->foodinfo['0']->ProductImage,
						'ProductName'		    			=>	$cartArray->foodinfo['0']->ProductName,
						'productvat'						=>	$cartArray->foodinfo['0']->productvat,
						'quantity'		        			=>	$cartArray->foodinfo['0']->quantity,
						'variantName'	        			=>	$cartArray->foodinfo['0']->variantName,
						'variantid'	        				=>	$cartArray->foodinfo['0']->variantid,
					);
					$this->db->insert('tbl_waiterappcart', $data3);
				}
			} else {
				$data3 = array(
					'waiterid'						    =>	$waiterid,
					'alladdOnsName'						=>	$cartArray->foodinfo['0']->addOnsName,
					'total_addonsprice'		        	=>	$cartArray->foodinfo['0']->addOnsTotal,
					'totaladdons'	        			=>	$cartArray->foodinfo['0']->addons,
					'addons_name'	        			=>	NULL,
					'addons_id'	        				=>	NULL,
					'addons_price'		    			=>	0.00,
					'addonsQty'							=>	NULL,
					'component'		        			=>	$cartArray->foodinfo['0']->component,
					'destcription'	        			=>	$cartArray->foodinfo['0']->destcription,
					'itemnotes'	        				=>	$cartArray->foodinfo['0']->itemnotes,
					'offerIsavailable'	        		=>	$cartArray->foodinfo['0']->offerIsavailable,
					'offerstartdate'		    		=>	$cartArray->foodinfo['0']->offerstartdate,
					'OffersRate'						=>	$cartArray->foodinfo['0']->OffersRate,
					'offerendate'		        		=>	$cartArray->foodinfo['0']->offerendate,
					'price'	        					=>	$cartArray->foodinfo['0']->price,
					'ProductsID'	        			=>	$cartArray->foodinfo['0']->ProductsID,
					'ProductImage'	        			=>	$cartArray->foodinfo['0']->ProductImage,
					'ProductName'		    			=>	$cartArray->foodinfo['0']->ProductName,
					'productvat'						=>	$cartArray->foodinfo['0']->productvat,
					'quantity'		        			=>	$cartArray->foodinfo['0']->quantity,
					'variantName'	        			=>	$cartArray->foodinfo['0']->variantName,
					'variantid'	        				=>	$cartArray->foodinfo['0']->variantid,
				);
				$this->db->insert('tbl_waiterappcart', $data3);
			}
			return $this->respondWithSuccess('Ajouter au panier avec succès', $output);
		}
	}

	public function cartdata()
	{
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		$waiterid = $this->input->post('waiterid', TRUE);
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('waiterid', TRUE);
			$getcartdata = $this->db->select('*')->from('tbl_waiterappcart')->where('waiterid', $waiterid)->group_by('ProductsID')->group_by('variantid')->get()->result();
			//print_r($getcartdata);
			$output = $categoryIDs = array();
			$i = 0;
			foreach ($getcartdata as $cart) {
				$output['foodinfo'][$i]['addOnsName'] = $cart->alladdOnsName;
				$output['foodinfo'][$i]['addOnsTotal'] = $cart->total_addonsprice;
				$output['foodinfo'][$i]['addons'] = $cart->totaladdons;
				$addonsfood = $this->db->select('addons_name,addons_id,addons_price,addonsQty')->from('tbl_waiterappcart')->where('waiterid', $waiterid)->where('ProductsID', $cart->ProductsID)->where('variantid', $cart->variantid)->get()->result();
				$k = 0;
				foreach ($addonsfood as $addonsitem) {
					$output['foodinfo'][$i]['addonsinfo'][$k]['addonsid'] = $addonsitem->addons_id;
					$output['foodinfo'][$i]['addonsinfo'][$k]['add_on_name'] = $addonsitem->addons_name;
					$output['foodinfo'][$i]['addonsinfo'][$k]['addonsprice'] = $addonsitem->addons_price;
					$output['foodinfo'][$i]['addonsinfo'][$k]['addonsquantity'] = $addonsitem->addonsQty;
					$k++;
				}
				$output['foodinfo'][$i]['component'] = $cart->component;
				$output['foodinfo'][$i]['destcription'] = $cart->destcription;
				$output['foodinfo'][$i]['itemnotes'] = $cart->itemnotes;
				$output['foodinfo'][$i]['offerIsavailable'] = $cart->offerIsavailable;
				$output['foodinfo'][$i]['offerstartdate'] = $cart->offerstartdate;
				$output['foodinfo'][$i]['OffersRate'] = $cart->OffersRate;
				$output['foodinfo'][$i]['offerendate'] = $cart->offerendate;
				$output['foodinfo'][$i]['price'] = $cart->price;
				$output['foodinfo'][$i]['ProductsID'] = $cart->ProductsID;
				$output['foodinfo'][$i]['ProductImage'] = $cart->ProductImage;
				$output['foodinfo'][$i]['ProductName'] = $cart->ProductName;
				$output['foodinfo'][$i]['productvat'] = $cart->productvat;
				$output['foodinfo'][$i]['quantity'] = $cart->quantity;
				$output['foodinfo'][$i]['variantName'] = $cart->variantName;
				$output['foodinfo'][$i]['variantid'] = $cart->variantid;
				$i++;
			}
			return $this->respondWithSuccess('Liste de tous les articles du panier', $output);
		}
	}
	public function completeorcancel()
	{
		$this->form_validation->set_rules('Orderstatus', 'Orderstatus', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$orderstatus = $this->input->post('Orderstatus', TRUE);
			$orderid = $this->input->post('Orderid', TRUE);
			$waiterid = $this->input->post('waiterid', TRUE);
			$output = $categoryIDs = array();
			$customerorder = $this->App_android_model->read('*', 'customer_order', array('order_id' => $orderid));

			$customerinfo = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $customerorder->customer_id));
			$tableinfo = $this->App_android_model->read('*', 'rest_table', array('tableid' => $customerorder->table_no));
			$typeinfo = $this->App_android_model->read('*', 'customer_type', array('customer_type_id' => $customerorder->cutomertype));

			$orderdetails = $this->db->select('order_menu.*,item_foods.ProductsID,item_foods.ProductName,variant.variantid,variant.variantName,variant.price')->from('order_menu')->join('customer_order', 'order_menu.order_id=customer_order.order_id', 'left')->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'left')->join('variant', 'order_menu.varientid=variant.variantid', 'left')->where('order_menu.order_id', $orderid)->where('customer_order.waiter_id', $waiterid)->where('customer_order.order_status', $orderstatus)->order_by('customer_order.order_id', 'desc')->get()->result();
			//
			$billinfo = $this->App_android_model->read('*', 'bill', array('order_id' => $orderid));

			if (!empty($orderdetails)) {
				$output['CustomerName'] = $customerinfo->customer_name;
				$output['CustomerPhone'] = $customerinfo->customer_phone;
				$output['CustomerEmail'] = $customerinfo->customer_email;
				$output['CustomerType'] = $typeinfo->customer_type;
				$output['TableName'] = $tableinfo->tablename;
				$i = 0;

				foreach ($orderdetails as $item) {
					if ($item->food_status == 1) {
						$statusinfo = "Ready";
					} else if ($customerorder->order_status == 4) {
						$statusinfo = "Completed";
					} else {
						$statusinfo = "Processing!";
					}
					$output['iteminfo'][$i]['ProductsID']     = $item->ProductsID;
					$output['iteminfo'][$i]['ProductName']    = $item->ProductName;
					$output['iteminfo'][$i]['price']    	   = $item->price;
					$output['iteminfo'][$i]['Varientname']    = $item->variantName;
					$output['iteminfo'][$i]['Varientid']      = $item->variantid;
					$output['iteminfo'][$i]['Itemqty']        = $item->menuqty;
					$output['iteminfo'][$i]['status']         = $statusinfo;
					$output['iteminfo'][$i]['Itemtotal']      = number_format(($item->menuqty * $item->price), 2);
					if (!empty($item->add_on_id)) {
						$output['iteminfo'][$i]['addons']        = 1;
						$addons = explode(",", $item->add_on_id);
						$addonsqty = explode(",", $item->addonsqty);
						$x = 0;
						foreach ($addons as $addonsid) {
							$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsName']     = $adonsinfo->add_on_name;
							$output['iteminfo'][$i]['addonsinfo'][$x]['add_on_id']      = $adonsinfo->add_on_id;
							$output['iteminfo'][$i]['addonsinfo'][$x]['price']      	= number_format($adonsinfo->price, 2, '.', '');
							$output['iteminfo'][$i]['addonsinfo'][$x]['add_on_qty']     = $addonsqty[$x];
							$x++;
						}
					} else {
						$output['iteminfo'][$i]['addons']        = 0;
					}

					$i++;
				}
				$output['Subtotal']              = $billinfo->total_amount;
				$output['discount']              = $billinfo->discount;
				$output['service_charge']        = $billinfo->service_charge;
				$output['VAT']        			  = $billinfo->VAT;
				$output['order_total']           = $billinfo->bill_amount;
				$output['orderdate']             = $billinfo->bill_date;

				return $this->respondWithSuccess('détails de la commande', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}
	public function pendingorprocess()
	{
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('waiterid', TRUE);
			$output = $categoryIDs = array();
			$getcartdata = $this->db->select('count(order_id) as cnt')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->get()->row();

			$getamount = $this->db->select('Sum(totalamount) as total')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->get()->row();
			if (!empty($getamount->total)) {
				$overall = $getamount->total;
			} else {
				$overall = 0;
			}

			$where = "order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)";
			$lastweekorder = $this->db->select('count(order_id) as cnt')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->where($where)->get()->row();
			$lastweekamount = $this->db->select('Sum(totalamount) as total')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->where($where)->get()->row();
			if (!empty($lastweekamount->total)) {
				$lasttotal = $lastweekamount->total;
			} else {
				$lasttotal = 0;
			}
			$output['Overallorder'] = $getcartdata->cnt;
			$output['Overallamount'] = $overall;
			$output['lastweekorder'] = $lastweekorder->cnt;
			$output['lastweekamount'] = $lasttotal;
			return $this->respondWithSuccess('Historique des commandes', $output);
		}
	}
	public function orderhistory()
	{
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('waiterid', TRUE);
			$output = $categoryIDs = array();
			$getcartdata = $this->db->select('count(order_id) as cnt')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->get()->row();

			$getamount = $this->db->select('Sum(totalamount) as total')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->get()->row();
			if (!empty($getamount->total)) {
				$overall = $getamount->total;
			} else {
				$overall = 0;
			}

			$where = "order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)";
			$lastweekorder = $this->db->select('count(order_id) as cnt')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->where($where)->get()->row();
			$lastweekamount = $this->db->select('Sum(totalamount) as total')->from('customer_order')->where('waiter_id', $waiterid)->where('order_status!=', 5)->where($where)->get()->row();
			if (!empty($lastweekamount->total)) {
				$lasttotal = $lastweekamount->total;
			} else {
				$lasttotal = 0;
			}
			$output['Overallorder'] = $getcartdata->cnt;
			$output['Overallamount'] = $overall;
			$output['lastweekorder'] = $lastweekorder->cnt;
			$output['lastweekamount'] = $lasttotal;
			return $this->respondWithSuccess('Historique des commandes', $output);
		}
	}
	public function updateorder()
	{
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$orderid = $this->input->post('Orderid', TRUE);
			$output = $categoryIDs = array();
			$customerorder = $this->App_android_model->read('*', 'customer_order', array('order_id' => $orderid));
			$customerinfo = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $customerorder->customer_id));
			$tableinfo = $this->App_android_model->read('*', 'rest_table', array('tableid' => $customerorder->table_no));
			$typeinfo = $this->App_android_model->read('*', 'customer_type', array('customer_type_id' => $customerorder->cutomertype));

			$orderdetails = $this->db->select('order_menu.*,item_foods.*,variant.variantid,variant.variantName,variant.price')->from('order_menu')->join('customer_order', 'order_menu.order_id=customer_order.order_id', 'left')->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'left')->join('variant', 'order_menu.varientid=variant.variantid', 'left')->where('order_menu.order_id', $orderid)->get()->result();
			//
			$billinfo = $this->App_android_model->read('*', 'bill', array('order_id' => $orderid));
			$restinfo = $this->App_android_model->read('*', 'setting', array('id' => 2));

			if (!empty($orderdetails)) {
				$output['orderid']        = $orderid;
				$output['Grandtotal']     = $billinfo->bill_amount;
				$output['Servicecharge']  = $billinfo->service_charge;
				$output['discount']       = $billinfo->discount;
				$output['discounttype']   = $restinfo->discount_type;
				$output['defaultdiscount'] = $restinfo->discountrate;
				$output['vat']            = $billinfo->VAT;
				$output['Table']          = $tableinfo->tableid;
				$output['customername']   = $customerinfo->customer_name;
				$i = 0;

				foreach ($orderdetails as $item) {
					$output['iteminfo'][$i]['ProductsID']     = $item->ProductsID;
					$output['iteminfo'][$i]['ProductName']    = $item->ProductName;
					$output['iteminfo'][$i]['price']    		= $item->price;
					$output['iteminfo'][$i]['component']      = $item->component;
					$output['iteminfo'][$i]['destcription']   = $item->descrip;
					$output['iteminfo'][$i]['itemnotes']      = $item->itemnotes;
					$output['iteminfo'][$i]['productvat']      = $item->productvat;
					$output['iteminfo'][$i]['offerIsavailable'] = $item->offerIsavailable;
					$output['iteminfo'][$i]['offerstartdate']  = $item->offerstartdate;
					$output['iteminfo'][$i]['OffersRate']      = $item->OffersRate;
					$output['iteminfo'][$i]['offerendate']      = $item->offerendate;
					$output['iteminfo'][$i]['ProductImage']     = base_url() . $item->ProductImage;
					$output['iteminfo'][$i]['Varientname']    = $item->variantName;
					$output['iteminfo'][$i]['Varientid']      = $item->variantid;
					$output['iteminfo'][$i]['Itemqty']        = $item->menuqty;
					if (!empty($item->add_on_id)) {
						$output['iteminfo'][$i]['addons']         = 1;
						$addons = explode(",", $item->add_on_id);
						$addonsqty = explode(",", $item->addonsqty);
						$x = 0;
						foreach ($addons as $addonsid) {
							$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
							$output['iteminfo'][$i]['addonsinfo'][$x]['add_on_name']     = $adonsinfo->add_on_name;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsid']      = $adonsinfo->add_on_id;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsprice']          = $adonsinfo->price;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsquantity']     = $addonsqty[$x];
							$x++;
						}
					} else {
						$output['iteminfo'][$i]['addons']         = 0;
					}

					$i++;
				}

				return $this->respondWithSuccess('détails de la commande', $output);
			} else {
				return $this->respondWithError('Commande introuvable.!!!', $output);
			}
		}
	}

	public function updateinsert()
	{
		$this->form_validation->set_rules('cartdata', 'cartdata', 'required|xss_clean|trim');
		$this->form_validation->set_rules('waiterid', 'waiterid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		$waiterid = $this->input->post('waiterid', TRUE);
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('waiterid', TRUE);
			$Orderid = $this->input->post('Orderid', TRUE);
			$json = $this->input->post('cartdata', TRUE);
			$cartArray = json_decode($json);
			$output = $categoryIDs = array();
			$i = 0;
			foreach ($cartArray as $cart) {

				//print_r($cart);
				$ProductsID = $cart->ProductsID;
				$variantid = $cart->Varientid;
				$addonsexist = $cart->addons;

				$exitsdata = $this->db->select('*')->from('tbl_waiterappcart')->where('waiterid', $waiterid)->where('ProductsID', $ProductsID)->where('variantid', $variantid)->where('orderid', $Orderid)->get()->row();
				if (!empty($exitsdata)) {
					$this->db->where('waiterid', $waiterid)->where('ProductsID', $ProductsID)->where('variantid', $variantid)->where('orderid', $Orderid)->delete('tbl_waiterappcart');
				}
				$addonsprice = 0;
				$addonsqty = 0;
				$addonsname = '';
				if ($addonsexist == 1) {
					foreach ($cart->addonsinfo as $addonsinfo3) {
						$addonsname .= $addonsinfo3->addonsName . ",";
						$adsprice = $addonsinfo3->price * $addonsinfo3->add_on_qty;
						$addonsprice = $adsprice + $addonsprice;
						$addonsqty = $addonsqty + $addonsinfo3->add_on_qty;
					}
					foreach ($cart->addonsinfo as $addonsinfo) {
						$data3 = array(
							'waiterid'						    =>	$waiterid,
							'alladdOnsName'						=>	$addonsname,
							'total_addonsprice'		        	=>	$addonsprice,
							'totaladdons'	        			=>	$addonsqty,
							'addons_name'	        			=>	$addonsinfo->addonsName,
							'addons_id'	        				=>	$addonsinfo->add_on_id,
							'addons_price'		    			=>	$addonsinfo->price,
							'addonsQty'							=>	$addonsinfo->add_on_qty,
							'component'		        			=>	$cart->component,
							'destcription'	        			=>	$cart->destcription,
							'itemnotes'	        				=>	$cart->itemnotes,
							'offerIsavailable'	        		=>	$cart->offerIsavailable,
							'offerstartdate'		    		=>	$cart->offerstartdate,
							'OffersRate'						=>	$cart->OffersRate,
							'offerendate'		        		=>	$cart->offerendate,
							'price'	        					=>	$cart->price,
							'ProductsID'	        			=>	$cart->ProductsID,
							'ProductImage'	        			=>	$cart->ProductImage,
							'ProductName'		    			=>	$cart->ProductName,
							'productvat'						=>	$cart->productvat,
							'quantity'		        			=>	$cart->Itemqty,
							'variantName'	        			=>	$cart->Varientname,
							'variantid'	        				=>	$cart->Varientid,
							'orderid'	        			    =>	$Orderid,
						);
						//print_r($data3);
						$this->db->insert('tbl_waiterappcart', $data3);
					}
				} else {
					$data3 = array(
						'waiterid'						    =>	$waiterid,
						'alladdOnsName'						=>	$addonsname,
						'total_addonsprice'		        	=>	$addonsprice,
						'totaladdons'	        			=>	$cart->addons,
						'addons_name'	        			=>	NULL,
						'addons_id'	        				=>	NULL,
						'addons_price'		    			=>	0.00,
						'addonsQty'							=>	NULL,
						'component'		        			=>	$cart->component,
						'destcription'	        			=>	$cart->destcription,
						'itemnotes'	        				=>	$cart->itemnotes,
						'offerIsavailable'	        		=>	$cart->offerIsavailable,
						'offerstartdate'		    		=>	$cart->offerstartdate,
						'OffersRate'						=>	$cart->OffersRate,
						'offerendate'		        		=>	$cart->offerendate,
						'price'	        					=>	$cart->price,
						'ProductsID'	        			=>	$cart->ProductsID,
						'ProductImage'	        			=>	$cart->ProductImage,
						'ProductName'		    			=>	$cart->ProductName,
						'productvat'						=>	$cart->productvat,
						'quantity'		        			=>	$cart->Itemqty,
						'variantName'	        			=>	$cart->Varientname,
						'variantid'	        				=>	$cart->Varientid,
						'orderid'	        			    =>	$Orderid,

					);
					//print_r($data3);
					$this->db->insert('tbl_waiterappcart', $data3);
				}
				$i++;
			}
			return $this->respondWithSuccess('Ajouter au panier avec succès', $output);
		}
	}

	public function modifyfoodcart()
	{
		// TO DO /
		$this->load->library('form_validation');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('VatAmount', 'Total VAT', 'xss_clean|required|trim');
		$this->form_validation->set_rules('TableId', 'TableId', 'xss_clean|required|trim');
		$this->form_validation->set_rules('Total', 'Cart Total', 'xss_clean|required|trim');
		$this->form_validation->set_rules('Grandtotal', 'Grand Total', 'xss_clean|required|trim');
		$this->form_validation->set_rules('foodinfo', 'foodinfo', 'xss_clean|required|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$json = $this->input->post('foodinfo', TRUE);
			$cartArray = json_decode($json);
			$orderid = $this->input->post('Orderid', TRUE);

			$ID                 = $this->input->post('id', TRUE);
			$VAT                = $this->input->post('VAT', TRUE);
			$VatAmount          = $this->input->post('VatAmount', TRUE);
			$TableId        	= $this->input->post('TableId', TRUE);
			$ServiceCharge      = $this->input->post('ServiceCharge', TRUE);
			$Discount 			= $this->input->post('Discount', TRUE);
			$Total        		= $this->input->post('Total', TRUE);
			$Grandtotal        	= $this->input->post('Grandtotal', TRUE);
			$customernote       = $this->input->post('CustomerNote', TRUE);
			$newdate = date('Y-m-d');
			$lastid = $this->db->select("*")->from('customer_order')->where('order_id', $orderid)->get()->row();
			$sino = $lastid->saleinvoice;
			//Inser Order information 
			$data2 = array(
				'order_date'	        =>	$newdate,
				'order_time'	        =>	date('H:i:s'),
				'totalamount'		 	=>  $Grandtotal,
				'table_no'		    	=>	$TableId,
				'customer_note'		    =>	$customernote,
				'order_status'		    =>	1
			);
			$this->db->where('order_id', $orderid);
			$this->db->update('customer_order', $data2);
			$this->db->where('order_id', $orderid)->delete('order_menu');

			$taxinfos = $this->taxchecking();
			if (!empty($taxinfos)) {
				$multitaxv = $this->input->post('multiplletaxvalue');
				$decodetax = json_decode($multitaxv);
				$multiplletaxvalue = (array) $decodetax;
				$multiplletaxdata = unserialize($multiplletaxvalue);
				$this->db->where('relation_id', $orderid);
				$this->db->update('tax_collection', $multiplletaxdata);
			}

			//print_r($cartArray);
			$output = $categoryIDs = array();

			foreach ($cartArray as $cart) {
				$addonsid = "";
				$addonsqty = "";
				$addonsprice = 0;
				if ($cart->addons == 1) {
					foreach ($cart->addonsinfo as $adonsinfo) {
						$addprice = $adonsinfo->addonsquantity * $adonsinfo->addonsprice;
						$addonsid .= $adonsinfo->addonsid . ',';
						$addonsqty .= $adonsinfo->addonsquantity . ',';
						$addonsprice = $addonsprice + $addprice;
					}
				}
				$alladdons = trim($addonsid, ',');
				$alladdonsqty = trim($addonsqty, ',');
				//Insert Item information
				$data3 = array(
					'order_id'				=>	$orderid,
					'menu_id'		        =>	$cart->ProductsID,
					'menuqty'	        	=>	$cart->quantity,
					'notes'                 =>  $cart->itemNote,
					'add_on_id'	        	=>	$alladdons,
					'addonsqty'	        	=>	$alladdonsqty,
					'varientid'		    	=>	$cart->variantid,
				);
				$this->db->insert('order_menu', $data3);
				$this->db->where('orderid', $orderid)->where('ProductsID', $cart->ProductsID)->where('variantid', $cart->Varientid)->delete('tbl_waiterappcart');
			}
			$billinfo = array(
				'total_amount'	        =>	$Total,
				'discount'	            =>	$Discount,
				'service_charge'	    =>	$ServiceCharge,
				'VAT'		 	        =>  $VatAmount,
				'bill_amount'		    =>	$Grandtotal,
				'update_by'		        =>	$ID,
				'update_date'		    =>	date('Y-m-d')
			);
			$this->db->where('order_id', $orderid);
			$this->db->update('bill', $billinfo);
			$billinfo = $this->db->select("*")->from('bill')->where('order_id', $orderid)->get()->row();
			$billid = $billinfo->bill_id;
			$cardinfo = array(
				'card_no'		        =>	"",
				'issuer_name'	        =>	""
			);
			$this->db->where('bill_id', $billid);
			$this->db->update('bill_card_payment', $cardinfo);
			if (!empty($orderid)) {
				$output['orderid'] = $orderid;
				$output['token'] = $lastid->tokenno;
				return $this->respondWithSuccess('Commande passée avec succès.', $output);
			} else {
				return $this->respondWithError('Commande non passée!!!', $output);
			}
		}
	}
	public function orderclear()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$waiterid = $this->input->post('id', TRUE);
			$ProductsID = $this->input->post('ProductsID', TRUE);
			$variantid = $this->input->post('variantid', TRUE);
			$output = $categoryIDs = array();
			$this->db->where('waiterid', $waiterid)->delete('tbl_waiterappcart');
			return $this->respondWithSuccess('Liste de commandes Effacer', $output);
		}
	}

	public function allonlineorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = $categoryIDs = array();
			$waiterid = $this->input->post('id', TRUE);
			$orderlist = $this->App_android_model->allincomminglist();
			if (!empty($orderlist)) {
				$i = 0;
				foreach ($orderlist as $order) {
					$output['orderinfo'][$i]['orderid'] = $order->order_id;
					$output['orderinfo'][$i]['customer'] = $order->customer_name;
					$output['orderinfo'][$i]['amount'] = $order->totalamount;
					$i++;
				}
				return $this->respondWithSuccess('Liste des commandes entrantes', $output);
			} else {
				return $this->respondWithError('Aucune commande entrante trouvée !!!', $output);
			}
		}
	}
	public function acceptorrejectorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('order_id', 'Order ID', 'required|xss_clean|trim');
		$this->form_validation->set_rules('acceptreject', 'Accept Or reject', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = $categoryIDs = array();
			$status = 1;
			$orderid = $this->input->post('order_id');
			$acceptreject = $this->input->post('acceptreject', true);
			$reason = $this->input->post('reason', true);
			$orderinfo = $this->db->select("*")->from('customer_order')->where('order_id', $orderid)->get()->row();
			$customerinfo = $this->db->select("*")->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
			if ($acceptreject == 1) {
				$orderstatus = $this->db->select('order_status,cutomertype,saleinvoice,order_date,customer_id')->from('customer_order')->where('order_id', $orderid)->get()->row();
				if ($orderstatus->order_status == 4) {
					$this->removeformstock($orderid);
					if ($orderstatus->cutomertype == 2) {
						$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
						$finalill = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
						$headn = $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name;
						$coainfo = $this->db->select('*')->from('acc_coa')->where('HeadName', $headn)->get()->row();
						$customer_headcode = $coainfo->HeadCode;
						if ($finalill->payment_method_id == 4) {
							$headcode = 1020101;
						} else {
							$paytype = $this->db->select('payment_method')->from('payment_method')->where('payment_method_id', $finalill->payment_method_id)->get()->row();
							$coacode = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $paytype->payment_method)->get()->row();
							$headcode = $coacode->HeadCode;
						}

						$invoice_no = $orderinfo->saleinvoice;
						$saveid = $this->input->post('id');
						//Customer debit for Product Value
						$cosdr = array(
							'VNo'            =>  $invoice_no,
							'Vtype'          =>  'CIV',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          =>  $customer_headcode,
							'Narration'      =>  'Customer debit for Product Invoice#' . $invoice_no,
							'Debit'          =>  $finalill->bill_amount,
							'Credit'         =>  0,
							'StoreID'        =>  0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $cosdr);
						//Store credit for Product Value
						$sc = array(
							'VNo'            =>  $invoice_no,
							'Vtype'          =>  'CIV',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          =>  10107,
							'Narration'      =>  'Inventory Credit for Product Invoice#' . $invoice_no,
							'Debit'          =>  0,
							'Credit'         =>  $finalill->bill_amount,
							'StoreID'        =>  0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $sc);

						// Customer Credit for paid amount.
						$cc = array(
							'VNo'            =>  $invoice_no,
							'Vtype'          =>  'CIV',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          =>  $customer_headcode,
							'Narration'      =>  'Customer Credit for Product Invoice#' . $invoice_no,
							'Debit'          =>  0,
							'Credit'         =>  $finalill->bill_amount,
							'StoreID'        =>  0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $cc);

						//Cash In hand Debit for paid value
						$cdv = array(
							'VNo'            =>  $invoice_no,
							'Vtype'          =>  'CIV',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          =>  $headcode,
							'Narration'      =>  'Cash in hand Debit For Invoice#' . $invoice_no,
							'Debit'          =>  $finalill->bill_amount,
							'Credit'         =>  0,
							'StoreID'        =>  0,
							'IsPosted'       =>  1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $cdv);
						// Income for company							 
						$income = array(
							'VNo'            => "Sale" . $orderinfo->saleinvoice,
							'Vtype'          => 'Sales Products',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          => 303,
							'Narration'      => 'Sale Income For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
							'Debit'          => 0,
							'Credit'         => $finalill->bill_amount - $finalill->VAT, //purchase price asbe
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $income);

						// Tax Pay for company							 
						$income = array(
							'VNo'            => "Sale" . $orderinfo->saleinvoice,
							'Vtype'          => 'Sales Products Vat',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          => 502030101,
							'Narration'      => 'Sale TAX For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
							'Debit'          => $finalill->VAT,
							'Credit'         => 0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $income);
					}
				}
			} else {
				if (!empty($orderinfo->marge_order_id)) {
					$margecancel = array('marge_order_id' => NULL);
					$this->db->where('order_id', $orderid);
					$this->db->update('customer_order', $margecancel);
				}
			}
			if ($acceptreject == 1) {
				$onlinebill = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
				if ($onlinebill->payment_method_id == 1 && $onlinebill->payment_method_id == 4) {
					$updatetData = array('anyreason' => $reason, 'nofification' => $status, 'orderacceptreject' => $acceptreject, 'order_status' => 2);
				} else {
					$updatetData = array('anyreason' => $reason, 'nofification' => $status, 'orderacceptreject' => $acceptreject);
				}
			} else {
				$updatetData = array('anyreason' => $reason, 'order_status' => 5, 'nofification' => $status, 'orderacceptreject' => 0);
				$taxinfos = $this->taxchecking();
				if (!empty($taxinfos)) {
					$this->db->where('relation_id', $orderid);
					$this->db->delete('tax_collection');
				}
			}
			$this->db->where('order_id', $orderid);
			$this->db->update('customer_order', $updatetData);
		}
	}
	public function acceptorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('order_id', 'Order ID', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = $categoryIDs = array();
			$waiterid = $this->input->post('id', TRUE);
			$orderid = $this->input->post('order_id', TRUE);
			$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();
			if ($orderinfo->order_status == 5) {
				return $this->respondWithError('Cette commande est annulée par l\'administrateur. Veuillez en essayer une autre !!!', $output);
			} else if (!empty($orderinfo->waiter_id)) {
				return $this->respondWithError('Cette commande est déjà attribuée. Veuillez en essayer une autre !!!', $output);
			} else {
				$updatetData['waiter_id']    			= $waiterid;
				$this->App_android_model->update_date('customer_order', $updatetData, 'order_id', $orderid);
				/*Push Notification*/
				/*$condition="user.waiter_kitchenToken!='' AND employee_history.pos_id=1";
		$this->db->select('user.*,employee_history.emp_his_id,employee_history.employee_id,employee_history.pos_id,tbl_assign_kitchen.kitchen_id');
		$this->db->from('user');
		$this->db->join('employee_history', 'employee_history.emp_his_id = user.id', 'left');
		$this->db->join('tbl_assign_kitchen', 'tbl_assign_kitchen.userid = user.id', 'left');
		$this->db->where($condition);
		$query = $this->db->get();
		$allemployee = $query->result();*/
				$senderid = array();
				//foreach($allemployee as $mytoken){
				$kitcheninfo = $this->db->select('order_menu.*,item_foods.ProductsID,item_foods.kitchenid')->from('order_menu')->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'left')->where('order_menu.order_id', $orderid)->group_by('item_foods.kitchenid')->get()->result();
				foreach ($kitcheninfo as $kitchenid) {
					$allemployee = $this->db->select('user.*,tbl_assign_kitchen.userid')->from('tbl_assign_kitchen')->join('user', 'user.id=tbl_assign_kitchen.userid', 'left')->where('tbl_assign_kitchen.kitchen_id', $kitchenid->kitchenid)->get()->result();
					foreach ($allemployee as $mytoken) {
						$senderid[] = $mytoken->waiter_kitchenToken;
					}
				}
				$newmsg = array(
					'tag'						=> "Nouvelle commande passée",
					'orderid'					=> $orderid,
					'amount'					=> $orderinfo->totalamount
				);
				$message = json_encode($newmsg);
				define('API_ACCESS_KEY', 'AAAAqItjOeE:APA91bElSBCtTP-NOx3rU_afQgpk8uo7AaOgaDLsaoSFVYhGnXHXd1pEwCi63j0q42NvZp9wvR1gExuEnKZIIfU_pmNwt6N-3zLnJRtSONDUFcZQ1rERTNYmnbONnufrHShrzpne0bDY');
				$registrationIds = $senderid;
				$msg = array(
					'message' 					=> "Orderid: " . $orderid . ", Amount:" . $orderinfo->totalamount,
					'title'						=> "Nouvelle commande passée",
					'subtitle'					=> "TSET",
					'tickerText'				=> "TSET",
					'vibrate'					=> 1,
					'sound'						=> 1,
					'largeIcon'					=> "TSET",
					'smallIcon'					=> "TSET"
				);
				$fields2 = array(
					'registration_ids' 	=> $registrationIds,
					'data'			=> $msg
				);
				//print_r($fields2);
				$headers2 = array(
					'Authorization: key=' . API_ACCESS_KEY,
					'Content-Type: application/json'
				);

				$ch2 = curl_init();
				curl_setopt($ch2, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
				curl_setopt($ch2, CURLOPT_POST, true);
				curl_setopt($ch2, CURLOPT_HTTPHEADER, $headers2);
				curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($ch2, CURLOPT_POSTFIELDS, json_encode($fields2));
				$result2 = curl_exec($ch2);
				//print_r($result2);
				curl_close($ch2);
				/*End Notification*/
				$updatetData = array('nofification' => 1, 'orderacceptreject' => 1, 'order_status' => 2);
				$this->db->where('order_id', $orderid);
				$this->db->update('customer_order', $updatetData);
				/*PUSH Notification For Customer*/
				$customerinfo = $this->db->select("*")->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				$bodymsg = "Order ID:" . $orderid . " Order amount:" . $orderinfo->totalamount;
				$icon = base_url('assets/img/applogo.png');
				$fields3 = array(
					'to' => $customerinfo->customer_token,
					'data' => array(
						'title' => "You Order is Accepted",
						'body' => $bodymsg,
						'image' => $icon,
						'media_type' => "image",
						'message' => "test",
						"action" => "1",
					),
					'notification' => array(
						'sound' => "default",
						'title' => "You Order is Accepted",
						'body' => $bodymsg,
						'image' => $icon,

					)
				);
				$post_data3 = json_encode($fields3);
				$url = "https://fcm.googleapis.com/fcm/send";
				$ch3  = curl_init($url);
				curl_setopt($ch3, CURLOPT_FAILONERROR, TRUE);
				curl_setopt($ch3, CURLOPT_RETURNTRANSFER, TRUE);
				curl_setopt($ch3, CURLOPT_SSL_VERIFYPEER, 0);
				curl_setopt($ch3, CURLOPT_POSTFIELDS, $post_data3);
				curl_setopt(
					$ch3,
					CURLOPT_HTTPHEADER,
					array(
						'Authorization: Key=AAAAmN4ekRg:APA91bHDg_gr99QlnGtHD_exg-QuhRc_45Xluti4dmaNGSD0jfuXi3-3M_wv01TihrHlUAWUDI-dlJqr-_wEHeYigIXSjEbsXJfxI4J9x7ugZDOBv07FhAlWIdDvl8zWcKoeeqqPT9Gw',
						'Content-Type: application/json'
					)
				);
				$result3 = curl_exec($ch3);
				curl_close($ch3);
				return $this->respondWithSuccess('Attribuer la commande au serveur', $output);
			}
		}
	}
	public function getongoingorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$ongoingorder = $this->App_android_model->get_ongoingorder();
			if (!empty($ongoingorder)) {
				$i = 0;
				foreach ($ongoingorder as $onprocess) {
					$diff = 0;
					$actualtime = date('H:i:s');
					$array1 = explode(':', $actualtime);
					$array2 = explode(':', $onprocess->order_time);
					$minutes1 = ($array1[0] * 3600.0 + $array1[1] * 60.0 + $array1[2]);
					$minutes2 = ($array2[0] * 3600.0 + $array2[1] * 60.0 + $array2[2]);
					$diff = $minutes1 - $minutes2;
					$format = sprintf('%02d:%02d:%02d', ($diff / 3600), ($diff / 60 % 60), $diff % 60);

					$billtotal = round($onprocess->totalamount - $onprocess->customerpaid);
					$output[$i]['tablename'] = $onprocess->tablename;
					$output[$i]['orderid'] = $onprocess->order_id;
					$output[$i]['waiter'] = $onprocess->first_name . ' ' . $onprocess->last_name;
					$output[$i]['CustomerName'] = $onprocess->customer_name;
					$output[$i]['before_time'] = $format;
					$output[$i]['grandtotal'] = $billtotal;
					if ($onprocess->splitpay_status == 0) {
						$output[$i]['split'] = 0;
					} else {
						$output[$i]['split'] = 0;
					}
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de commandes en cours', $output);
		}
	}
	public function todayorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$completeorder = $this->App_android_model->get_completeorder();
			if (!empty($completeorder)) {
				$i = 0;
				foreach ($completeorder as $rowdata) {
					$billstatus = "Unpaid";
					if ($rowdata->bill_status == 1) {
						$billstatus = "Paid";
					}
					$output[$i]['orderid'] = $rowdata->order_id;
					$output[$i]['CustomerName'] = $rowdata->customer_name;
					$output[$i]['CustomerType'] = $rowdata->customer_type;
					$output[$i]['waiter'] = $rowdata->first_name . $rowdata->last_name;
					$output[$i]['tablename'] = $rowdata->tablename;
					$output[$i]['OrderDate'] = $rowdata->order_date;
					$output[$i]['totalamount'] = $rowdata->totalamount;
					$output[$i]['paidStatus'] = $billstatus;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste des commandes d\'aujourd\'hui', $output);
		}
	}
	public function onlinellorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$onlineorder = $this->App_android_model->get_onlineeorder();
			if (!empty($onlineorder)) {
				$i = 0;
				foreach ($onlineorder as $rowdata) {
					$billstatus = "Unpaid";
					if ($rowdata->bill_status == 1) {
						$billstatus = "Paid";
					}
					$output[$i]['orderid'] = $rowdata->order_id;
					$output[$i]['CustomerName'] = $rowdata->customer_name;
					$output[$i]['CustomerType'] = $rowdata->customer_type;
					$output[$i]['waiter'] = $rowdata->first_name . $rowdata->last_name;
					$output[$i]['tablename'] = $rowdata->tablename;
					$output[$i]['OrderDate'] = $rowdata->order_date;
					$output[$i]['totalamount'] = $rowdata->totalamount;
					$output[$i]['paidStatus'] = $billstatus;
					$output[$i]['Orderaccept'] = $rowdata->orderacceptreject;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de commande en ligne', $output);
		}
	}

	public function qrorderlist()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$qrorder = $this->App_android_model->get_qrorder();
			if (!empty($qrorder)) {
				$i = 0;
				foreach ($qrorder as $rowdata) {
					$billstatus = "Unpaid";
					if ($rowdata->bill_status == 1) {
						$billstatus = "Paid";
					}
					$output[$i]['orderid'] = $rowdata->order_id;
					$output[$i]['CustomerName'] = $rowdata->customer_name;
					$output[$i]['CustomerType'] = $rowdata->customer_type;
					$output[$i]['waiter'] = $rowdata->first_name . $rowdata->last_name;
					$output[$i]['tablename'] = $rowdata->tablename;
					$output[$i]['OrderDate'] = $rowdata->order_date;
					$output[$i]['totalamount'] = $rowdata->totalamount;
					$output[$i]['paidStatus'] = $billstatus;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de commandes QR', $output);
		}
	}
	public function banklist()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$banklist   = $this->App_android_model->banklist();
			if (!empty($banklist)) {
				$i = 0;
				foreach ($banklist as $bank) {
					$output[$i]['bankid'] = $bank->bankid;
					$output[$i]['bankname'] = $bank->bank_name;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de toutes les banques', $output);
		}
	}
	public function terminallist()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$terminals   = $this->App_android_model->terminallist();
			if (!empty($terminals)) {
				$i = 0;
				foreach ($terminals as $terminal) {
					$output[$i]['terminalid'] = $terminal->card_terminalid;
					$output[$i]['terminalname'] = $terminal->terminal_name;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de tous les terminaux', $output);
		}
	}
	public function paymentlist()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$pmethodlist   = $this->App_android_model->paymetmethodlist();
			if (!empty($pmethodlist)) {
				$i = 0;
				foreach ($pmethodlist as $pmethod) {
					$output[$i]['payid'] = $pmethod->payment_method_id;
					$output[$i]['payname'] = $pmethod->payment_method;
					$i++;
				}
			}
			return $this->respondWithSuccess('Liste de toutes les méthodes de paiement', $output);
		}
	}
	public function kitchenstatus()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$kitchenorder  = $this->App_android_model->get_orderlist();
			if (!empty($kitchenorder)) {
				$i = 0;
				foreach ($kitchenorder as $orderinfo) {
					$output[$i]['Table'] = $orderinfo->tablename;
					$output[$i]['waiter'] = $orderinfo->first_name . ' ' . $orderinfo->last_name;
					$output[$i]['token'] = $orderinfo->tokenno;
					$output[$i]['orderid'] = $orderinfo->order_id;
					$output[$i]['customername'] = $orderinfo->customer_name;
					$iteminfo = $this->App_android_model->get_itemlist($orderinfo->order_id);

					$k = 0;
					foreach ($iteminfo as $item) {
						// print_r($item);
						$isexists = $this->db->select('tbl_kitchen_order.*')->from('tbl_kitchen_order')->where('orderid', $item->order_id)->where('itemid', $item->menu_id)->where('varient', $item->variantid)->get()->num_rows();
						$condition = "orderid=" . $item->order_id . " AND menuid=" . $item->menu_id . " AND varient=" . $item->variantid;
						$accepttime = $this->db->select('*')->from('tbl_itemaccepted')->where($condition)->get()->row();
						$readytime = $this->db->select('*')->from('tbl_orderprepare')->where($condition)->get()->row();
						//print_r($accepttime);
						$output[$i]['iteminfo'][$k]['itemname'] = $item->ProductName;
						$output[$i]['iteminfo'][$k]['varient'] = $item->variantName;
						$output[$i]['iteminfo'][$k]['qty'] = $item->menuqty;
						if ($item->food_status == 1) {
							$output[$i]['iteminfo'][$k][$k]['acepttime'] = date("H:i:s", strtotime($accepttime->accepttime));
							$output[$i]['iteminfo'][$k]['status'] = "Ready";
						}
						if ($item->food_status == 0) {
							if ($isexists > 0) {
								$output[$i]['iteminfo'][$k]['acepttime'] = date("H:i:s", strtotime($accepttime->accepttime));
								$output[$i]['iteminfo'][$k]['readytime'] = date("H:i:s", strtotime($readytime->preparetime));
								$output[$i]['iteminfo'][$k]['status'] = "Proccessing";
							} else {
								$output[$i]['iteminfo'][$k]['acepttime'] = date("H:i:s", strtotime($accepttime->accepttime));
								$output[$i]['iteminfo'][$k]['status'] = "Kitchen Not Accept";
							}
						}
						$k++;
					}
					$i++;
				}
			}
			return $this->respondWithSuccess('Statut de la cuisine', $output);
		}
	}
	public function billadjustment()
	{
		$this->form_validation->set_rules('orderid', 'orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('discount', 'discount', 'required|xss_clean|trim');
		$this->form_validation->set_rules('grandtotal', 'grandtotal', 'required|xss_clean|trim');
		$this->form_validation->set_rules('payinfo', 'payinfo', 'required|xss_clean|trim');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$discount                = $this->input->post('discount');
			$grandtotal              = $this->input->post('grandtotal');
			$orderid                 = $this->input->post('orderid');
			$payinfo                 = $this->input->post('payinfo');
			$paidamount = 0;
			$updatetordfordiscount = array(
				'totalamount'           => $this->input->post('grandtotal'),
				'customerpaid'           => $this->input->post('grandtotal')
			);
			$this->db->where('order_id', $orderid);
			$this->db->update('customer_order', $updatetordfordiscount);
			$prebillinfo = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
			$customerid = $prebillinfo->customer_id;
			$finalgrandtotal = $this->input->post('grandtotal');
			/***********Add pointing***********/
			$scan = scandir('application/modules/');
			$getcus = "";
			foreach ($scan as $file) {
				if ($file == "loyalty") {
					if (file_exists(APPPATH . 'modules/' . $file . '/assets/data/env')) {
						$getcus = $customerid;
					}
				}
			}

			if (!empty($getcus)) {
				$isexitscusp = $this->db->select("*")->from('tbl_customerpoint')->where('customerid', $customerid)->get()->row();
				$totalgrtotal = round($finalgrandtotal);
				$checkpointcondition = "$totalgrtotal BETWEEN amountrangestpoint AND amountrangeedpoint";
				$getpoint = $this->db->select("*")->from('tbl_pointsetting')->get()->row();
				$calcpoint = $getpoint->earnpoint / $getpoint->amountrangestpoint;
				$thisordpoint = $calcpoint * $totalgrtotal;
				if (empty($isexitscusp)) {
					$updateum = array('membership_type' => 1);
					$this->db->where('customer_id', $customerid);
					$this->db->update('customer_info', $updateum);
					$pointstable2 = array(
						'customerid'   => $customerid,
						'amount'       => $totalgrtotal,
						'points'       => $thisordpoint + 10
					);
					$this->App_android_model->insert_data('tbl_customerpoint', $pointstable2);
				} else {
					$pamnt = $isexitscusp->amount + $totalgrtotal;
					$tpoints = $isexitscusp->points + $thisordpoint;
					$updatecpoint = array('amount' => $pamnt, 'points' => $tpoints);
					$this->db->where('customerid', $customerid);
					$this->db->update('tbl_customerpoint', $updatecpoint);
				}
				$updatemember = $this->db->select("*")->from('tbl_customerpoint')->where('customerid', $customerid)->get()->row();
				$lastupoint = $updatemember->points;
				$updatecond = "'" . $lastupoint . "' BETWEEN startpoint AND endpoint";
				$checkmembership = $this->db->select("*")->from('membership')->where($updatecond)->get()->row();
				if (!empty($checkmembership)) {
					$updatememsp = array('membership_type' => $checkmembership->id);
					$this->db->where('customer_id', $customerid);
					$this->db->update('customer_info', $updatememsp);
				}
				$isredeem = $this->input->post('isredeempoint');
				if (!empty($isredeem)) {
					$updateredeem = array('amount' => 0, 'points' => 0);
					$this->db->where('customerid', $isredeem);
					$this->db->update('tbl_customerpoint', $updateredeem);
				}
			}

			if ($discount > 0) {
				$finaldis = $discount;
			} else {
				$finaldis = $prebillinfo->discount;
			}
			$updatetprebill = array(
				'discount'              => $finaldis,
				'bill_amount'           => $this->input->post('grandtotal')
			);

			$this->db->where('order_id', $orderid);
			$this->db->update('bill', $updatetprebill);
			$billinfo = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
			$billid = $billinfo->bill_id;
			$getmpay = json_decode($payinfo);
			$i = 0;
			foreach ($getmpay as $paymentinfo) {
				$paidamount = $paidamount + $paymentinfo->amount;
				$multipay = array(
					'order_id'			=>	$orderid,
					'payment_type_id'	=>	$paymentinfo->payment_type_id,
					'amount'		    =>	$paymentinfo->amount,
				);

				$this->db->insert('multipay_bill', $multipay);
				$multipay_id = $this->db->insert_id();
				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();
				//print_r($orderinfo);
				$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				//echo $this->db->last_query();

				if ($paymentinfo->payment_type_id != 1) {
					if ($paymentinfo->payment_type_id == 4) {
						$headcode = 1020101;
					} else {
						$paytype = $this->db->select('payment_method')->from('payment_method')->where('payment_method_id', $paymentinfo->payment_type_id)->get()->row();
						$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $paytype->payment_method)->get()->row();
						$headcode = $coainfo->HeadCode;
					}
					$income3 = array(
						'VNo'            => "Sale" . $orderinfo->saleinvoice,
						'Vtype'          => 'Sales Products',
						'VDate'          =>  $orderinfo->order_date,
						'COAID'          => $headcode,
						'Narration'      => 'Sale Income For Online payment by app' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
						'Debit'          => $paymentinfo->amount,
						'Credit'         => 0,
						'IsPosted'       => 1,
						'CreateBy'       => $this->input->post('id'),
						'CreateDate'     => $orderinfo->order_date,
						'IsAppove'       => 1
					);
					$this->db->insert('acc_transaction', $income3);
				}
				if ($paymentinfo->payment_type_id == 1) {
					$cardinformation = $paymentinfo->cardpinfo;
					foreach ($cardinformation as $paycard) {
						$cardinfo = array(
							'bill_id'			    =>	$billid,
							'multipay_id'			=>	$multipay_id,
							'card_no'		        =>	$paycard->card_no,
							'terminal_name'		    =>	$paycard->terminal_name,
							'bank_name'	            =>	$paycard->Bank,
						);

						$this->db->insert('bill_card_payment', $cardinfo);
						$bankinfo = $this->db->select('bank_name')->from('tbl_bank')->where('bankid', $paycard->Bank)->get()->row();
						$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $bankinfo->bank_name)->get()->row();
						$saveid = $this->input->post('id');
						$income2 = array(
							'VNo'            => "Sale" . $orderinfo->saleinvoice,
							'Vtype'          => 'Sales Products',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          => $coainfo->HeadCode,
							'Narration'      => 'Sale Income For App' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
							'Debit'          => $paymentinfo->amount,
							'Credit'         => 0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $income2);
					}
				}
				$i++;
			}
			$cpaidamount =	$paidamount;

			$orderinfom = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();;
			$duevalue = ($orderinfom->totalamount - $orderinfom->customerpaid);
			if ($paidamount == $duevalue || $duevalue <  $paidamount) {
				$paidamount  = $paidamount + $orderinfo->customerpaid;
				$status = 4;
			} else {
				$paidamount  = $paidamount + $orderinfo->customerpaid;
				$status = 3;
			}

			$updatetData = array(
				'order_status'     => $status,
				'customerpaid'     => $cpaidamount,
			);
			$this->db->where('order_id', $orderid);
			$this->db->update('customer_order', $updatetData);
			//Update Bill Table
			if ($status == 4) {
				$updatetbill = array(
					'bill_status'           => 1,
					'payment_method_id'     => $getmpay[0]->payment_type_id,
					'create_by'     		   => $this->input->post('id'),
					'create_at'     		   => date('Y-m-d H:i:s')
				);
				$this->db->where('order_id', $orderid);
				$this->db->update('bill', $updatetbill);

				$this->removeformstock($orderid);
				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();
				$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				$finalill = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
				$headn = $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name;
				$coainfo = $this->db->select('*')->from('acc_coa')->where('HeadName', $headn)->get()->row();
				$customer_headcode = $coainfo->HeadCode;

				$invoice_no = $orderinfo->saleinvoice;
				$saveid = $this->input->post('id');
				//Customer debit for Product Value
				$cosdr = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer debit for Product Invoice#' . $invoice_no,
					'Debit'          =>  $finalill->bill_amount,
					'Credit'         =>  0,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cosdr);
				//Store credit for Product Value
				$sc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  10107,
					'Narration'      =>  'Inventory Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $sc);

				// Customer Credit for paid amount.
				$cc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cc);

				// Income for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 303,
					'Narration'      => 'Sale Income For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => 0,
					'Credit'         => $finalill->bill_amount - $finalill->VAT, //purchase price asbe
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);

				// Tax Pay for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products Vat',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 502030101,
					'Narration'      => 'Sale TAX For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => $finalill->VAT,
					'Credit'         => 0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);
			}
			$this->savekitchenitem($orderid);
			$output['orderid'] = $orderid;
			return $this->respondWithSuccess('Paiement effectué avec succès !!', $output);
		}
	}
	public function ordercancel()
	{
		$this->form_validation->set_rules('orderid', 'orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('reason', 'reason', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$reason = $this->input->post('reason');
			$orderid = $this->input->post('orderid');
			$updatetData = array('anyreason' => $reason, 'order_status' => 5, 'nofification' => 1, 'orderacceptreject' => 0);
			$taxinfos = $this->taxchecking();
			if (!empty($taxinfos)) {
				$this->db->where('relation_id', $orderid);
				$this->db->delete('tax_collection');
			}
			$this->db->where('order_id', $orderid);
			$this->db->update('customer_order', $updatetData);
			return $this->respondWithSuccess('Paiement annulé avec succès !!', $output);
		}
	}
	public function posorderdueinvoice($id)
	{
		$saveid = $this->input->post('id');

		$customerorder = $this->App_android_model->read('*', 'customer_order', array('order_id' => $id));

		$updatetData = array('nofification' => 1);
		$this->db->where('order_id', $id);
		$this->db->update('customer_order', $updatetData);
		//if($customerorder->waiter_id==$saveid || $isadmin==1){
		$data['orderinfo']  	   = $customerorder;
		$data['customerinfo']   = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $customerorder->customer_id));
		$data['iteminfo']       = $this->App_android_model->customerorder($id);
		$data['billinfo']	   = $this->App_android_model->billinfo($id);
		$data['cashierinfo']   = $this->App_android_model->read('*', 'user', array('id' => $data['billinfo']->create_by));
		$data['tableinfo'] = $this->App_android_model->read('*', 'rest_table', array('tableid' => $customerorder->table_no));
		$settinginfo = $this->App_android_model->settinginfo();
		$data['settinginfo'] = $settinginfo;
		$data['storeinfo']      = $settinginfo;
		$data['currency'] = $this->App_android_model->currencysetting($settinginfo->currency);
		$data['taxinfos'] = $this->taxchecking();
		echo $view = $this->load->view('themes/' . $this->themeinfo->themename . '/dueinvoicedirectprint', $data, true);
	}
	public function posorderinvoice($id)
	{
		$saveid = $this->input->post('id');

		$customerorder = $this->App_android_model->read('*', 'customer_order', array('order_id' => $id));

		$updatetData = array('nofification' => 1);
		$this->db->where('order_id', $id);
		$this->db->update('customer_order', $updatetData);
		//if($customerorder->waiter_id==$saveid || $isadmin==1){
		$data['orderinfo']  	   = $customerorder;
		$data['customerinfo']   = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $customerorder->customer_id));
		$data['iteminfo']       = $this->App_android_model->customerorder($id);
		$data['billinfo']	   = $this->App_android_model->billinfo($id);
		$data['cashierinfo']   = $this->App_android_model->read('*', 'user', array('id' => $data['billinfo']->create_by));
		$data['tableinfo'] = $this->App_android_model->read('*', 'rest_table', array('tableid' => $customerorder->table_no));
		$settinginfo = $this->App_android_model->settinginfo();
		$data['settinginfo'] = $settinginfo;
		$data['storeinfo']      = $settinginfo;
		$data['currency'] = $this->App_android_model->currencysetting($settinginfo->currency);
		$data['taxinfos'] = $this->taxchecking();
		echo $view = $this->load->view('themes/' . $this->themeinfo->themename . '/posinvoice', $data, true);
	}
	public function billadjustmentmarge()
	{
		$this->form_validation->set_rules('orderid', 'orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('discount', 'discount', 'required|xss_clean|trim');
		$this->form_validation->set_rules('grandtotal', 'grandtotal', 'required|xss_clean|trim');
		$this->form_validation->set_rules('payinfo', 'payinfo', 'required|xss_clean|trim');
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$rendom_number = generateRandomStr();
			$discount                = $this->input->post('discount');
			$grandtotal              = $this->input->post('grandtotal');
			$orderlist                 = $this->input->post('orderid');
			$payinfo                 = $this->input->post('payinfo');
			$marge_order_id = date('Y-m-d') . _ . $rendom_number;
			$paidamount = 0;
			$ordernum = json_decode($orderlist);
			$countord = count($ordernum);
			$i = 0;
			foreach ($ordernum as $getorder) {
				$order_id = $getorder->orderid;
				$this->removeformstock($order_id);
				$this->db->where('order_id', $order_id)->delete('table_details');
				$paytype = json_decode($payinfo);
				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $order_id)->get()->row();
				$prebill = $this->db->select('*')->from('bill')->where('order_id', $order_id)->get()->row();
				$disamount = $discount / $countord;
				$updatetord = array(
					'totalamount'            => $orderinfo->totalamount - $disamount,
					'customerpaid'           => $orderinfo->totalamount - $disamount
				);
				$this->db->where('order_id', $order_id);
				$this->db->update('customer_order', $updatetord);
				//$prebill->discount+$disamount
				if ($disamount > 0) {
					$finaldis = $disamount;
				} else {
					$finaldis = $prebill->discount;
				}
				$updatetprebill = array(
					'discount'              => $finaldis,
					'bill_amount'           => $orderinfo->totalamount - $disamount
				);
				$this->db->where('order_id', $order_id);
				$this->db->update('bill', $updatetprebill);
				$saveid = $this->input->post('id');
				$orderid                 = $order_id;
				$status                  = 4;

				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();
				$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				$customerid = $orderinfo->customer_id;
				$scan = scandir('application/modules/');
				$getcus = "";
				foreach ($scan as $file) {
					if ($file == "loyalty") {
						if (file_exists(APPPATH . 'modules/' . $file . '/assets/data/env')) {
							$getcus = $customerid;
						}
					}
				}

				if (!empty($getcus)) {
					$isexitscusp = $this->db->select("*")->from('tbl_customerpoint')->where('customerid', $customerid)->get()->row();
					$totalgrtotal = round($finalgrandtotal);
					$checkpointcondition = "$totalgrtotal BETWEEN amountrangestpoint AND amountrangeedpoint";
					$getpoint = $this->db->select("*")->from('tbl_pointsetting')->get()->row();
					$calcpoint = $getpoint->earnpoint / $getpoint->amountrangestpoint;
					$thisordpoint = $calcpoint * $totalgrtotal;
					if (empty($isexitscusp)) {
						$updateum = array('membership_type' => 1);
						$this->db->where('customer_id', $customerid);
						$this->db->update('customer_info', $updateum);
						$pointstable2 = array(
							'customerid'   => $customerid,
							'amount'       => $totalgrtotal,
							'points'       => $thisordpoint + 10
						);
						$this->App_android_model->insert_data('tbl_customerpoint', $pointstable2);
					} else {
						$pamnt = $isexitscusp->amount + $totalgrtotal;
						$tpoints = $isexitscusp->points + $thisordpoint;
						$updatecpoint = array('amount' => $pamnt, 'points' => $tpoints);
						$this->db->where('customerid', $customerid);
						$this->db->update('tbl_customerpoint', $updatecpoint);
					}
					$updatemember = $this->db->select("*")->from('tbl_customerpoint')->where('customerid', $customerid)->get()->row();
					$lastupoint = $updatemember->points;
					$updatecond = "'" . $lastupoint . "' BETWEEN startpoint AND endpoint";
					$checkmembership = $this->db->select("*")->from('membership')->where($updatecond)->get()->row();
					if (!empty($checkmembership)) {
						$updatememsp = array('membership_type' => $checkmembership->id);
						$this->db->where('customer_id', $customerid);
						$this->db->update('customer_info', $updatememsp);
					}
					$isredeem = $this->input->post('isredeempoint');
					if (!empty($isredeem)) {
						$updateredeem = array('amount' => 0, 'points' => 0);
						$this->db->where('customerid', $isredeem);
						$this->db->update('tbl_customerpoint', $updateredeem);
					}
				}

				$updatetData = array(
					'marge_order_id' => $marge_order_id,
					'order_status'     => $status,
				);
				$this->db->where('order_id', $orderid);
				$this->db->update('customer_order', $updatetData);
				//Update Bill Table
				$updatetbill = array(
					'bill_status'           => 1,
					'payment_method_id'     => $paytype[0]->payment_type_id,
					'create_by'			   => $saveid,
					'create_at'     		   => date('Y-m-d H:i:s')
				);
				$this->db->where('order_id', $orderid);
				$this->db->update('bill', $updatetbill);
				$billinfo = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
				$billid = $billinfo->bill_id;
				$checkmultipay = $this->db->select('*')->from('multipay_bill')->where('multipayid', $marge_order_id)->get()->row();
				$payid = '';
				if (empty($checkmultipay)) {
					$k = 0;
					foreach ($paytype as $paymentinfo) {
						$multipay = array(
							'order_id'			=>	$orderid,
							'payment_type_id'	=>	$paymentinfo->payment_type_id,
							'multipayid'		=>	$marge_order_id,
							'amount'		    =>	$paymentinfo->amount,
						);
						$this->db->insert('multipay_bill', $multipay);
						$multipay_id = $this->db->insert_id();

						if ($paymentinfo->payment_type_id != 1) {
							if ($paymentinfo->payment_type_id == 4) {
								$headcode = 1020101;
							} else {
								$paytype = $this->db->select('payment_method')->from('payment_method')->where('payment_method_id', $paymentinfo->payment_type_id)->get()->row();
								$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $paytype->payment_method)->get()->row();
								$headcode = $coainfo->HeadCode;
							}
							// Income for company
							$income3 = array(
								'VNo'            => "Sale" . $orderinfo->saleinvoice,
								'Vtype'          => 'Sales Products',
								'VDate'          =>  $orderinfo->order_date,
								'COAID'          => $headcode,
								'Narration'      => 'Sale Income For Online payment App marge' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
								'Debit'          => $paymentinfo->amount,
								'Credit'         => 0,
								'IsPosted'       => 1,
								'CreateBy'       => $this->input->post('id'),
								'CreateDate'     => $orderinfo->order_date,
								'IsAppove'       => 1
							);
							$this->db->insert('acc_transaction', $income3);
						}

						if ($paymentinfo->payment_type_id == 1) {
							$cardinformation = $paymentinfo->cardpinfo;
							foreach ($cardinformation as $paycard) {
								$cardinfo = array(
									'bill_id'			    =>	$billid,
									'card_no'		        =>	$paycard->card_no,
									'terminal_name'		    =>	$paycard->terminal_name,
									'multipay_id'	   		=>	$multipay_id,
									'bank_name'	            =>	$paycard->Bank,
								);
								$this->db->insert('bill_card_payment', $cardinfo);
								$bankinfo = $this->db->select('bank_name')->from('tbl_bank')->where('bankid', $paycard->Bank)->get()->row();
								$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $bankinfo->bank_name)->get()->row();
								$income2 = array(
									'VNo'            => "Sale" . $orderinfo->saleinvoice,
									'Vtype'          => 'Sales Products',
									'VDate'          =>  $orderinfo->order_date,
									'COAID'          => $coainfo->HeadCode,
									'Narration'      => 'Sale Income For Bank debit App' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
									'Debit'          => $paymentinfo->amount,
									'Credit'         => 0,
									'IsPosted'       => 1,
									'CreateBy'       => $this->input->post('id'),
									'CreateDate'     => $orderinfo->order_date,
									'IsAppove'       => 1
								);
								$this->db->insert('acc_transaction', $income2);
							}
						}
						$k++;
					}
				}
				if ($status == 4) {
					$customerinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $billinfo->customer_id)->get()->row();
				}
				$this->savekitchenitem($orderid);
				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $orderid)->get()->row();
				$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				$finalill = $this->db->select('*')->from('bill')->where('order_id', $orderid)->get()->row();
				$headn = $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name;
				$coainfo = $this->db->select('*')->from('acc_coa')->where('HeadName', $headn)->get()->row();
				$customer_headcode = $coainfo->HeadCode;

				$invoice_no = $orderinfo->saleinvoice;
				$saveid = $this->input->post('id');
				//Customer debit for Product Value
				$cosdr = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer debit for Product Invoice#' . $invoice_no,
					'Debit'          =>  $finalill->bill_amount,
					'Credit'         =>  0,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cosdr);
				//Store credit for Product Value
				$sc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  10107,
					'Narration'      =>  'Inventory Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $sc);

				// Customer Credit for paid amount.
				$cc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cc);

				// Income for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 303,
					'Narration'      => 'Sale Income For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => 0,
					'Credit'         => $finalill->bill_amount - $finalill->VAT, //purchase price asbe
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);

				// Tax Pay for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products Vat',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 502030101,
					'Narration'      => 'Sale TAX For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => $finalill->VAT,
					'Credit'         => 0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);


				$i++;
			}
			$output['marge_orderid'] = $marge_order_id;
			return $this->respondWithSuccess('Paiement de marge effectué avec succès !!', $output);
		}
	}
	public function margebill($marge_order_id)
	{
		$mydata['margeid'] = $marge_order_id;
		$allorderinfo = $this->App_android_model->margeview($marge_order_id);
		$allorderid = '';
		$totalamount = 0;
		$m = 0;
		foreach ($allorderinfo as $ordersingle) {
			$mydata['billorder'][$m] = $ordersingle->order_id;
			$allorderid .= $ordersingle->order_id . ',';
			$totalamount = $totalamount + $ordersingle->totalamount;

			$m++;
		}
		$mydata['billinfo'] = $this->App_android_model->margebill($marge_order_id);
		$billinfo = $this->db->select('*')->from('bill')->where('order_id', $mydata['billinfo'][0]->order_id)->get()->row();
		$mydata['cashierinfo']   = $this->App_android_model->read('*', 'user', array('id' => $billinfo->create_by));
		//print_r($data['cashierinfo']);
		$mydata['customerinfo']   = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $mydata['billinfo'][0]->customer_id));
		$mydata['billdate'] = $billinfo->bill_date;
		$mydata['tableinfo'] = $this->App_android_model->read('*', 'rest_table', array('tableid' => $mydata['billinfo'][0]->table_no));
		$mydata['iteminfo'] = $allorderinfo;
		$mydata['grandtotalamount'] = $totalamount;
		$settinginfo = $this->App_android_model->settinginfo();
		$mydata['settinginfo'] = $settinginfo;
		$mydata['taxinfos'] = $this->taxchecking();
		$mydata['storeinfo']      = $settinginfo;
		$mydata['currency'] = $this->App_android_model->currencysetting($settinginfo->currency);
		echo $viewprint = $this->load->view('themes/' . $this->themeinfo->themename . '/posmargeprint', $mydata, true);
	}
	private function taxchecking()
	{
		$taxinfos = '';
		/*if ($this->db->table_exists('tbl_tax')) {
    		$taxsetting = $this->db->select('*')->from('tbl_tax')->get()->row();
    	}
    	if($taxsetting->tax == 1){
    	$taxinfos = $this->db->select('*')->from('tax_settings')->get()->result_array();
    		}*/

		return $taxinfos;
	}
	public function removeformstock($orderid)
	{
		$possetting = $this->db->select('*')->from('tbl_posetting')->where('possettingid', 1)->get()->row();
		if ($possetting->productionsetting == 1) {
			$items = $this->App_android_model->customerorder($orderid);
			foreach ($items as $item) {

				$this->App_android_model->insert_product($item->menu_id, $item->varientid, $item->menuqty);
			}
		}
		return $possetting->productionsetting;
	}

	public function savekitchenitem($orderid)
	{
		$this->db->select('order_menu.*,item_foods.kitchenid');
		$this->db->from('order_menu');
		$this->db->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'Left');
		$this->db->where('order_menu.order_id', $orderid);
		$query = $this->db->get();
		$result = $query->result();

		foreach ($result as $single) {
			$isexist = $this->db->select('*')->from('tbl_kitchen_order')->where('kitchenid', $single->kitchenid)->where('orderid', $single->order_id)->where('itemid', $single->menu_id)->where('varient', $single->varientid)->get()->row();
			if (empty($isexist)) {
				$inserekit = array(
					'kitchenid'			=>	$single->kitchenid,
					'orderid'			=>	$single->order_id,
					'itemid'		    =>	$single->menu_id,
					'varient'		    =>	$single->varientid,
				);
				$this->db->insert('tbl_kitchen_order', $inserekit);
			}
			$updatetmenu = array(
				'food_status'           => 1,
				'allfoodready'     	   => 1
			);
			$this->db->where('order_id', $orderid);
			$this->db->update('order_menu', $updatetmenu);
		}
	}
	public function splitorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$orderid                 = $this->input->post('Orderid');
			$orderdetails = $this->db->select('order_menu.*,item_foods.*,variant.variantid,variant.variantName,variant.price as vprice')->from('order_menu')->join('customer_order', 'order_menu.order_id=customer_order.order_id', 'left')->join('item_foods', 'order_menu.menu_id=item_foods.ProductsID', 'left')->join('variant', 'order_menu.varientid=variant.variantid', 'left')->where('order_menu.order_id', $orderid)->get()->result();
			//print_r($orderdetails);

			if (!empty($orderdetails)) {
				$i = 0;
				foreach ($orderdetails as $order) {
					if ($order->price > 0) {
						$price = $order->price;
					} else {
						$price = $order->vprice;
					}
					$output['iteminfo'][$i]['orderid']        = $order->order_id;
					$output['iteminfo'][$i]['menuid']         = $order->row_id;
					$output['iteminfo'][$i]['ProductName']    = $order->ProductName;
					$output['iteminfo'][$i]['Varientname']    = $order->variantName;
					$output['iteminfo'][$i]['Varientid']      = $order->variantid;
					$output['iteminfo'][$i]['Itemqty']        = $order->menuqty;
					$output['iteminfo'][$i]['price']    	   = $price;
					if (!empty($order->add_on_id)) {
						$output['iteminfo'][$i]['addons']         = 1;
						$addons = explode(",", $order->add_on_id);
						$addonsqty = explode(",", $order->addonsqty);
						$x = 0;
						foreach ($addons as $addonsid) {
							$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
							$output['iteminfo'][$i]['addonsinfo'][$x]['add_on_name']        = $adonsinfo->add_on_name;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsid']           = $adonsinfo->add_on_id;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsprice']          = $adonsinfo->price;
							$output['iteminfo'][$i]['addonsinfo'][$x]['addonsquantity']     = $addonsqty[$x];
							$x++;
						}
					} else {
						$output['iteminfo'][$i]['addons'] = 0;
					}

					$i++;
				}
				return $this->respondWithSuccess('Diviser la liste des aliments', $output);
			} else {
				return $this->respondWithError('Aucun aliment fractionné trouvé !!!', $output);
			}
		}
	}
	public function splitordernum()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('numberofsplit', 'numberofsplit', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$orderid                 = $this->input->post('Orderid');
			$splitnumber                = $this->input->post('numberofsplit');
			$inserekit = array(
				'order_id'			=>	$orderid,
				'discount'			=>	'0.00',
				'status'		    =>	0
			);
			if (!empty($splitnumber)) {
				$isexist = $this->App_android_model->read('*', 'sub_order', array('order_id' => $orderid));
				if (!empty($isexist)) {
					$this->db->where('order_id', $orderid)->delete('sub_order');
				}
				$i = 0;
				for ($k = 1; $k <= $splitnumber; $k++) {
					$this->db->insert('sub_order', $inserekit);
					$insert_id = $this->db->insert_id();

					$output[$i]['orderid'] = $orderid;
					$output[$i]['splitid'] = $insert_id;
					$i++;
				}
				return $this->respondWithSuccess('Liste de commande fractionnée', $output);
			} else {
				return $this->respondWithError('Aucune commande fractionnée trouvée !!!', $output);
			}
		}
	}
	public function assignitemtosplitorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Orderid', 'Orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('menuid', 'menuid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('suborderid', 'suborderid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$orderid = $this->input->post('Orderid');
			$menuid = $this->input->post('menuid');
			$price = $this->input->post('price');
			$array_id  = array('order_id' => $orderid);
			$addonsprice = $this->input->post('addonsprice');
			$suborderid = $this->input->post('suborderid');
			$settinginfo = $this->App_android_model->settinginfo();
			$isexist = $this->App_android_model->read('*', 'sub_order', array('order_id' => $orderid));
			$billinfo = $this->App_android_model->read('*', 'bill', array('order_id' => $orderid));
			$suborder_info = $this->App_android_model->read_all('*', 'sub_order', $array_id, '', '');
			$order_menu = $this->App_android_model->updateSuborderData($menuid);
			$presentsub = array();
			$array_id = array('sub_id' => $suborderid);
			$addonsidarray = '';
			$addonsqty = '';
			$order_sub = $this->App_android_model->read('*', 'sub_order', $array_id);
			$check_id = array('order_menuid' => $menuid);
			$check_info = $this->App_android_model->read('*', 'check_addones', $check_id);
			if (!empty($order_menu->add_on_id) && empty($check_info)) {

				$addonsidarray = $order_menu->add_on_id;
				$addonsqty = $order_menu->addonsqty;

				$is_addons = array(
					'order_menuid' => $menuid,
					'sub_order_id' => $suborderid,
					'status' => 1

				);
				$this->db->insert('check_addones', $is_addons);
			}
			if (!empty($order_sub->order_menu_id)) {
				$presentsub = unserialize($order_sub->order_menu_id);
				if (array_key_exists($menuid, $presentsub)) {
					$presentsub[$menuid] = $presentsub[$menuid] + 1;
				} else {
					$presentsub[$menuid] = 1;
				}
			} else {
				$presentsub = array($menuid => 1);
			}
			$order_menu_id = serialize($presentsub);

			if (empty($addonsidarray)) {
				$updatetready = array(
					'order_menu_id'           => $order_menu_id,

				);
			} else {
				$updatetready = array(
					'order_menu_id'           => $order_menu_id,
					'adons_id'				  => $addonsidarray,
					'adons_qty'				  => $addonsqty
				);
			}
			$this->db->where('sub_id', $suborderid);
			$this->db->update('sub_order', $updatetready);
			$menuarray = array_keys($presentsub);
			$presenttab = $presentsub;
			$iteminfo = $this->App_android_model->updateSuborderDatalist($menuarray);
			$totalprice = 0;
			$totalvat = 0;
			$itemprice = 0;
			$SD = 0;
			if (!empty($iteminfo)) {
				$z = 0;
				foreach ($iteminfo as $item) {
					$isoffer = $this->App_android_model->read('*', 'order_menu', array('row_id' => $item->row_id));
					if ($isoffer->isgroup == 1) {
						$this->db->select('order_menu.*,item_foods.ProductName,item_foods.OffersRate,variant.variantid,variant.variantName,variant.price');
						$this->db->from('order_menu');
						$this->db->join('item_foods', 'order_menu.groupmid=item_foods.ProductsID', 'left');
						$this->db->join('variant', 'order_menu.groupvarient=variant.variantid', 'left');
						$this->db->where('order_menu.row_id', $item->row_id);
						$query = $this->db->get();
						$orderinfo = $query->row();
						$item->ProductName = $orderinfo->ProductName;
						$item->OffersRate = $orderinfo->OffersRate;
						$item->price = $orderinfo->price;
						$item->variantName = $orderinfo->variantName;
					}
					$adonsprice = 0;
					$addonsname = array();
					$addonsnamestring = '';
					$isaddones = $this->App_android_model->read('*', 'check_addones', array('order_menuid' => $item->row_id));
					if (!empty($item->add_on_id) && !empty($isaddones)) {
						$y = 0;
						$addons = explode(',', $item->add_on_id);
						$addonsqty = explode(',',  $item->addonsqty);
						foreach ($addons as $addonsid) {
							$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
							$addonsname[$y] = $adonsinfo->add_on_name;
							$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
							$adonsprice = $adonsprice + $adonsinfo->price * $addonsqty[$y];
							$y++;
						}
						$addonsnamestring = implode($addonsname, ',');
					}
					$output['iteminfo'][$z]['itemname'] = $item->ProductName . ',' . $addonsnamestring;
					$output['iteminfo'][$z]['varient'] = $item->variantName;
					$output['iteminfo'][$z]['price'] = $item->price;
					$output['iteminfo'][$z]['qty'] = $presenttab[$item->row_id];
					if ($item->OffersRate > 0) {
						$discountt = ($item->price * $item->OffersRate) / 100;
						$subtotalprice = $presenttab[$item->row_id] * $item->price - ($presenttab[$item->row_id] * $discountt) + $adonsprice;
						$totalprice = $totalprice + $presenttab[$item->row_id] * $item->price - ($presenttab[$item->row_id] * $discountt) + $adonsprice;
						$itemprice = $presenttab[$item->row_id] * $item->price - ($presenttab[$item->row_id] * $discountt) + $adonsprice;
					} else {
						$subtotalprice = $adonsprice + $presenttab[$item->row_id] * $item->price;
						$totalprice = $totalprice + $adonsprice + $presenttab[$item->row_id] * $item->price;
						$itemprice = $adonsprice + $presenttab[$item->row_id] * $item->price;
					}
					$output['iteminfo'][$z]['totalPrice'] = $subtotalprice;
					$vatcalc = $itemprice * $item->productvat / 100;
					$pvat = $vatcalc;
					if ($settinginfo->vat > 0) {
						$calvat = $itemprice * $settinginfo->vat / 100;
					} else {
						$calvat = $pvat;
					}
					$totalvat = $calvat + $totalvat;
					$msd = $itemprice * $settinginfo->servicecharge / 100;
					$SD = $msd + $SD;
					$z++;
				}
				if ($settinginfo->service_chargeType == 1) {
					$service_chrg_data = $SD;
				} else {
					$count = count($suborder_info);
					$service_chrg_data = $billinfo->service_charge / $count;
				}
				$output['Subtotal'] = number_format($totalprice, 3);
				$output['VAT'] = number_format($totalvat, 3);
				$output['Servicecharge'] = number_format($service_chrg_data, 3);
				$output['Grandtotal'] = number_format($totalprice + $totalvat + $service_chrg_data, 3);
				return $this->respondWithSuccess('Article ajouté à la commande fractionnée avec succès', $output);
			} else {
				return $this->respondWithError('Article non trouvé !!!', $output);
			}
		}
	}
	public function showsplitorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('orderid', 'orderid', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$orderid                 = $this->input->post('orderid');
			$array_id  = array('order_id' => $orderid);
			$order_info = $this->App_android_model->read('*', 'customer_order', $array_id);
			$settinginfo = $this->App_android_model->settinginfo();
			$iteminfo       = $this->App_android_model->customerorder($orderid);
			$suborder_info = $this->App_android_model->read_all('*', 'sub_order', $array_id, '', '');
			$i = 0;
			if (!empty($suborder_info)) {
				foreach ($suborder_info as $suborderitem) {
					if (!empty($suborderitem->order_menu_id)) {
						$presentsub = unserialize($suborderitem->order_menu_id);
						$menuarray = array_keys($presentsub);
						$suborder_info[$i]->suborderitem = $this->App_android_model->updateSuborderDatalist($menuarray);
					} else {
						$suborder_info[$i]->suborderitem = '';
					}
					$i++;
				}
			}
			$array_bill = array('order_id' => $orderid);
			$service = $this->App_android_model->read('service_charge', 'bill', $array_bill);
			$count = count($suborder_info);
			if (!empty($suborder_info)) {
				$k = 0;
				foreach ($suborder_info as $suborder) {
					$totalprice = 0;
					$totalvat = 0;
					$itemprice = 0;
					$output['splitorderinfo'][$k]['orderid'] = $orderid;
					$output['splitorderinfo'][$k]['splitid'] = $suborder->sub_id;
					$SD = 0;
					if (!empty($suborder->order_menu_id)) {
						$z = 0;
						$suborderqty = unserialize($suborder->order_menu_id);
						foreach ($suborder->suborderitem as $subitem) {
							$isoffer = $this->App_android_model->read('*', 'order_menu', array('row_id' => $subitem->row_id));
							if ($isoffer->isgroup == 1) {
								$this->db->select('order_menu.*,item_foods.ProductName,item_foods.OffersRate,variant.variantid,variant.variantName,variant.price');
								$this->db->from('order_menu');
								$this->db->join('item_foods', 'order_menu.groupmid=item_foods.ProductsID', 'left');
								$this->db->join('variant', 'order_menu.groupvarient=variant.variantid', 'left');
								$this->db->where('order_menu.row_id', $subitem->row_id);
								$query = $this->db->get();
								$orderinfo = $query->row();
								$subitem->ProductName = $orderinfo->ProductName;
								$subitem->OffersRate = $orderinfo->OffersRate;
								$subitem->price = $orderinfo->price;
								$subitem->variantName = $orderinfo->variantName;
							}
							$output['splitorderinfo'][$k]['iteminfo'][$z]['itemname'] = $subitem->ProductName;
							$output['splitorderinfo'][$k]['iteminfo'][$z]['varient'] = $subitem->variantName;
							$output['splitorderinfo'][$k]['iteminfo'][$z]['price'] = $subitem->price;
							$adonsprice = 0;
							$addonsname = array();
							$addonsnamestring = '';
							$isaddones = $this->App_android_model->read('*', 'check_addones', array('order_menuid' => $subitem->row_id));
							$output['splitorderinfo'][$k]['iteminfo'][$z]['isaddons'] = 0;
							if (!empty($subitem->add_on_id) && !empty($isaddones)) {
								$output['splitorderinfo'][$k]['iteminfo'][$z]['isaddons'] = 1;
								$y = 0;
								$addons = explode(',', $subitem->add_on_id);
								$addonsqty = explode(',',  $subitem->addonsqty);
								foreach ($addons as $addonsid) {
									$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
									$addonsname[$y] = $adonsinfo->add_on_name;
									$adonsinfo = $this->App_android_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
									$adonsprice = $adonsprice + $adonsinfo->price * $addonsqty[$y];
									$output['splitorderinfo'][$k]['iteminfo'][$z]['addonsinfo'][$y]['addonsname'] = $adonsinfo->add_on_name;
									$output['splitorderinfo'][$k]['iteminfo'][$z]['addonsinfo'][$y]['addonsprice'] = $adonsinfo->price * $addonsqty[$y];
									$y++;
								}
								$addonsnamestring = implode($addonsname, ',');
							}

							$output['splitorderinfo'][$k]['iteminfo'][$z]['qty'] = $suborderqty[$subitem->row_id];
							if ($subitem->OffersRate > 0) {
								$discountt = ($subitem->price * $subitem->OffersRate) / 100;
								$subtotalprice = $suborderqty[$subitem->row_id] * $subitem->price - ($suborderqty[$subitem->row_id] * $discountt) + $adonsprice;
								$totalprice = $totalprice + $suborderqty[$subitem->row_id] * $subitem->price - ($suborderqty[$subitem->row_id] * $discountt) + $adonsprice;
								$itemprice = $suborderqty[$subitem->row_id] * $subitem->price - ($suborderqty[$subitem->row_id] * $discountt) + $adonsprice;
							} else {
								$subtotalprice = $suborderqty[$subitem->row_id] * $subitem->price + $adonsprice;
								$itemprice = $suborderqty[$subitem->row_id] * $subitem->price + $adonsprice;
								$totalprice = $totalprice + $suborderqty[$subitem->row_id] * $subitem->price + $adonsprice;
							}
							$output['splitorderinfo'][$k]['iteminfo'][$z]['totalPrice'] = $subtotalprice;
							$vatcalc = $itemprice * $subitem->productvat / 100;
							$pvat = $vatcalc;
							if ($settinginfo->vat > 0) {
								$calvat = $itemprice * $settinginfo->vat / 100;
							} else {
								$calvat = $pvat;
							}
							$totalvat = $calvat + $totalvat;
							$msd = $itemprice * $settinginfo->servicecharge / 100;
							$SD = $msd + $SD;
							$z++;
						}
					}
					if ($settinginfo->service_chargeType == 1) {
						$service_chrg_data = $SD;
					} else {
						$service_chrg_data = $service->service_charge / $count;
					}
					$output['splitorderinfo'][$k]['Subtotal'] = number_format($totalprice, 3, '.', '');
					$output['splitorderinfo'][$k]['VAT'] = number_format($totalvat, 3, '.', '');
					$output['splitorderinfo'][$k]['Servicecharge'] = number_format($service_chrg_data, 3, '.', '');
					$output['splitorderinfo'][$k]['Grandtotal'] = number_format($totalprice + $totalvat + $service_chrg_data, 3, '.', '');
					$k++;
				}

				return $this->respondWithSuccess('Diviser les informations de commande', $output);
			} else {
				return $this->respondWithError('Aucun article de commande fractionné !!!', $output);
			}
		}
	}
	public function paysplitorder()
	{
		$this->form_validation->set_rules('id', 'id', 'required|xss_clean|trim');
		$this->form_validation->set_rules('splitid', 'splitid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('vat', 'vat', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Servicecharge', 'Servicecharge', 'required|xss_clean|trim');
		$this->form_validation->set_rules('customerid', 'customerid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('Grandtotal', 'Grandtotal', 'required|xss_clean|trim');
		$this->form_validation->set_rules('payinfo', 'payinfo', 'required|xss_clean|trim');
		$this->form_validation->set_rules('orderid', 'orderid', 'required|xss_clean|trim');
		$this->form_validation->set_rules('discount', 'discount', 'required|xss_clean|trim');
		if ($this->form_validation->run() == FALSE) {
			$errors = $this->form_validation->error_array();
			return $this->respondWithValidationError($errors);
		} else {
			$output = array();
			$orderidm                 = $this->input->post('orderid');
			$sub_id                  = $this->input->post('splitid');
			$vat                     = $this->input->post('vat');
			$service                 = $this->input->post('Servicecharge');
			$total                   = $this->input->post('Grandtotal');
			$customerid              = $this->input->post('customerid');
			$payinfo                 = $this->input->post('payinfo');
			$discount                = $this->input->post('discount');
			$gtotal = $service + $vat + $total;
			$updatetordfordiscount = array(
				'vat'           => $vat,
				's_charge'      => $service,
				'total_price'   => $total,
				'customer_id'   => $customerid,
				'status'        => 1,
				'discount'      => $discount
			);
			$this->db->where('sub_id', $sub_id);
			$this->db->update('sub_order', $updatetordfordiscount);
			$paidamount = 0;
			$array_id = array('sub_id' => $sub_id);
			$order_sub = $this->App_android_model->read('*', 'sub_order', $array_id);
			$order_id = $order_sub->order_id;
			$array_biil_id = array('order_id' => $order_id);
			$billinfo = $this->App_android_model->read('*', 'bill', $array_biil_id);
			$billid = $billinfo->bill_id;
			$i = 0;
			$getmpay = json_decode($payinfo);
			$i = 0;
			foreach ($getmpay as $paymentinfo) {
				$paidamount = $paidamount + $paymentinfo->amount;
				$multipay = array(
					'order_id'			=>	$order_id,
					'payment_type_id'	=>	$paymentinfo->payment_type_id,
					'amount'		    =>	$paymentinfo->amount,
				);

				$this->db->insert('multipay_bill', $multipay);
				$multipay_id = $this->db->insert_id();
				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $order_id)->get()->row();
				$cusinfo = $this->db->select('*')->from('customer_info')->where('customer_id', $orderinfo->customer_id)->get()->row();
				if ($paymentinfo->payment_type_id != 1) {
					if ($paymentinfo->payment_type_id == 4) {
						$headcode = 1020101;
					} else {
						$paytype = $this->db->select('payment_method')->from('payment_method')->where('payment_method_id', $paymentinfo->payment_type_id)->get()->row();
						$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $paytype->payment_method)->get()->row();
						$headcode = $coainfo->HeadCode;
					}
					$income3 = array(
						'VNo'            => "Sale" . $orderinfo->saleinvoice,
						'Vtype'          => 'Sales Products',
						'VDate'          =>  $orderinfo->order_date,
						'COAID'          => $headcode,
						'Narration'      => 'Sale Income For Online payment by split order' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
						'Debit'          => $paymentinfo->amount,
						'Credit'         => 0,
						'IsPosted'       => 1,
						'CreateBy'       => $this->input->post('id'),
						'CreateDate'     => $orderinfo->order_date,

						'IsAppove'       => 1
					);
					$this->db->insert('acc_transaction', $income3);
				}
				if ($paymentinfo->payment_type_id == 1) {
					$cardinformation = $paymentinfo->cardpinfo;
					foreach ($cardinformation as $paycard) {
						$cardinfo = array(
							'bill_id'			    =>	$billid,
							'multipay_id'			=>	$multipay_id,
							'card_no'		        =>	$paycard->card_no,
							'terminal_name'		    =>	$paycard->terminal_name,
							'bank_name'	            =>	$paycard->Bank,
						);

						$this->db->insert('bill_card_payment', $cardinfo);
						$bankinfo = $this->db->select('bank_name')->from('tbl_bank')->where('bankid', $paycard->Bank)->get()->row();
						$coainfo = $this->db->select('HeadCode')->from('acc_coa')->where('HeadName', $bankinfo->bank_name)->get()->row();
						$saveid = $this->input->post('id');
						$income2 = array(
							'VNo'            => "Sale" . $orderinfo->saleinvoice,
							'Vtype'          => 'Sales Products',
							'VDate'          =>  $orderinfo->order_date,
							'COAID'          => $coainfo->HeadCode,
							'Narration'      => 'Sale Income For App' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
							'Debit'          => $paymentinfo->amount,
							'Credit'         => 0,
							'IsPosted'       => 1,
							'CreateBy'       => $saveid,
							'CreateDate'     => $orderinfo->order_date,
							'IsAppove'       => 1
						);
						$this->db->insert('acc_transaction', $income2);
					}
				}
				$i++;
			}
			$where_array = array('status' => 0, 'order_id' => $order_id);
			$orderData = array(
				'splitpay_status'     => 1
			);
			$this->db->where('order_id', $order_id);
			$this->db->update('customer_order', $orderData);
			$totalorder = $this->db->select('*')->from('sub_order')->where('status', 0)->where('order_id', $order_id)->get()->num_rows();
			if ($totalorder == 0) {
				$totandiscount = $this->db->select('SUM(discount) as totaldiscount')->from('sub_order')->where('order_id', $order_id)->get()->row();
				$billinfo = $this->db->select('bill_amount')->from('bill')->where('order_id', $order_id)->get()->row();
				$saveid = $this->session->userdata('id');
				$this->savekitchenitem($order_id);
				$this->removeformstock($order_id);
				$orderData = array(
					'order_status'     => 4,
				);
				$this->db->where('order_id', $order_id);
				$this->db->update('customer_order', $orderData);

				$updatetbill = array(
					'bill_status'           => 1,
					'discount'			   => $totandiscount->totaldiscount,
					'bill_amount'		   => $billinfo->bill_amount - $totandiscount->totaldiscount,
					'payment_method_id'     => $getmpay[0]->payment_type_id,
					'create_by'     		   => $this->input->post('id'),
					'create_at'     		   => date('Y-m-d H:i:s')
				);
				$this->db->where('order_id', $order_id);
				$this->db->update('bill', $updatetbill);
				$this->savekitchenitem($order_id);
				$this->db->where('order_id', $order_id)->delete('table_details');

				$orderinfo = $this->db->select('*')->from('customer_order')->where('order_id', $order_id)->get()->row();
				$finalill = $this->db->select('*')->from('bill')->where('order_id', $order_id)->get()->row();
				$headn = $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name;
				$coainfo = $this->db->select('*')->from('acc_coa')->where('HeadName', $headn)->get()->row();
				$customer_headcode = $coainfo->HeadCode;

				$invoice_no = $orderinfo->saleinvoice;
				$saveid = $this->session->userdata('id');
				//Customer debit for Product Value
				$cosdr = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer debit for Product Invoice#' . $invoice_no,
					'Debit'          =>  $finalill->bill_amount,
					'Credit'         =>  0,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cosdr);
				//Store credit for Product Value
				$sc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  10107,
					'Narration'      =>  'Inventory Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $sc);

				// Customer Credit for paid amount.
				$cc = array(
					'VNo'            =>  $invoice_no,
					'Vtype'          =>  'CIV',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          =>  $customer_headcode,
					'Narration'      =>  'Customer Credit for Product Invoice#' . $invoice_no,
					'Debit'          =>  0,
					'Credit'         =>  $finalill->bill_amount,
					'StoreID'        =>  0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $cc);

				// Income for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 303,
					'Narration'      => 'Sale Income For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => 0,
					'Credit'         => $finalill->bill_amount - $finalill->VAT, //purchase price asbe
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);

				// Tax Pay for company							 
				$income = array(
					'VNo'            => "Sale" . $orderinfo->saleinvoice,
					'Vtype'          => 'Sales Products Vat',
					'VDate'          =>  $orderinfo->order_date,
					'COAID'          => 502030101,
					'Narration'      => 'Sale TAX For ' . $cusinfo->cuntomer_no . '-' . $cusinfo->customer_name,
					'Debit'          => $finalill->VAT,
					'Credit'         => 0,
					'IsPosted'       => 1,
					'CreateBy'       => $saveid,
					'CreateDate'     => $orderinfo->order_date,
					'IsAppove'       => 1
				);
				$this->db->insert('acc_transaction', $income);
			}
			$output['orderid'] = $sub_id;
			return $this->respondWithSuccess('print Split invoice', $output);
		}
	}
	public function posprintdirectsub($id)
	{
		$array_id =  array('sub_id' => $id);
		$order_sub = $this->App_android_model->read('*', 'sub_order', $array_id);
		$presentsub = unserialize($order_sub->order_menu_id);
		$menuarray = array_keys($presentsub);
		$data['iteminfo'] = $this->App_android_model->updateSuborderDatalist($menuarray);
		$saveid = $this->session->userdata('id');
		$isadmin = $this->session->userdata('user_type');



		//if($customerorder->waiter_id==$saveid || $isadmin==1){
		$data['orderinfo']  	   = $order_sub;
		$data['customerinfo']   = $this->App_android_model->read('*', 'customer_info', array('customer_id' => $order_sub->customer_id));

		$data['billinfo']	   = $this->App_android_model->billinfo($order_sub->order_id);
		$data['cashierinfo']   = $this->App_android_model->read('*', 'user', array('id' => $data['billinfo']->create_by));
		$data['mainorderinfo']  	   = $this->App_android_model->read('*', 'customer_order', array('order_id' => $order_sub->order_id));
		$data['tableinfo'] = $this->App_android_model->read('*', 'rest_table', array('tableid' => $data['mainorderinfo']->table_no));
		$settinginfo = $this->App_android_model->settinginfo();
		$data['settinginfo'] = $settinginfo;
		$data['storeinfo']      = $settinginfo;
		$data['currency'] = $this->App_android_model->currencysetting($settinginfo->currency);
		$data['taxinfos'] = $this->taxchecking();
		$data['module'] = "ordermanage";
		$data['page']   = "posinvoice";

		echo $viewprint = $this->load->view('themes/' . $this->themeinfo->themename . '/posprintsuborder', $data, true);
		exit;
	}
	public function cashcounter(){
	  
			 $this->load->library('form_validation');
		     $this->form_validation->set_rules('android','android','required|max_length[100]');
			 if ($this->form_validation->run() == FALSE){
                $errors = $this->form_validation->error_array();
                return $this->respondWithValidationregisError($errors);
            }
            else
            {
				 $output = array();
				 $counterlist=$this->App_android_model->counterlist();
				 
				if($counterlist != FALSE) {
						  $i=0;
						 foreach ($counterlist as $counter) {
						 $output['counterinfo'][$i]['countedid']       = $counter->ccid;
						 $output['counterinfo'][$i]['counterno']       = $counter->counterno;
						 $i++;
                     	}
						return $this->respondWithSuccess('All Counter List.', $output);
					}
				else{
						return $this->respondWithError('Counter Not Found.!!!',$output);
					}
			}
		}
	public function checkregister(){
			 $this->load->library('form_validation');
		     $this->form_validation->set_rules('userid','userid','required');
		     $this->form_validation->set_rules('counter',display('counter'),'required');
	         $this->form_validation->set_rules('totalamount',display('amount'),'required');
			 if ($this->form_validation->run() == FALSE){
                $errors = $this->form_validation->error_array();
                return $this->respondWithValidationregisError($errors);
            }
            else
            {
				 $output = array();
				 $userid = $this->input->post('userid');
				 $counter = $this->input->post('counter');
				 $openingamount=$this->input->post('totalamount',true);
				 $checkuser = $this->db->select('*')->from('tbl_cashregister')->where('userid',$userid)->where('status',0)->order_by('id','DESC')->get()->row(); 
				 $checkcounter = $this->db->select('*')->from('tbl_cashregister')->where('counter_no',$counter)->where('status',0)->get()->row();
				 if(empty($checkuser)){
					 if(empty($checkcounter)){
						 $output['counterstatus'] =1; 
						 $postData = array(
            				'userid' 	        => $userid,
            				'counter_no' 	    => $counter,
            				'opening_balance' 	=> $openingamount,
            				'closing_balance' 	=> '0.000',
            				'openclosedate' 	=> date('Y-m-d'),
            				'opendate' 	        => date('Y-m-d H:i:s'),
            				'closedate' 	    => "1970-01-01 00:00:00",
            				'status' 	        => 0,
            				'openingnote' 	    => $this->input->post('OpeningNote',true),
            				'closing_note' 	    => "",
            			);
            			//print_r($postData);
            			  $this->db->insert('tbl_cashregister',$postData);
            			  $inseruser = $this->db->select('*')->from('tbl_cashregister')->where('userid',$userid)->where('status',0)->order_by('id','DESC')->get()->row(); 
						  $output['userid'] =$inseruser->userid;
						  $output['counter_no'] =$inseruser->counter_no;
						  $output['registerid'] =$inseruser->id;
						  $output['opening_balance'] =$openingamount;
						  $output['closing_balance'] =$inseruser->closing_balance;
						  $output['openclosedate'] =$inseruser->openclosedate;
						  $output['opendate'] =$inseruser->opendate;
						  $output['status'] =$inseruser->status;
						  $output['openingnote'] =$inseruser->openingnote;
						  $output['closing_note'] =$inseruser->closing_note;
					}else{
						$output['counterstatus'] =0;
					}
				 return $this->respondWithSuccess('Cash register info.', $output);
				}else{
				          $output['userid'] =$checkuser->userid;
						  $output['counter_no'] =$checkuser->counter_no;
						  $output['registerid'] =$checkuser->id;
						  $output['opening_balance'] =$checkuser->opening_balance;
						  $output['closing_balance'] =$checkuser->closing_balance;
						  $output['openclosedate'] =$checkuser->openclosedate;
						  $output['opendate'] =$checkuser->opendate;
						  $output['status'] =$checkuser->status;
						  $output['openingnote'] =$checkuser->openingnote;
						  $output['closing_note'] =$checkuser->closing_note;
					return $this->respondWithSuccess('Cash register info.!!!',$output);
				} 
			}
		}
	public function cashregisterclose(){
			 $this->load->library('form_validation');
		     $this->form_validation->set_rules('totalamount',display('amount'),'required');
		      $this->form_validation->set_rules('userid','userid','required');
			 if ($this->form_validation->run() == FALSE){
                $errors = $this->form_validation->error_array();
                return $this->respondWithValidationregisError($errors);
            }
            else
            {
                 $cashclose=$this->input->post('registerid');
                 $userid = $this->input->post('userid');
				 				  $output = array();
				  $postData = array(
    		 		'id' 			=> $cashclose,
    				'closing_balance' 	=> $this->input->post('totalamount',true),
    				'closedate' 	    => date('Y-m-d H:i:s'),
    				'status' 	        => 1,
    				'closing_note' 	    => $this->input->post('closingnote',true),
    			);
    		
    			$this->db->where('id',$postData["id"])->update('tbl_cashregister', $postData);
    			//echo $this->db->last_query();
				 return $this->respondWithSuccess('Cash Register Successfully synchronization', $output);
			}
		}
}
