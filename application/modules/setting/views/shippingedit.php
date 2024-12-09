<div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel">
               
                <div class="panel-body">

                    <?php echo  form_open('setting/shippingmethod/create') ?>
                    <?php echo form_hidden('ship_id', (!empty($intinfo->ship_id)?$intinfo->ship_id:null)) ?>
                        <div class="form-group row">
                            <label for="shipping" class="col-sm-5 col-form-label"><?php echo display('shipping_name') ?></label>
                            <div class="col-sm-7">
                                 <input name="shipping" class="form-control" type="text" placeholder="<?php echo display('shipping_name') ?>" id="shipping" value="<?php echo (!empty($intinfo->shipping_method)?$intinfo->shipping_method:null) ?>">
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label for="shippingrate" class="col-sm-5 col-form-label"><?php echo display('shippingrate') ?> *</label>
                            <div class="col-sm-7">
                                <input name="shippingrate" class="form-control" type="text" placeholder="Add <?php echo display('shippingrate') ?>" id="shippingrate" value="<?php echo (!empty($intinfo->shippingrate)?$intinfo->shippingrate:null) ?>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="paymentmethod" class="col-sm-5 col-form-label"><?php echo display('payment_add') ?> *</label>
                            <div class="col-sm-7">
                                <select name="paymentmethod[]" class="form-control" multiple="multiple" >
                                        <?php if (!empty($paymentinfo)) {
                                				foreach ($paymentinfo as $payment) {
													$slpayment=explode(',',$intinfo->payment_method);
													foreach($slpayment as $selmethod){
														if($selmethod==$payment->payment_method_id){
                            			?>
                                        <option value="<?php echo $payment->payment_method_id; ?>" selected="selected"><?php echo $payment->payment_method; ?></option>
                                        <?php } } ?>
										<option value="<?php echo $payment->payment_method_id; ?>"><?php echo $payment->payment_method; ?></option>
										<?php  } } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                        <label for="status" class="col-sm-5 col-form-label"><?php echo display('shipping_type');?></label>
                        <div class="col-sm-7 customesl">
                            <select name="shippintype" class="form-control">
                                <option value=""><?php echo display('select_option');?></option>
                                <option value="3" <?php if(!empty($intinfo)){if($intinfo->shiptype==3){echo "Selected";}} ?>><?php echo display('home') ?></option>
                                <option value="2" <?php if(!empty($intinfo)){if($intinfo->shiptype==2){echo "Selected";}} ?>><?php echo display('pickup') ?></option>
								<option value="1" <?php if(!empty($intinfo)){if($intinfo->shiptype==1){echo "Selected";}} ?>><?php echo display('dine_in') ?></option>
                              </select>
                        </div>
                    </div>
						<div class="form-group row">
                        <label for="status" class="col-sm-5 col-form-label"><?php echo display('status') ?></label>
                        <div class="col-sm-7">
                            <select name="status"  class="form-control">
                                <option value=""  selected="selected"><?php echo display('select_option');?></option>
                                <option value="1" <?php if(!empty($intinfo)){if($intinfo->is_active==1){echo "Selected";}} ?>><?php echo display('active')?></option>
                                <option value="0" <?php if(!empty($intinfo)){if($intinfo->is_active==0){echo "Selected";}} ?>><?php echo display('inactive')?></option>
                              </select>
                        </div>
                    </div>
  
                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-success w-md m-b-5"><?php echo display('update') ?></button>
                        </div>
                    <?php echo form_close() ?>

                </div>  
            </div>
        </div>
    </div>