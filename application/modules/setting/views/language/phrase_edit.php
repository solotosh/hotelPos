<div id="add0" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content customer-list">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <strong><?php echo display('bulk_upload');?></strong>
            </div>
            <div class="modal-body">
           <div class="container">    
             <br>
             
             <?php if (isset($error)): ?>
                <div class="alert alert-error"><?php echo $error; ?></div>
            <?php endif; ?>
            <?php if ($this->session->flashdata('success') == TRUE): ?>
                <div class="form-control alert alert-success"><?php echo $this->session->flashdata('success'); ?></div>
            <?php endif; ?>
            <h3>You can export test.csv file Example-<a  class="btn btn-primary btn-md" href="<?php echo base_url() ?>setting/language/downloadformatsingle/<?php echo $language;?>"><i class="fa fa-download" aria-hidden="true"></i>Download CSV Format</a></h3>
            <h4>phase,English,Spanish</h4>
            <h4>ad,Add,Agregar</h4>
            <h2><?php echo display('bulk_upload')?></h2>               
                       <?php echo form_open_multipart('setting/language/bulklanuploadsingle/'.$language,array('class' => 'form-vertical', 'id' => 'validate','name' => 'insert_attendance'))?>
                    <input type="file" name="userfile" id="userfile" ><br><br>
                    <input type="submit" name="submit" value="UPLOAD" class="btn btn-primary">
       <?php echo form_close()?>
           
        
            
        </div>     

    </div>

</div>
</div>

    </div>
<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd ">
            <div class="panel-heading">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("setting/language/phrase") ?>"> <i class="fa fa-plus"></i> <?php echo display('add_phrase')?></a>
                    <a class="btn btn-primary" href="<?php echo base_url("setting/language") ?>"> <i class="fa fa-list"></i>  <?php echo display('language') ?> List </a> 
                </div> 
                <div class="btn-group pull-right"> 
                            <?php if($this->permission->method('setting','update')->access()): ?>
<a data-target="#add0" data-toggle="modal" class="btn btn-primary btn-md"><i class="fa fa-plus-circle" aria-hidden="true"></i>
<?php echo display('bulk_upload')?></a> 
<?php endif; ?>
                    </div>
            </div>

            <div class="panel-body">
                <?php echo  form_open('setting/language/addlebel') ?>
                <table class="table table-striped" id="langtab">
                    <thead> 
                        <tr>
                            <td colspan="2"> 
                                <button type="reset" class="btn btn-danger"><?php echo display('reset') ?></button>
                                <button type="submit" class="btn btn-success"><?php echo display('save') ?></button>
                            </td>
                            <td><?php  ?></td>
                        </tr>
                        <tr>
                            <th class="phrase-edit-list"><i class="fa fa-th-list"></i></th>
                            <th class="phrase-edit-phrase">Phrase</th>
                            <th class="phrase-edit-label">Label</th> 
                        </tr>
                    </thead>
                    <?php echo  form_hidden('language', $language) ?>
                    <tbody>
                        
                            
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2"> 
                                <button type="reset" class="btn btn-danger"><?php echo display('reset') ?></button>
                                <button type="submit" class="btn btn-success"><?php echo display('save') ?></button>
                            </td>
                            <td><?php  ?></td>
                        </tr>
                    </tfoot>
                    <?php echo  form_close() ?>
                </table>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>