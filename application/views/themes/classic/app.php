<?php 
$webinfo = $this->webinfo;
$activethemeinfo = $this->themeinfo;
$acthemename = $activethemeinfo->themename;

$openingtime = $this->settinginfo->opentime;
$closetime = $this->settinginfo->closetime;
if (strpos($openingtime, 'AM') !== false || strpos($openingtime, 'am') !== false) {
    $starttime = strtotime($openingtime);
} else {
    $starttime = strtotime($openingtime);
}
if (strpos($closetime, 'PM') !== false || strpos($closetime, 'pm') !== false) {
    $endtime = strtotime($closetime);
} else {
    $endtime = strtotime($closetime);
}
$comparetime = strtotime(date("h:i:s A"));
if (($comparetime >= $starttime) && ($comparetime < $endtime)) {
    $restaurantisopen = 1;
} else {
    $restaurantisopen = 0;
}

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
 
   <link href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/css/app.css" rel="stylesheet">
   <link href="<?php echo base_url(); ?>assets/sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
   <script src="<?php echo base_url(); ?>assets/sweetalert/sweetalert.min.js" type="text/javascript"></script>

</head>

<body>
    <div class="modal fade" id="closenotice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><?php echo display('restaurant_closed'); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><?php echo display('closed_msg'); ?> <?php echo $this->settinginfo->opentime; ?>- <?php echo $this->settinginfo->closetime; ?></p>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="addons" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-addons">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><?php echo display('food_details')?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body addonsinfo">
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
                        <div class="searchIcon mr-2">
                            <i class="fa fa-search" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                        echo $webinfo->qrheaderfontcolor;
                                                                    } ?>;"></i>
                        </div>
                        
                    </div>

                </nav>
                <div class="row search_filter">
                    <div class="col-12">
                        <div class="input-group search_box">
                            <input type="text" id="foodname" autocomplete="off" class="form-control" placeholder="<?php echo display('search_food_item')?>" onKeyUp="getfoodlist()">
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
                        <li><a href="<?php echo base_url() . 'app-terms'; ?>"><?php echo display('terms_condition') ?></a></li>
                        <li><a href="<?php echo base_url() . 'app-refund-policty'; ?>"><?php echo display('refundp') ?></a></li>
                        <?php
                        if ($this->session->userdata('CusUserID') != "") { ?>
                            <li><a href="<?php echo base_url() . 'apporedrlist'; ?>"><?php echo display('morderlist') ?></a></li>
                        <?php } ?>

                    </ul>
                </nav>
                <div class="row category_menu">
                    <div class="col-md-12"> <?php if ($this->session->flashdata('message')) { ?>
                            <div class="alert alert-success alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <?php echo $this->session->flashdata('message') ?>
                            </div>
                        <?php } ?>
                        <?php if ($this->session->flashdata('exception')) { ?>
                            <div class="alert alert-danger alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <?php echo $this->session->flashdata('exception') ?>
                            </div>
                        <?php } ?>
                        <?php if (validation_errors()) { ?>
                            <div class="alert alert-danger alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <?php echo validation_errors() ?>
                            </div>
                        <?php }
                        ?>
                        <div class="category_slider owl-carousel">
                            <?php $c = 0;
                            foreach ($categorylist as $category) {
                                $c++;
                                $pgetcat = str_replace(' ', '', $category->Name);
                                $phcategoryname = preg_replace("/[^a-zA-Z0-9\s]/", "", $pgetcat);
                            ?>
                                <div class="item">
                                    <div class="img_area">
                                        <a href="#<?php echo $phcategoryname . $c; ?>" class="goto">
                                            <img src="<?php echo base_url(!empty($category->CategoryImage) ? $category->CategoryImage : 'assets/img/icons/default.jpg'); ?>" alt="#" height="62">
                                        </a>
                                    </div>
                                    <h6 class="category_name" style="color:<?php if (!empty($webinfo->qrheaderfontcolor)) {
                                                                                echo $webinfo->qrheaderfontcolor;
                                                                            } ?>;"><?php echo $category->Name; ?></h6>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="overlay"></div>
            </div>
        </div>

    </header>
    <!--END HEADER TOP-->
    <div id="searchqritem">
        <?php $op = 0;
        foreach ($categorylist as $category) {
            $op++;
            $getcat = str_replace(' ', '', $category->Name);
            $hcategoryname = preg_replace("/[^a-zA-Z0-9\s]/", "", $getcat);
        ?>
            <div class="product_sec sec_mar only-sm" id="<?php echo $hcategoryname . $op; ?>">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <h5 class="sm_heading"><?php echo $category->Name; ?></h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <?php $allcat = "";
                            foreach ($category->sub as $subcat) {
                                $allcat .= $subcat->CategoryID . ",";
                            }
                            $mainwithsub = $allcat . $category->CategoryID;
                            $condition = "item_foods.CategoryID IN($mainwithsub)";
                            $itemlist = $this->hungry_model->qrmenue($condition);
                            $k = 0;
                            foreach ($itemlist as $item) {
                                $k++;
                                $this->db->select('*');
                                $this->db->from('menu_add_on');
                                $this->db->where('menu_id', $item->ProductsID);
                                $query = $this->db->get();
                                $getadons = "";
                                if ($query->num_rows() > 0) {
                                    $getadons = 1;
                                } else {
                                    $getadons =  0;
                                }
                            ?>
                                <div class="product product--card d-flex align-items-center">
                                    <div class="product__thumbnail">
                                        <img src="<?php echo base_url(!empty($item->medium_thumb) ? $item->medium_thumb : 'assets/img/no-image.png'); ?>" class="hoverImg" alt="Product Image">
                                    </div>

                                    <div class="product_info">

                                        <div class="product-desc">
                                            <a href="<?php echo base_url() . 'app-details/' . $item->ProductsID . '/' . $item->variantid; ?>" class="menu_title"><?php echo $item->ProductName ?></a>
                                            <p><?php echo substr($item->descrip, 0, 60); ?></p>
                                        </div>

                                        <div class="price_area">
                                            <div class="d-flex align-items-center">
                                                <p class="price"><?php echo $item->price; ?></p>
                                                <a href="#" class="variant_btn"><?php echo $item->variantName; ?></a>
                                            </div>
                                            <?php if ($restaurantisopen == 1) {
                                                if ($getadons == 1) { ?>
                                                    <input name="sizeid" type="hidden" id="sizeid_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->variantid; ?>" />
                                                    <input type="hidden" name="catid" id="catid_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->CategoryID; ?>">
                                                    <input type="hidden" name="itemname" id="itemname_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->ProductName; ?>">
                                                    <input type="hidden" name="varient" id="varient_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->variantName; ?>">
                                                    <input type="hidden" name="cartpage" id="cartpage_<?php echo $item->CategoryID . $k; ?>" value="1">
                                                    <input name="itemprice" type="hidden" value="<?php echo $item->price; ?>" id="itemprice_<?php echo $item->CategoryID . $k; ?>" />

                                                    <?php $myid2 = $item->CategoryID . $item->ProductsID . $item->variantid;
                                                    if (count($this->cart->contents()) > 0) {
                                                        $allid2 = "";
                                                        foreach ($this->cart->contents() as $cartitem) {
                                                            if ($cartitem['id'] == $myid2) {
                                                                $allid2 .= $myid2 . ","; ?>
                                                                <button class="simple_btn d-none" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="addonsitemqr('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                                    <span><?php echo display('add') ?></span>
                                                                </button>
                                                                <div class="cart_counter active" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                                    <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                    <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="<?php echo $cartitem['qty']; ?>" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                                    <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            <?php }
                                                        }
                                                        $str2 = implode(',', array_unique(explode(',', $allid2)));
                                                        $myvalue2 = trim($str2, ',');
                                                        if ($myid2 != $myvalue2) { ?>
                                                            <button class="simple_btn" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="addonsitemqr('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                                <span><?php echo display('add') ?></span>
                                                            </button>
                                                            <div class="cart_counter hidden_cart" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                                <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                                <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="<?php echo $cartitem['qty']; ?>" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                                <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        <?php }
                                                    } else {
                                                        ?>
                                                        <button class="simple_btn" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="addonsitemqr('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                            <span><?php echo display('add') ?></span>
                                                        </button>
                                                        <div class="cart_counter hidden_cart" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                            <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="1" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                            <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    <?php }
                                                } else {
                                                    ?>
                                                    <input name="sizeid" type="hidden" id="sizeid_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->variantid; ?>" />
                                                    <input type="hidden" name="catid" id="catid_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->CategoryID; ?>">
                                                    <input type="hidden" name="itemname" id="itemname_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->ProductName; ?>">
                                                    <input type="hidden" name="varient" id="varient_<?php echo $item->CategoryID . $k; ?>" value="<?php echo $item->variantName; ?>">
                                                    <input type="hidden" name="cartpage" id="cartpage_<?php echo $item->CategoryID . $k; ?>" value="1">
                                                    <input name="itemprice" type="hidden" value="<?php echo $item->price; ?>" id="itemprice_<?php echo $item->CategoryID . $k; ?>" />
                                                    <?php $myid = $item->CategoryID . $item->ProductsID . $item->variantid;
                                                    if (count($this->cart->contents()) > 0) {
                                                       						
                                                        $allid = "";
                                                        foreach ($this->cart->contents() as $cartitem) {
                                                          								
                                                            if ($cartitem['id'] == $myid) {
                                                                $allid .= $myid . ","; 
                                                    ?>
                                                                <button class="simple_btn d-none" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="appcart('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                                    <span><?php echo display('add') ?></span>
                                                                </button>
                                                                <div class="cart_counter active" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                                    <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                    <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="<?php echo $cartitem['qty']; ?>" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                                    <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            <?php } else if ($cartitem['id'] != $myid) {
                                                            } ?>

                                                        <?php  }
                                                        $str = implode(',', array_unique(explode(',', $allid)));
                                                        $myvalue = trim($str, ',');
                                                        if ($myid != $myvalue) { ?>
                                                            <button class="simple_btn" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="appcart('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                                <span><?php echo display('add') ?></span>
                                                            </button>
                                                            <div class="cart_counter hidden_cart" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                                <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                                <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="1" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                                <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        <?php }
                                                    } else {
                                                       
                                                        ?>
                                                        <button class="simple_btn" id="backadd<?php echo $item->CategoryID . $k; ?>" onClick="appcart('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)">
                                                            <span><?php echo display('add') ?></span>
                                                        </button>
                                                        <div class="cart_counter hidden_cart" id="removeqtyb<?php echo $item->CategoryID . $k; ?>">
                                                            <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemreduce('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="reduced items-count" type="button">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <input type="text" name="qty" id="sst<?php echo $item->CategoryID . $k; ?>" maxlength="12" value="1" title="Quantity:" class="input-text qty" onchange="changeqty('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" readonly>
                                                            <button id="<?php echo $item->CategoryID . $k; ?>" onclick="itemincrese('<?php echo $item->ProductsID; ?>','<?php echo $item->variantid; ?>',<?php echo $item->CategoryID . $k; ?>)" class="increase items-count" type="button">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                <?php }
                                                }
                                            } else { ?>
                                                <a class="simple_btn" data-toggle="modal" data-target="#closenotice" data-dismiss="modal"> <span><?php echo display('add') ?></span></a>
                                            <?php } ?>
                                        </div>

                                    </div>
                                </div>

                            <?php } ?>

                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
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
    <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-messaging.js"></script>
    <link rel="manifest" href="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/manifest.json">
     <!-- get js from here  -->
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
   <!-- get js from here  -->
   <script src="<?php echo base_url(); ?>application/views/themes/<?php echo $acthemename; ?>/assets_web/js/qrapp_main.js"></script>
   
</body>

</html>