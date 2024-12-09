<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route["default_controller"] = "hungry";
$route['login']  = "dashboard/auth/index";
$route['logout'] = "dashboard/auth/logout";
$route['home'] = "hungry";
$route['menu'] = "hungry/menu";
$route['menu/(:any)'] = "hungry/menu/$1";
$route['searchitem'] = "hungry/searchitem";
$route['details/(:any)/(:any)'] = "hungry/details/$1/$2";
$route['reservation'] = "hungry/reservation";
$route['cart'] = "hungry/cart";
$route['checkcoupon'] = "hungry/checkcoupon";
$route['checkout'] = "hungry/checkout";
$route['payments/(:any)'] = "hungry/payments/$1";
$route['payment-process'] = "hungry/payments_process";
$route['mylogin'] = "hungry/login";
$route['signup'] = "hungry/signup";
$route['orderdelevered/(:any)'] = "hungry/orderdelevered/$1";
$route['about'] = "hungry/about";
$route['contact'] = "hungry/contact";
$route['privacy'] = "hungry/privacy";
$route['terms'] = "hungry/terms";
$route['myprofile'] = "hungry/myprofile";
$route['myorderlist'] = "hungry/myorderlist";
$route['vieworder/(:any)'] = "hungry/vieworder/$1";
$route['myoreservationlist'] = "hungry/myoreservationlist";
$route['app-terms'] = "hungry/termsqr";
$route['app-refund-policty'] = "hungry/refundpolicyqr";
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['dashboard/home'] = 'dashboard/home';
$route['roombooking'] = 'roombooking/Room_booking';

$route['roombooking'] = 'roombooking/Room_booking/index';

$route['roombooking/Room_booking/add_room'] = 'roombooking/Room_booking/add_room';


$route['roombooking/add_room'] = 'roombooking/Room_booking/add_room';


$route['roombooking/roomtype'] = 'roombooking/roomtype/index';



$route['roombooking/RoomType/type_room_add'] = 'roombooking/RoomType/type_room_add';

$route['roombooking/edit_room/(:num)'] = 'Room_booking/edit_room/$1'; // To edit room
$route['roombooking/update_room'] = 'Room_booking/update_room'; // To update room

$route['roombooking/update_room'] = 'Room_booking/update_room';


$route['roombooking/edit_room/(:num)'] = 'roombooking/Room_booking/edit_room/$1';
$route['roombooking/delete_room/(:num)'] = 'roombooking/Room_booking/delete_room/$1';

$route['roombooking/Booking_List/index'] = 'Book_list/Booking_List/index';
$route['roombooking/edit_booking/(:num)'] = 'roombooking/edit_booking/$1';

$route['roombooking/add_booking'] = 'Book_list/Booking_List/add_booking';
$route['Book_list/RoomList/room'] = 'Book_list/RoomList/room';
$route['book-list'] = 'Book_list/Booking_List/index';

$route['Book_list/RoomList/room'] = 'Book_list/RoomList/room';// Route for room listing page
$route['roomlist'] = 'roomlist/roomlist'; 
$route['roomlist/roomlist'] = 'roomlist/roomlist';
$route['book_list/check-availability'] = 'Book_List/check_availability';
$route['test-route'] = 'Book_list/Booking_List/index';

$route['Book_list/more'] = 'Book_list/Booking_List/more';
$route['roomlist/edit_booking/(:num)'] = 'roomlist/RoomList/edit/$1';
$route['Booking_List/save_booking'] = 'Book_list/Booking_List/save_booking';
$route['checkout/checkout/(:num)'] = 'checkout/Roomcheck/checkout/$1';
$route['checkout/confirm_checkout/(:num)'] = 'checkout/roomcheck/confirm_checkout/$1';
$route['checkout/edit/(:num)'] = 'checkout/RoomCheck/edit/$1';
$route['checkout/viewcheck/(:num)'] = 'checkout/viewcheck/$1';

// View booking route
$route['checkout/view/(:num)'] = 'checkout/RoomCheck/view/$1';
$route['checkout/checkout/(:num)'] = 'checkout/RoomCheck/confirm_checkout/$1';



$route['checkout/view/(:num)'] = 'checkout/view/$1';

$route['book_list/Booking_List/save_booking'] = 'book_list/Booking_List/save_booking';






$route['404_override'] = 'errors/page_missing';

log_message('debug', 'Routes loaded: ' . json_encode($route));






//set modules/config/routes.php
// Inside your routes.php
$modules_path = APPPATH . 'modules/';
$modules = scandir($modules_path);

foreach ($modules as $module) {
    if ($module === '.' || $module === '..') continue;
    if (is_dir($modules_path . $module)) {
        $routes_path = $modules_path . $module . '/config/routes.php';
        if (file_exists($routes_path)) {
            echo "Loading routes for module: " . $module; // Debug line
            require($routes_path);
        }
    }
}
