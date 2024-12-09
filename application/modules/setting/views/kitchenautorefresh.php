<div class="row">
    <!--  table area -->
    <div class="col-sm-12">

        <div class="panel panel-default thumbnail"> 

            <div class="panel-body">
                <?php echo form_open_multipart('setting/kitchensetting/timeupdate','class="form-inner"') ?>
                    <?php echo form_hidden('id',$setting->id) ?>

                    <div class="form-group row">
                        <label for="title" class="col-xs-3 col-form-label"><?php echo display('kot_reftime') ?> <i class="text-danger">*</i></label>
                        <div class="col-xs-2">
                            <input name="reftime" type="number" class="form-control" id="reftime" placeholder="<?php echo display('kot_reftime') ?>" value="<?php echo $setting->kitchenrefreshtime ?>">
                        </div>
                        <div class="col-xs-2"><button type="submit" class="btn btn-success w-md m-b-5"><?php echo display('save') ?></button></div>
                    </div>
                    
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>

     
