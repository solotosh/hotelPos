// JavaScript Document
"use strict";
function editaddress(desc,sid){
	$("#descp").val(atob(desc));
	$("#btnchnage").show();
	$("#btnchnage").text("Update");
	$("#upbtn").show();
	$('#menuurl').attr('action', basicinfo.baseurl+"dashboard/web_setting/editaddress/"+sid);
	$(window).scrollTop(0);
	}
