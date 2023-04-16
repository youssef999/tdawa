

class API {

  static const hostConnection = //'https://tadawiapp.com/tdawa';
      'http://192.168.1.13/tdawa';
      //'http://192.168.1.5/tdawa';
     // 'http://192.168.1.13/tdawa';
      //'http://192.168.1.13/tdawa';
  static const hostConnectionUser = '$hostConnection/user';
  static const validateEmail = '$hostConnection/user/validate_email.php';
  static const signup = '$hostConnection/doctor/signup.php';
  static const SalesCoins = '$hostConnection/doctor/sales_coins.php';
  static const AddFilters = '$hostConnection/doctor/add_filter.php';
  static const login = '$hostConnection/doctor/login.php';
  static const DoctorPhoneLogin = '$hostConnection/doctor/doctor_login_phone.php';
  static const UserPhoneLogin = '$hostConnection/doctor/user_login_phone.php';
  static const SalesLogin = '$hostConnection/doctor/sales.php';
  static const SalesData = '$hostConnection/doctor/get_sales_data.php';
  static const ModLogin = '$hostConnection/doctor/mod_login.php';
  static const getMod = '$hostConnection/doctor/All_moderators.php';
  static const addMod = '$hostConnection/doctor/moderators_add.php';
  static const deleteMod = '$hostConnection/doctor/delete_mod.php';
  static const userLogin = '$hostConnection/doctor/user_login.php';
  static const userSignup = '$hostConnection/doctor/user_signup.php';
  static const appointments = '$hostConnection/doctor/ap.php';
  static const DoctorBookings = '$hostConnection/doctor/get_doctor_booking.php';
  static const getDoctorData = '$hostConnection/doctor/doctor_data.php';
  static const getDoctorAds = '$hostConnection/doctor/get_doctor_ads.php';
  static const RenewAd = '$hostConnection/doctor/renew_ad.php';
  static const allCat = '$hostConnection/doctor/cat.php';
  static const addBooking = '$hostConnection/doctor/add_booking.php';
  static const getBooking = '$hostConnection/doctor/get_booking.php';
  static const SEARCH = '$hostConnection/doctor/search.php';
  static const SEARCHFilters = '$hostConnection/doctor/search_filters.php';
  static const allDoctorsData = '$hostConnection/patient/all_doctors.php';
  static const Country = '$hostConnection/doctor/country.php';
  static const addFav = '$hostConnection/doctor/add_fav.php';
  static const deleteFav = '$hostConnection/doctor/delete.php';
  static const validateFav = '$hostConnection/doctor/validate.php';
  static const getFav = '$hostConnection/doctor/read.php';

  static const bouquet = '$hostConnection/doctor/bouquet.php';
  static const ads = '$hostConnection/doctor/ads.php';
  static const ads2 = '$hostConnection/doctor/ads2.php';

  static const Filters = '$hostConnection/doctor/get_filters.php';

  static const Places = '$hostConnection/doctor/get_places.php';
  static const Places2 = '$hostConnection/doctor/get_places2.php';

  static const TopDoctors = '$hostConnection/doctor/top_doctors.php';

  static const Best = '$hostConnection/doctor/ads.php';


  static const admin_login = '$hostConnection/admin/login.php';
  static const getUserData = '$hostConnection/doctor/get_user_data.php';
  static const adAds = '$hostConnection/doctor/add_ads.php';
  // static const getDoctorData= '$hostConnection/doctor/doctor_data.php';

  static const updateData = '$hostConnection/doctor/update_data.php';
  static const updateAd = '$hostConnection/doctor/update_ad.php';
  //
  // static const addToFav = '$hostConnection/User/fav/add.php';
  // static const  readFav= '$hostConnection/User/fav/read.php';

  //upload new items
  static const uploadItem = '$hostConnection/items/upload.php';
  //clothesItem
  static const getTrendingClothes = '$hostConnection/clothes/trending.php';
  static const getAllClothes = '$hostConnection/clothes/all_items.php';
  static const addToCart = '$hostConnection/cart/add.php';
  static const deleteFromCart = '$hostConnection/cart/delete.php';
  static const getCart = '$hostConnection/cart/read.php';
  static const updateQuantity = '$hostConnection/cart/update.php';

    static const AddPlaces = '$hostConnection/doctor/add_places.php';
  static const AddPlaces2 = '$hostConnection/doctor/add_places2.php';

}
//192.168.1.10
//255.255.255.0 mask
//192.168.1.1