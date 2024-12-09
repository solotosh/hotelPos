<?php $webinfo = $this->webinfo;
$storeinfo = $this->settinginfo;
$currency = $this->storecurrency;
$activethemeinfo = $this->themeinfo;
$acthemename = $activethemeinfo->themename;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?php echo $seoinfo->description; ?>">
    <meta name="keywords" content="<?php echo $seoinfo->keywords; ?>">

    <title><?php echo $title; ?></title>
    <link rel="shortcut icon" type="image/ico" href="<?php echo base_url((!empty($this->settinginfo->favicon) ? $this->settinginfo->favicon : 'application/views/themes/' . $acthemename . '/assets_web/images/favicon.png')) ?>">
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/jquery-3.3.1.min.js"></script>

    <!--====== Plugins CSS Files =======-->
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/themify-icons/themify-icons.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/animate-css/animate.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/metismenu/metisMenu.min.css" rel="stylesheet">

    <!--====== Custom CSS Files ======-->
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/new.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/responsive.css" rel="stylesheet">

    <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/apporderlist.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>assets/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
   <script src="<?php echo base_url(); ?>assets/sweetalert/sweetalert.min.js" type="text/javascript"></script>

 
</head>

<body>
    <div class="modal fade" id="vieworder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-addons">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><?php echo display('foodde') ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body popview">
                </div>

            </div>
        </div>
    </div>
    <!-- Preloader -->
    <div class="preloader"></div>

    <!--START HEADER TOP-->
    <header class="header_top_area only-sm">

        <div class="header_top light" style="background:<?php if (!empty($webinfo->backgroundcolorqr)) {
                                                            echo $webinfo->backgroundcolorqr;
                                                        } ?>;">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg">
                    <div class="sidebar-toggle-btn">
                        
                    </div>
                    <a class="" href="<?php echo base_url(); ?>qr-menu">
                        <img src="<?php echo base_url(!empty($webinfo->logo) ? $webinfo->logo : 'dummyimage/168x65.jpg'); ?>" alt="">
                    </a>
                    <div class="act-icon">
                       
                    </div>
                </nav>
                <nav id="sidebar" class="sidebar-nav">
                    <div id="dismiss">
                        <i class="ti-close"></i>
                    </div>
                    <ul class="metismenu list-unstyled" id="mobile-menu">
                        <li><a href="<?php echo base_url() . 'app-terms'; ?>"><?php echo display('terms_condition') ?></a></li>
                        <li><a href="<?php echo base_url() . 'app-refund-policty'; ?>"><?php echo display('refundp') ?></a></li>
                        <?php
                        if ($this->session->userdata('CusUserID') != "") { ?>
                            <li><a href="<?php echo base_url() . 'apporedrlist'; ?>"><?php echo display('morderlist') ?></a></li>
                        <?php } ?>
                    </ul>
                </nav>
                <div class="overlay"></div>
            </div>
        </div>

    </header>
    <!--END HEADER TOP-->

    <div class="product_sec sec_mar only-sm">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <center class="apporder_list_center"><?php echo display('morderlist') ?></center>
                    <table class="table datatable2 table-fixed table-bordered table-hover bg-white table-responsive text-nowrap" id="purchaseTable">
                        <thead>
                            <tr>
                                <th class="text-center"><?php echo display('status') ?></th>
                                <th class="text-right"><?php echo display('amount') ?></th>
                                <th class="text-center"><?php echo display('action') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i = 0;
                            $today = date('Y-m-d');
                            foreach ($iteminfo as $item) {
                                $i++;
                            ?>
                                <tr>

                                    <td class="text-center">
                                        <?php if ($item->order_status == 1) {
                                            echo display('pending_ord');
                                        }
                                        if ($item->order_status == 2) {
                                            echo display('Processingod');
                                        }
                                        if ($item->order_status == 3) {
                                            echo display('ready');
                                        }
                                        if ($item->order_status == 4 && $item->orderacceptreject != 1) {
                                            echo display('pending_ord');
                                        }
                                        if ($item->order_status == 4 && $item->orderacceptreject == 1) {
                                            echo display('served');
                                        }
                                   
                                        if ($item->order_status == 5) {
                                            echo display('cancel');
                                        }
                                        ?>
                                    </td>
                                    <td class="text-right"><?php if ($currency->position == 1) {
                                                                echo $currency->curr_icon;
                                                            } ?> <?php echo $item->totalamount; ?> <?php if ($currency->position == 2) {
                                                                                                        echo $currency->curr_icon;
                                                                                                    } ?> </td>
                                    <td class="text-center">
                                        <a onclick="vieworderinfo(<?php echo $item->order_id; ?>)" class="btn btn-xs btn-success apporedrlist_fff" data-toggle="modal" data-target="#vieworder" data-dismiss="modal"><?php echo display('view') ?></a>
                                        <?php if (($item->order_status == 1 || $item->order_status == 2 || $item->order_status == 3 || $item->cutomertype == 99) && ($item->order_date == $today) && ($item->order_status != 4) && ($item->order_status != 5)) { ?>
                                            <a href="<?php echo base_url(); ?>updatemyorder/<?php echo $item->order_id; ?>" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="left"><?php echo display('edit') ?></a>
                                        <?php } ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                        <tfoot>

                        </tfoot>
                    </table>

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


    <!--====== SCRIPTS JS ======-->
    <script src="<?php echo base_url('/ordermanage/order/showljslang') ?>" type="text/javascript"></script>
	<script src="<?php echo base_url('/ordermanage/order/basicjs') ?>" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/metismenu/metisMenu.min.js"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/wow/wow.min.js"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/plugins/clockpicker/clockpicker.min.js"></script>
    <!--===== ACTIVE JS=====-->
    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/custom.js"></script>

    <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/qrappdetails.js"></script>
</body>

</html>