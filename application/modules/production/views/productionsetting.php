
<div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel">
               
                <div class="panel-body">
                    <fieldset class="border p-2">
                       <legend  class="w-auto"><?php echo $title; ?></legend>
                    </fieldset>
					<div class="row bg-brown">
                             <div class="col-sm-12 kitchen-tab" id="option">
                             					<p  class="productionset_rightg">
                     <strong class="productionset_color"><?php echo display('production_note4') ?>***:</strong> <?php echo display('production_note1') ?> :<br />
<?php echo display('production_note1') ?>:
<?php echo display('production_note3') ?> <?php echo display('production_note5') ?> <?php echo display('production_note6') ?> 
                 </p>
                                                <input id="chkbox-1760" type="checkbox" class="individual" name="productionsetting" value="productionsetting" <?php if($possetting->productionsetting==1){ echo "checked";}?>>
                                                <label for="chkbox-1760" class="productionsets_color">
                                                    <span class="radio-shape">
                                                        <i class="fa fa-check"></i>
                                                    </span>
                                                   <?php echo display('select_auto') ?>
                                                </label>
                                               
                            </div>
                        </div>
                </div> 
            </div>
        </div>
    </div>

<script src="<?php echo base_url('application/modules/production/assets/js/production.js'); ?>" type="text/javascript"></script>