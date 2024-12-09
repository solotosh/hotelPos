   <?php $webinfo= $this->webinfo;
$storeinfo=$this->settinginfo;
 $currency=$this->storecurrency;
 $activethemeinfo=$this->themeinfo;
$acthemename=$activethemeinfo->themename;
?> 
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Green Chilli is a simple Restaurent and Cafe website">

    <title><?php echo $title;?></title>
	<link rel="shortcut icon" type="image/ico" href="<?php echo base_url((!empty($this->settinginfo->favicon)?$this->settinginfo->favicon:'application/views/themes/'.$acthemename.'/assets_web/images/favicon.png')) ?>">
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/jquery-3.3.1.min.js"></script>
    <!--====== Plugins CSS Files =======-->
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/themify-icons/themify-icons.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/animate-css/animate.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/metismenu/metisMenu.min.css" rel="stylesheet">

    <!--====== Custom CSS Files ======-->
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/new.css" rel="stylesheet">
    <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/responsive.css" rel="stylesheet">

    
   <link href="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/returnpolicyqr.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
   <script src="<?php echo base_url(); ?>assets/sweetalert/sweetalert.min.js" type="text/javascript"></script>
</head>

<body>

                
    <!-- Preloader -->
    <div class="preloader"></div>

    <!--START HEADER TOP-->
    <header class="header_top_area only-sm" >

        <div class="header_top light" style="background:<?php if(!empty($webinfo->backgroundcolorqr)){ echo $webinfo->backgroundcolorqr;}?>;">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg">
                    <div class="sidebar-toggle-btn">
                        
                    </div>
                    <a class="" href="<?php echo base_url();?>qr-menu">
                        <img src="<?php echo base_url(!empty($webinfo->logo)?$webinfo->logo:'dummyimage/168x65.jpg'); ?>" alt="">
                    </a>
                    <div class="act-icon">                        
                        <div class="searchIcon mr-2">
                            <i class="fa fa-search" style="color:<?php if(!empty($webinfo->qrheaderfontcolor)){ echo $webinfo->qrheaderfontcolor;}?>;"></i>
                        </div>
                        
                    </div>
                    
                </nav>
                <div class="row search_filter">
                    <div class="col-12">
                        <div class="input-group search_box">
                            <input type="text" id="foodname" autocomplete="off" class="form-control" placeholder="Search for food ..." onKeyUp="getfoodlist()">
                            <div class="input-group-append">
                                
                                <button class="btn btn-search close-icon" type="button">
                                    <i class="ti-close"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <nav id="sidebar" class="sidebar-nav">
                    <div id="dismiss">
                        <i class="ti-close"></i>
                    </div>
                    <ul class="metismenu list-unstyled" id="mobile-menu">
                    	<li><a href="<?php echo base_url().'app-terms';?>"><?php echo display('terms_condition') ?></a></li>
                        <li><a href="<?php echo base_url().'app-refund-policty';?>"><?php echo display('refundp') ?></a></li>
                        <?php
                        if($this->session->userdata('CusUserID')!=""){?>
                          <li><a href="<?php echo base_url().'apporedrlist';?>"><?php echo display('morderlist') ?></a></li>  
                        <?php } ?>
                        
                       </ul>
                </nav>
                
                <div class="overlay"></div>
            </div>
        </div>

    </header>
    <!--END HEADER TOP-->
     <?php $refundpolicies=$this->db->select('*')->from('tbl_widget')->where('widgetid',24)->get()->row();?>
    <div class="product_sec sec_mar only-sm">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <h5 class="sm_heading"><?php echo $refundpolicies->widget_title?></h5>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product product--card d-flex align-items-center">
                        <div class="product_info">
                            <div class="product-desc">
                                <p><?php echo $refundpolicies->widget_desc;?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<?php $totalqty = 0;
          $totalamount = 0;
          if ($this->cart->contents() > 0) {
          	$totalqty = count($this->cart->contents());
          } ?>
<div class="fixed_area only-sm">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="d-flex align-items-center justify-content-between">
                      	<div class="icon">
                      		<a class="btn btn-transparent" href="<?php echo base_url(); ?>qr-menu">
                      			<i class="ti-home" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                echo $webinfo->qrheaderfontcolor;
                                                            } ?>;"></i>
                      		</a>                      			
                      	</div>
                      	<div class="icon">
                        <input name="cqty" type="hidden" value="<?php echo $totalqty;?>" id="cartitemandprice">
                        <input name="isloginuser" id="isloginuser" type="hidden" value="<?php echo $this->session->userdata('CusUserID');?>">
                      		<button class="btn btn-transparent" onClick="orderlist()">
                      			<i class="ti-pencil-alt" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                echo $webinfo->qrheaderfontcolor;
                                                            } ?>;"></i>
                      		</button>   
                      	</div>
                      	<div class="icon">
                      		<button class="btn btn-transparent btnposition" onClick="gotoappcart()">
                      			<i class="ti-shopping-cart" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                echo $webinfo->qrheaderfontcolor;
                                                            } ?>;"></i><span id="badgeshow" class="<?php if($totalqty>0){ echo "badgedisplayblock";}else{ echo "badgedisplaynone";}?> classic-badge2"><?php echo $totalqty;?></span>
                      		</button>   
                      	</div>
                        <div class="sidebar-toggle-btn icon">
                        <button type="button" id="sidebarCollapse" class="btn btn-transparent">
                            <i class="ti-menu" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                echo $webinfo->qrheaderfontcolor;
                                                            } ?>;"></i>
                        </button>
                      		 
                      	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <script src="<?php echo base_url('/ordermanage/order/showljslang') ?>" type="text/javascript"></script>
	<script src="<?php echo base_url('/ordermanage/order/basicjs') ?>" type="text/javascript"></script> 
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/metismenu/metisMenu.min.js"></script>
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/wow/wow.min.js"></script>
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/clockpicker/clockpicker.min.js"></script>
    <!--===== ACTIVE JS=====-->
    <script src="<?php echo base_url();?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/custom.js"></script>

   <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/returnpolicyqr.js"></script>
</body>

</html>
