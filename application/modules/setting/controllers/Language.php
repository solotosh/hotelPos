<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Language extends MX_Controller {

    private $table  = "language";
    private $phrase = "phrase";

    public function __construct()
    {
        parent::__construct();  
		$this->db->query('SET SESSION sql_mode = ""');
        $this->load->database();
        $this->load->dbforge(); 
        $this->load->helper('language');
        $this->load->model(array('language_model'));	
        //$this->load->library('excel');
        if (!$this->session->userdata('isAdmin')) 
            redirect('login');
        
    } 

    public function index()
    {
        $this->permission->method('setting','read')->redirect();
		$data['title']     = display('language_list');
        $data['module']    = "setting";
        $data['page']      = "language/main";
        $data['languages'] = $this->languages();
        echo modules::run('template/layout', $data);
    }
	public function deletelang($column)
    {
        $this->dbforge->drop_column('language', $column);
		redirect('setting/language');
    }

    public function phrase()
    {
        $this->permission->method('setting','read')->redirect();
		$this->load->library('pagination');
        #------------------#
        $data['title']     = "Phrase List";
        $data['module']    = "setting";
        $data['page']      = "language/phrase"; 
        #
        #pagination starts
        #
        $config["base_url"]       = base_url('setting/language/phrase/'); 
        $config["total_rows"]     = $this->db->count_all('language'); 
        $config["per_page"]       = 25;
        $config["uri_segment"]    = 4; 
        $config["num_links"]      = 5;  
        /* This Application Must Be Used With BootStrap 3 * */
        $config['full_tag_open']  = "<ul class='pagination col-xs pull-right m-0'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open']   = '<li>';
        $config['num_tag_close']  = '</li>';
        $config['cur_tag_open']   = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close']  = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open']  = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open']  = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open']  = "<li>";
        $config['last_tagl_close'] = "</li>"; 
        /* ends of bootstrap */
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        $data["phrases"] = $this->phrases($config["per_page"], $page); 
        $data["links"] = $this->pagination->create_links(); 
        #
        #pagination ends
        # 
        echo modules::run('template/layout', $data);
    }
 	public function downloadformat(){
				$this->permission->method('setting','read')->redirect();
				$spreadsheet = new Spreadsheet();
				$sheet = $spreadsheet->getActiveSheet();
				$alphabet=array(3=>"A",4=>"B",5=>"C",6=>"D",7=>"E",8=>"F",9=>"G",10=>"H",11=>"I",12=>"J",13=>"K",14=>"L",15=>"M",16=>"N",17=>"O",18=>"P",19=>"Q",20=>"R",21=>"S",22=>"T",23=>"U",24=>"V",25=>"W",26=>"X",27=>"Y",28=>"Z");
				if($this->db->table_exists($this->table)) { 
                $fields = $this->db->field_data($this->table);
				$lastnum= count($fields)-1;
                $i = 1;
                foreach ($fields as $field)
                {  
				$i++;
                    if ($i > 2){
					$result[$i] = $field->name;
					$sheet->setCellValue($alphabet[$i]."1", $field->name);
					}
                }
				$rowCount   =   2;
				$languagelist=$this->db->select('*')->from($this->table)->order_by('phrase','asc')->get()->result();
				foreach($languagelist as $row){
					$k=2;
					foreach($result as $flname){
						$k++;
						$sheet->SetCellValue($alphabet[$k].$rowCount, $row->$flname,'UTF-8');
						}
						$rowCount++;
					}
					
        }
					 $writer = new Xlsx($spreadsheet);
					 $filename = 'example.xlsx';
					 header('Content-Type: application/vnd.ms-excel');
					 header('Content-Disposition: attachment;filename="'. $filename .'.xlsx"'); 
					 header('Cache-Control: max-age=0');
					 $writer->save('php://output'); // download file 
		}
	public function bulklanupload(){
		$this->permission->method('setting','read')->redirect();
			if(!empty($_FILES["userfile"]["name"])) {
				$_FILES["userfile"]["name"];
            	$path = $_FILES["userfile"]["tmp_name"];
				$upload_file=$_FILES["userfile"]["name"];
				$extension=pathinfo($upload_file,PATHINFO_EXTENSION);
				if ($extension=='csv') {
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
				}elseif ($extension=='xls') {
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
				}else{
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
				}
				$spreadsheet = $reader->load($_FILES["userfile"]["tmp_name"]);
				$sheetdata = $spreadsheet->getActiveSheet()->toArray();				
				$datacount = count($sheetdata);
				
            	if ($datacount>1) {
            for ($m=1; $m < $datacount; $m++) {
				$phase=$sheetdata[$m][0];
                if($this->db->table_exists($this->table)) { 
						$fields = $this->db->field_data($this->table);
						$i = 1;
						$k=1;
						foreach ($fields as $field)
						{  
						$i++;
							if ($i > 3){
							$result[$i] = $field->name;
								(Object) $languageData = array(
									
									$field->name     	=> $sheetdata[$m][$k]
									);
									$this->db->where('phrase', $phase)->update($this->table, $languageData);
							$k++;
							}
						}
					
					}

            }
        }
            $this->session->set_flashdata('message', display('save_successfully'));
            echo '<script>window.location.href = "'.base_url().'setting/language/"</script>';
			}
			else{
				$this->session->set_flashdata('exception',  display('please_try_again'));
				redirect("setting/language/"); 
				}
		}
		
	public function downloadformatsingle($language){
		$this->permission->method('setting','read')->redirect();
		        $spreadsheet = new Spreadsheet();
				$sheet = $spreadsheet->getActiveSheet();
			$rowCount   =   2;	
		if($language=="english"){
			$sheet->setCellValue("A1", "phrase");
			$sheet->setCellValue("B1", $language);
			$languagelist=$this->db->select('phrase,'.$language)->from($this->table)->order_by('phrase','asc')->get()->result();
			foreach($languagelist as $row){
				$sheet->SetCellValue('A'.$rowCount, $row->phrase,'UTF-8');
				$sheet->SetCellValue('B'.$rowCount, $row->$language,'UTF-8');
				$rowCount++;
			}
		}else{
				$sheet->SetCellValue("A1", "phrase");
				$sheet->SetCellValue("B1", "english");
				$sheet->SetCellValue("C1", $language);
				$languagelist=$this->db->select('phrase,english,'.$language)->from($this->table)->order_by('phrase','asc')->get()->result();
				foreach($languagelist as $row){
					$sheet->SetCellValue('A'.$rowCount, $row->phrase,'UTF-8');
					$sheet->SetCellValue('B'.$rowCount, $row->english,'UTF-8');
					$sheet->SetCellValue('C'.$rowCount, $row->$language,'UTF-8');
					$rowCount++;
				}
			
			}
		
		   			 $writer = new Xlsx($spreadsheet);
					 $filename = 'example.xlsx';
					 header('Content-Type: application/vnd.ms-excel');
					 header('Content-Disposition: attachment;filename="'. $filename .'.xlsx"'); 
					 header('Cache-Control: max-age=0');
					 $writer->save('php://output'); // download file 
		}
	public function bulklanuploadsingle($language){
		$this->permission->method('setting','read')->redirect();
			if(!empty($_FILES["userfile"]["name"])) {
				$_FILES["userfile"]["name"];
            	$path = $_FILES["userfile"]["tmp_name"];
				$upload_file=$_FILES["userfile"]["name"];
				$extension=pathinfo($upload_file,PATHINFO_EXTENSION);
				if ($extension=='csv') {
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
				}elseif ($extension=='xls') {
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
				}else{
					$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
				}
				$spreadsheet = $reader->load($_FILES["userfile"]["tmp_name"]);
				$sheetdata = $spreadsheet->getActiveSheet()->toArray();				
				$datacount = count($sheetdata);
				
            	if ($datacount>1) {
					for ($m=1; $m < $datacount; $m++) { 
						$phase=$sheetdata[$m][0];
						if($language=="english"){
							$targetlan=$sheetdata[$m][1];
						}else{
							$english=$sheetdata[$m][1];
							$targetlan=$sheetdata[$m][2];
							}
						(Object) $languageData = array(
								$language	=> $targetlan
								);
						$this->db->where('phrase', $phase)->update($this->table, $languageData);
					}
				}
            $this->session->set_flashdata('message', display('save_successfully'));
            echo '<script>window.location.href = "'.base_url().'setting/language/editPhrase/'.$language.'"</script>';
			}
			else{
				$this->session->set_flashdata('exception',  display('please_try_again'));
				redirect("setting/language/editPhrase/".$language); 
				}
		}
		
	
    public function languages()
    { 
        if ($this->db->table_exists($this->table)) { 

                $fields = $this->db->field_data($this->table);

                $i = 1;
                foreach ($fields as $field)
                {  
                    if ($i++ > 2)
                    $result[$field->name] = ucfirst($field->name);
                }

                if (!empty($result)) return $result;
 

        } else {
            return false; 
        }
    }


    public function addLanguage()
    { 
        $language = preg_replace('/[^a-zA-Z0-9_]/', '', $this->input->post('language',true));
        $language = strtolower($language);

        if (!empty($language)) {
            if (!$this->db->field_exists($language, $this->table)) {
                $this->dbforge->add_column($this->table, [
                    $language => [
                        'type' => 'TEXT'
                    ]
                ]); 
                $this->session->set_flashdata('message', 'Language added successfully');
                redirect('setting/language');
            } 
        } else {
            $this->session->set_flashdata('exception', 'Please try again');
        }
        redirect('setting/language');
    }


    public function editPhrase($language = null)
    { 
        $this->load->library('pagination');
        #------------------#
        $data['title']     = "Edit Phrase";
        $data['module']    = "setting";
        $data['language'] = $language;
        $data['page']      = "language/phrase_edit";
        #
        #pagination starts
        #
        
        #
        #pagination ends
        #  
        echo modules::run('template/layout', $data);

    }
    public function searchlang($language){
       
        $list = $this->language_model->get_alllanguage($language,$this->phrase);
                $data = array();
		        $no = $_POST['start'];
                    foreach($list as $rowdata){
                        $no++;
			            $row = array();
			            $row[] = $no;
			            $row[] = '<input type="text" name="phrase[]" style="width:90%" value="'.$rowdata->phrase.'" class="form-control" readonly>';
			            $row[] = '<input type="text" name="lang[]" style="width:95%" value="'.$rowdata->$language.'" class="form-control">';
			            $data[] = $row;
                    }
                    $output = array(
						"draw" => $_POST['draw'],
						"recordsTotal" => $this->language_model->count_allonlineorder($language,$this->phrase),
						"recordsFiltered" => $this->language_model->count_filtertonlineorder($language,$this->phrase),
						"data" => $data,
				);
		        echo json_encode($output);


    }

    public function addPhrase() {  

        $lang = $this->input->post('phrase'); 

        if (sizeof($lang) > 0) {

            if ($this->db->table_exists($this->table)) {

                if ($this->db->field_exists($this->phrase, $this->table)) {

                    foreach ($lang as $value) {

                        $value = preg_replace('/[^a-zA-Z0-9_]/', '', $value);
                        $value = strtolower($value);

                        if (!empty($value)) {
                            $num_rows = $this->db->get_where($this->table,[$this->phrase => $value])->num_rows();

                            if ($num_rows == 0) { 
                                $this->db->insert($this->table,[$this->phrase => $value]); 
                                $this->session->set_flashdata('message', 'Phrase added successfully');
                            } else {
                                $this->session->set_flashdata('exception', 'Phrase already exists!');
                            }
                        }   
                    }  

                    redirect('setting/language/phrase');
                }  

            }
        } 

        $this->session->set_flashdata('exception', 'Please try again');
        redirect('setting/language/phrase');
    }
 
    public function phrases($offset=null, $limit=null)
    {
        if ($this->db->table_exists($this->table)) {

            if ($this->db->field_exists($this->phrase, $this->table)) {

                return $this->db->order_by($this->phrase,'asc')
                    ->limit($offset, $limit)
                    ->get($this->table)
                    ->result();

            }  

        } 

        return false;
    }

    public function addLebel() { 
        $language = $this->input->post('language', true);
        $phrase   = $this->input->post('phrase', true);
        $lang     = $this->input->post('lang', true);

        if (!empty($language)) {

            if ($this->db->table_exists($this->table)) {

                if ($this->db->field_exists($language, $this->table)) {

                    if (sizeof($phrase) > 0)
                    for ($i = 0; $i < sizeof($phrase); $i++) {
                        $this->db->where($this->phrase, $phrase[$i])
                            ->set($language,$lang[$i])
                            ->update($this->table); 

                    }  
                    $this->session->set_flashdata('message', 'Label added successfully!');
                    redirect($_SERVER['HTTP_REFERER']);

                }  

            }
        } 

        $this->session->set_flashdata('exception', 'Please try again');
        redirect('setting/language/editPhrase/'.$language);
    }
}



 