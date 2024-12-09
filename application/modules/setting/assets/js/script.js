"use strict"; 
function editinfo(id){
	   var geturl=$("#url_"+id).val();
	   var myurl =geturl+'/'+id;
	   var csrf = $('#csrfhashresarvation').val();
	    var dataString = "id="+id+"&csrf_test_name="+csrf;

		 $.ajax({
		 type: "GET",
		 url: myurl,
		 data: dataString,
		 success: function(data) {
			 $('.editinfo').html(data);
			 $('#edit').modal('show');
			  $(".datepicker").datepicker({
				dateFormat: "dd-mm-yy"
			}); 
		 } 
	});
	}
	

function editinfoshiping(id){
	   var geturl=$("#url_"+id).val();
	   var myurl =geturl+'/'+id;
	   var csrf = $('#csrfhashresarvation').val();
	    var dataString = "id="+id+"&csrf_test_name="+csrf;

		 $.ajax({
		 type: "GET",
		 url: myurl,
		 data: dataString,
		 success: function(data) {
			 $('.editinfo').html(data);
			 $('#edit').modal('show');
			  $(".datepicker").datepicker({
				dateFormat: "dd-mm-yy"
			}); 
				 $("select.form-control:not(.dont-select-me)").select2({
					placeholder: lang.sl_option,
					allowClear: true
				});
		 } 
	});
	}
