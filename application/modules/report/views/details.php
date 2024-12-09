<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- Printable area start -->

<!-- Printable area end -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd">
	                <div id="printableArea">
	                    <div class="panel-body">
	                        <div class="table-responsive m-b-20">
	                            <table class="table table-fixed table-bordered table-hover bg-white" id="billorder">
                                <thead>
                                     <tr>
                                            <th class="text-center"><?php echo display('orderid')?> </th>
                                            <th class="text-right"><?php echo display('amount')?></th>
                                        </tr>
                                </thead>
                                <tbody>
                                <?php $total=0;
								if(!empty($billeport)){
									foreach($billeport as $bill){?>
									<tr>
                                    	<td><?php echo $bill->order_id;?></td>
                                        <td align="right"><?php echo $bill->bill_amount;?></td>
                                    </tr>
                                <?php $total=$total+$bill->bill_amount;
								} } ?>
                                </tbody>
                                <tfoot>
                                	<tr>
                                   		<td align="right" style="text-align:right;font-size:14px !Important">&nbsp; <b><?php echo display('total') ?> </b></td> 
                                    	<td style="text-align: right;"><b> <?php echo number_format($total,3);?></b></td>
                                    </tr>
                                </tfoot>
                            </table>
	                        </div>
	                    </div>
	                </div>

                     
                </div>
            </div>
        </div>



