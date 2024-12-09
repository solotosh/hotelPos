
<div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel">
               
                <div class="panel-body">
                    <?php echo form_hidden('purID', (!empty($intinfo->purID)?$intinfo->purID:null)) ?>
                    <fieldset class="border p-2">
                       <legend  class="w-auto"><?php echo display('set_productioncost') ?></legend>
                    </fieldset>
                    <?php echo form_open_multipart('production/production/production_entry',array('class' => 'form-vertical', 'id' => 'insert_purchase','name' => 'insert_purchase'))?>
                    <input name="url" type="hidden" id="url" value="<?php echo base_url("production/production/productionitem") ?>" />

                    <div class="row">
                             <div class="col-sm-6">
                               <div class="form-group row">
                                    <label for="supplier_sss" class="col-sm-4 col-form-label"><?php echo display('item_name') ?> <i class="text-danger">*</i>
                                    </label>
                                    <div class="col-sm-6">
                                        <?php 
						if(empty($item)){$item = array('' => '--Select--');}
						echo form_dropdown('foodid',$item,(!empty($item->ProductsID)?$item->ProductsID:null),'class="form-control" id="foodid"') ?>
                                    </div>
                                </div> 
                            </div>
                             <div class="col-sm-6">
                               <div class="form-group row">
                                    <label for="supplier_sss" class="col-sm-2 col-form-label"><?php echo display('varient_name') ?> <i class="text-danger">*</i>
                                    </label>
                                    <div class="col-sm-6">
                                        <?php 
						if(empty($item)){$item = array('' => '--Select--');}
						echo form_dropdown('foodvarientid','','','class="form-control" id="foodvarientid"') ?>
                                    </div>
                                </div> 
                            </div>
                        </div>
                     <table class="table table-bordered table-hover" id="purchaseTable">
                                <thead>
                                     <tr>
                                            <th class="text-center" width="20%"><?php echo display('item_information') ?><i class="text-danger">*</i></th> 
                                            <th class="text-center"><?php echo display('qty') ?> <i class="text-danger">*</i></th>
                                            <th class="text-center"><?php echo display('price');?> </th>
                                            <th class="text-center"></th>
                                        </tr>
                                </thead>
                                <tbody id="addPurchaseItem">
                                    <tr>
                                        <td class="span3 supplier">
                                       
                                 <input type="hidden" id="unit-total_1" class="" />
                                        <select name="product_id[]" id="product_id_1" class="postform resizeselect form-control" onchange="product_list(1)">
                    					<option value="" data-title=""><?php echo display('select');?> <?php echo display('ingredients');?></option>
										<?php foreach ($ingrdientslist as $ingrdients) {?>
                    							<option value="<?php echo $ingrdients->id;?>" data-title="<?php echo $ingrdients->ingredient_name;?>"><?php echo $ingrdients->ingredient_name;?></option>
                    					<?php }?>
                  						</select>
                                        </td>
                                            <td class="text-right">
                                                <input type="text" name="product_quantity[]" id="cartoon_1" onkeyup='calprice(this)' class="form-control text-right store_cal_1" placeholder="0.00" value="" min="0" tabindex="6">
                                            </td>
                                             <td class="text-right">
                                                <input type="text"  id="price_1" class="form-control text-right store_cal_1" placeholder="0.00" value="" min="0" tabindex="6" readonly>
                                            </td>
                                            <td>
                                                <button  class="btn btn-danger red text-right" type="button" value="<?php echo display('delete') ?>" onclick="deleteRow(this)" tabindex="8"><?php echo display('delete') ?></button>
                                            </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <input type="button" id="add_invoice_item" class="btn btn-success" name="add-invoice-item" onclick="addmore('addPurchaseItem');" value="<?php echo display('add_more') ?> <?php echo display('item') ?>" tabindex="9">
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                     <div class="form-group row">
                            <div class="col-sm-6">
                                <input type="submit" id="add_purchase" class="btn btn-success btn-large" name="add-purchase" value="<?php echo display('submit') ?>">
                            </div>
                        </div>
                        </form>
                </div> 
            </div>
        </div>
    </div>
    <div id="cntra" hidden>
    <option value="" data-title=""><?php echo display('select');?> <?php echo display('ingredients');?></option>
<?php foreach ($ingrdientslist as $ingrdients) {?><option value="<?php echo $ingrdients->id;?>" data-title="<?php echo $ingrdients->ingredient_name;?>"><?php echo $ingrdients->ingredient_name;?></option><?php }?>
</div>
<script src="<?php echo base_url('application/modules/production/assets/js/production.js'); ?>" type="text/javascript"></script>
