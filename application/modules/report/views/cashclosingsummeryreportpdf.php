
<?php 
$startDate = date("d/m/Y", strtotime($registerinfo->opendate));
$closeDate = date("d/m/Y", strtotime($registerinfo->closedate));
$totalsales=$billinfo->nitamount+$billinfo->VAT+$billinfo->service_charge;
?>
    <div style="" id="pdfprnt">
        <table align="center" style="width:270px; padding:0 5px;">
            <thead>
                <tr>
                    <th colspan="2" style="font-size: 21px; color: #000; padding-bottom: 5px; text-align: center; "><?php echo display('day_close_report');?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left;"><?php echo display('open_date');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo $startDate;?></td>
                </tr>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left;"><?php echo display('close_date');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo $closeDate;?></td>
                </tr>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left;"><?php echo display('counter_no');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo $registerinfo->counter_no;?></td>
                </tr>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo display('user');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo $this->session->userdata('fullname');?></td>
                </tr>
            </tbody>
        </table>

        <table align="center" style="width:270px; padding:0 5px;">
            <thead>
                <tr>
                    <th colspan="2" style="font-size: 21px; color: #000; padding-bottom: 5px; text-align: center;"><?php echo display('sales_summary');?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left; border-top: 1px solid #000; border-top-style: dashed;"><?php echo display('total_net_sales');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-top: 1px solid #000; border-top-style: dashed;"><?php echo number_format($billinfo->nitamount,2);?></td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left;"><?php echo display('total_tax');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo number_format($billinfo->VAT,2);?></td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo display('total_sd');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo number_format($billinfo->service_charge,2);?></td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left;"><?php echo display('total_sale');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo number_format($totalsales,2);?></td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left;"><?php echo display('total_discount');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo number_format($billinfo->discount,2);?></td>
                </tr>
            </tbody>
        </table>
		
        <table align="center" style="width:270px; padding:0 5px;">
            <thead>
                <tr>
                    <th colspan="2" style="font-size: 21px; color: #000; padding-bottom: 5px; text-align: center; "><?php echo display('payment_details');?></th>
                </tr>
            </thead>
            <tbody>
            <?php  
			$tototalsum= array_sum(array_column($totalamount, 'totalamount'));
			$changeamount=$tototalsum-$totalchange->totalexchange;
			$total=0;
			foreach ($totalamount as $amount) {
				if($amount->payment_type_id==4){
					$payamount=$amount->totalamount-$changeamount;
				}else{
					$payamount=$amount->totalamount;
				}
				$total=$total+$payamount;
				 ?>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left; border-top: 1px solid #000; border-top-style: dashed;"><?php echo $amount->payment_method; ?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-top: 1px solid #000; border-top-style: dashed;"><?php echo number_format($payamount,3); ?></td>
                </tr>
                <?php } ?>
                <tr>
                    <td colspan="3" style="font-size: 17px; color: #000; text-align: left; border-bottom: 1px solid #000; border-bottom-style: dashed;">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left;"><?php echo display('totalpayment');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right;"><?php echo number_format($total,3); ?></td>
                </tr>
            </tbody>
        </table>
        <table align="center" style="width:270px; padding:0 5px; margin-bottom: 60px;">
            <thead>
                <tr>
                    <th colspan="3" style="font-size: 21px; color: #000; padding-bottom: 5px; text-align: center;"><?php echo display('cashdrawer');?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left; border-top: 1px solid #000; border-top-style: dashed;"><?php echo display('day_opening');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-top: 1px solid #000; border-top-style: dashed;"><?php echo number_format($registerinfo->opening_balance,3); ?></td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: 17px; color: #000; text-align: left; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo display('dayclosing');?> :</td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-bottom: 1px solid #000; border-bottom-style: dashed;"><?php echo number_format($registerinfo->closing_balance,3); ?></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size: 17px; color: #000;">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size: 17px; color: #000; text-align: left;">Print Date :<?php echo date('Y-m-d H:i'); ?></td>
                </tr>
            </tbody>
        </table>

        <table align="center" style="width:270px; padding:0 5px;">
            <tbody>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left;"></td>
                    <td style="font-size: 17px; color: #000; text-align: right;"></td>
                </tr>
                <tr>
                    <td style="font-size: 17px; color: #000; text-align: left; border-top: 1px solid #000;"><?php echo display('counterusersignature');?></td>
                    <td style="font-size: 17px; color: #000; text-align: right; border-top: 1px solid #000;"><?php echo display('authorize_signature');?></td>
                </tr>
            </tbody>
        </table>
    </div>
<script>
function ConvertHTMLToPDF() {
  var elementHTML = document.getElementById('pdfprnt');
 
  html2canvas(elementHTML, {
    useCORS: true,
    onrendered: function(canvas) {
      var pdf = new jsPDF('p', 'pt', 'letter');

      var pageHeight = 980;
      var pageWidth = 900;
      for (var i = 0; i <= elementHTML.clientHeight / pageHeight; i++) {
        var srcImg = canvas;
        var sX = 0;
        var sY = pageHeight * i; // start 1 pageHeight down for every new page
        var sWidth = pageWidth;
        var sHeight = pageHeight;
        var dX = 0;
        var dY = 0;
        var dWidth = pageWidth;
        var dHeight = pageHeight;

        window.onePageCanvas = document.createElement("canvas");
        onePageCanvas.setAttribute('width', pageWidth);
        onePageCanvas.setAttribute('height', pageHeight);
        var ctx = onePageCanvas.getContext('2d');
        ctx.drawImage(srcImg, sX, sY, sWidth, sHeight, dX, dY, dWidth, dHeight);

        var canvasDataURL = onePageCanvas.toDataURL("image/png", 1.0);
        var width = onePageCanvas.width;
        var height = onePageCanvas.clientHeight;

        if (i > 0) // if we're on anything other than the first page, add another page
          pdf.addPage(612, 864); // 8.5" x 12" in pts (inches*72)

        pdf.setPage(i + 1); // now we declare that we're working on that page
        pdf.addImage(canvasDataURL, 'PNG', 20, 40, (width * .62), (height * .62)); // add content to the page
      }
			
	  // Save the PDF
      pdf.save('cashregister.pdf');
    }
  });
}
</script>