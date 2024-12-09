
 <div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd ">
            <div class="panel-heading">
                <div class="panel-title">
                    <h4><?php echo (!empty($title)?$title:null) ?></h4>
                </div>
            </div>
            <div class="panel-body">
 					<?php echo  form_open('dashboard/web_setting/createaddress',array('id'=>'menuurl')) ?>
                        <div class="form-group row">
                            <label for="widgettitle" class="col-sm-4 col-form-label"><?php echo display('seo_description') ?></label>
                            <div class="col-sm-8">
                            	 <textarea name="descp" id="descp" class="form-control"  placeholder="<?php echo display('seo_description') ?>"  rows="4"></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group text-right" id="upbtn">
                            <button type="submit" class="btn btn-success w-md m-b-5 menu_dashboard_display" id="btnchnage" ><?php echo display('Ad') ?></button>
                        </div>
                    <?php echo form_close() ?>
                    <table class="table table-bordered table-hover" id="RoleTbl">
                        <thead>
                            <tr>
                                <th><?php echo display('sl_no') ?></th>
                                <th><?php echo display('address') ?></th>
                                <th><?php echo display('action') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($address_list)){ ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($address_list as $row) { 
							$description=base64_encode($row->deladdress);  
							?>
                            <tr>
                                <td><?php echo $sl++; ?></td>
                                <td><?php echo $row->deladdress; ?></td>
                                <td>
                                    <a onclick="editaddress('<?php echo $description; ?>',<?php echo $row->delivaryid; ?>)"  data-toggle="tooltip" data-placement="left" title="Update" class="btn btn-success btn-sm"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                	
                                </td>
                            </tr>
					
							
							<?php  } }  ?>
                            
                        </tbody>
                    </table>


            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url('application/modules/dashboard/assest/js/address.js'); ?>" type="text/javascript"></script>





 