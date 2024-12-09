// JavaScript Document
"use strict";
function edittype(dayname,opent,closet,optime){
	$("#btnchnage").show();
	$("#dayname").select2().val(dayname).trigger('change');
	$("#opentime").val(opent);
	$("#closetime").val(closet);
	$("#btnchnage").text("Update");
	$('#typeurl').attr('action', basicinfo.baseurl+"dashboard/web_setting/editstoretime/"+optime);
	}
