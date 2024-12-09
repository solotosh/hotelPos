<div id="edit" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <strong><?php echo display('Reservation');?></strong>
            </div>
            <div class="modal-body editinfo">
            
    		</div>
     
            </div>
            <div class="modal-footer">

            </div>

        </div>

    </div>
<div class="row">
    <!--  table area -->
    <div class="col-sm-12">

        <div class="panel panel-default thumbnail"> 

            <div class="panel-body">
            <div class="table_content table_contentpost" >
              <div class="table_content_booking"> <span class="table_booking_header"><?php echo display('bookatable');?></span>
                <div class="table_booking">
                  <div class="table_tables">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="date"><?php echo display('date');?></label>
                                <div class="input__holder3">
                                  <input id="date" name="date" type="text" class="form-control datepicker" placeholder="<?php echo display('date');?>" readonly="readonly">
                                </div>
                            </div>
                         </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="time"><?php echo display('seat_time');?></label>
                                <div class="input__holder3">
                                  <input id="time" name="time" type="text" class="form-control timepicker" placeholder="<?php echo display('seat_time');?>" readonly="readonly">
                                </div>
                            </div>
                         </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="people"><?php echo display('no_of_people');?></label>
                                <div class="input__holder3">
                                  <input id="people" name="people" type="text" class="form-control" placeholder="<?php echo display('no_of_people');?>">
                                </div>
                            </div>
                         </div>
                      
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="date">&nbsp;</label>
                                <div class="input__holder3">
                                 <input name="checkurl" id="checkurl" type="hidden" value="<?php echo base_url("reservation/reservation/checkavailablity") ?>" /> 
                                  <input type="button" class="btn btn-success" onclick="checkavail()" value="<?php echo display('check_availablity')?>">
                                </div>
                            </div>
                         </div>
                         </div>
                    <div class="row" id="availabletable">
                    
                        
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
        </div>
    </div>
</div>

     
