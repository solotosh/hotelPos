 
 "use strict"; 

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
	document.body.style.marginTop="0px";
    window.print();
    document.body.innerHTML = originalContents;
}

function getreportcash(){
	var from_date=$('#from_date').val();
	var to_date=$('#to_date').val();
	var user = $('#user').val();
	var counterno = $('#counterno').val();
	
	if(from_date!=''){
		 if(to_date==''){
			alert("Please select To date");
			return false;
		 }
		}
		if(to_date!=''){
			if(from_date==''){
				alert("Please select From date");
				return false;
			}
		}
	if(from_date=='' && to_date=='' && user=='' && counterno==''){
		alert("Please select at least one fields");
		return false;
		}
	var myurl =baseurl+'report/reports/getcashregister';
	var csrf = $('#csrfhashresarvation').val();
	    var dataString = "from_date="+from_date+'&to_date='+to_date+'&user='+user+'&counter='+counterno+"&csrf_test_name="+csrf;
		 $.ajax({
		 type: "POST",
		 url: myurl,
		 data: dataString,
		 success: function(data) {
			 $('#getresult2').html(data);
			$('#respritbl').DataTable({ 
        responsive: true, 
        paging: true,
        dom: 'Bfrtip', 
        "lengthMenu": [[ 25, 50, 100, 150, 200, 500, -1], [ 25, 50, 100, 150, 200, 500, "All"]], 
        buttons: [  
            {extend: 'copy', className: 'btn-sm',footer: true}, 
            {extend: 'csv', title: 'Report', className: 'btn-sm',footer: true}, 
            {extend: 'excel', title: 'Report', className: 'btn-sm', title: 'exportTitle',footer: true}, 
            {extend: 'pdf', title: 'Report', className: 'btn-sm',footer: true,customize: function (doc) {
    					doc.defaultStyle.alignment = 'center';
						doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');}}, 
            {extend: 'print', className: 'btn-sm',footer: true},
			{extend: 'colvis', className: 'btn-sm',footer: true}  
        ],
		"searching": true,
		  "processing": true,
		
    		}); 
		 } 
		});
		 } 
	function detailscash(startdate,enddate,uid){
      var myurl=baseurl+'report/reports/getcashregisterorder';
	  var csrf = $('#csrfhashresarvation').val();
		 var dataString = "startdate="+startdate+'&enddate='+enddate+'&uid='+uid+"&csrf_test_name="+csrf;
		  $.ajax({
		 	 type: "POST",
			 url: myurl,
			 data: dataString,
			 success: function(data) {
				 $('.orddetailspop').html(data);
				 $('#orderdetailsp').modal('show');
				 $('#billorder').DataTable({ 
        responsive: true, 
        paging: true,
		"language": {
			"sProcessing":     lang.Processingod,
			"sSearch":         lang.search,
			"sLengthMenu":     lang.sLengthMenu,
			"sInfo":           lang.sInfo,
			"sInfoEmpty":      lang.sInfoEmpty,
			"sInfoFiltered":   lang.sInfoFiltered,
			"sInfoPostFix":    "",
			"sLoadingRecords": lang.sLoadingRecords,
			"sZeroRecords":    lang.sZeroRecords,
			"sEmptyTable":     lang.sEmptyTable,
			"oPaginate": {
				"sFirst":      lang.sFirst,
				"sPrevious":   lang.sPrevious,
				"sNext":       lang.sNext,
				"sLast":       lang.sLast
			},
			"oAria": {
				"sSortAscending":  ":"+lang.sSortAscending+'"',
				"sSortDescending": ":"+lang.sSortDescending+'"'
			},
				"select": {
						"rows": {
							"_": lang._sign,
							"0": lang._0sign,
							"1": lang._1sign
						}  
		},
			buttons: {
					csv: lang.csv,
					excel: lang.excel,
					pdf: lang.pdf,
					print: lang.print
				}
		},
		"searching": false,
        dom: 'Bfrtip', 
        "lengthMenu": [[ 25, 50, 100, 150, 200, 500, -1], [ 25, 50, 100, 150, 200, 500, "All"]], 
        buttons: [  
            {extend: 'csv', title: 'Report', className: 'btn-sm',footer: true}, 
            {extend: 'excel', title: 'Report', className: 'btn-sm', title: 'exportTitle',footer: true}, 
            {extend: 'pdf', title: 'Report', className: 'btn-sm',footer: true,customize: function (doc) {
    					doc.defaultStyle.alignment = 'center';
						doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');}}
        ],
		  "processing": true,
    		});
			 } 
		});
     
 }
 function printscash(startdate,enddate,uid){
      var myurl=baseurl+'report/reports/printcashregister';
	  var csrf = $('#csrfhashresarvation').val();
		 var dataString = "startdate="+startdate+'&enddate='+enddate+'&uid='+uid+"&csrf_test_name="+csrf;
		  $.ajax({
		 	 type: "POST",
			 url: myurl,
			 data: dataString,
			 success: function(data) {
				 printregistersummery(data);
				 
			 } 
		});
     
 }
 function printregistersummery(view) {
  printJS({
	  printable: view,
	  type: 'raw-html'
  });
}
function downloadpdfcash(startdate,enddate,uid){
      var myurl=baseurl+'report/reports/downloadcashregister';
	  var csrf = $('#csrfhashresarvation').val();
		 var dataString = "startdate="+startdate+'&enddate='+enddate+'&uid='+uid+"&csrf_test_name="+csrf;
		  $.ajax({
		 	 type: "POST",
			 url: myurl,
			 data: dataString,
			 success: function(data) {
				 $("#pdfdownload").html(data);
				 ConvertHTMLToPDF();
				 $("#pdfdownload").hide();
				 
			 } 
		});
     
 }
 