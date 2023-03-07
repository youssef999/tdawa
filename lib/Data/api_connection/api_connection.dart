

class API {
  static const hostConnection = 'http://192.168.1.13/tdawa';
  static const hostConnectionUser = '$hostConnection/user';
  static const validateEmail = '$hostConnection/user/validate_email.php';
  static const signup = '$hostConnection/doctor/signup.php';
  static const login = '$hostConnection/doctor/login.php';
  static const appointments = '$hostConnection/doctor/ap.php';
  static const bouquet = '$hostConnection/doctor/bouquet.php';
  static const ads = '$hostConnection/doctor/ads.php';
  static const admin_login = '$hostConnection/admin/login.php';
  //upload new items
  static const uploadItem = '$hostConnection/items/upload.php';
  //clothesItem
  static const getTrendingClothes = '$hostConnection/clothes/trending.php';
  static const getAllClothes = '$hostConnection/clothes/all_items.php';
  static const addToCart = '$hostConnection/cart/add.php';
  static const deleteFromCart = '$hostConnection/cart/delete.php';
  static const getCart = '$hostConnection/cart/read.php';
  static const updateQuantity = '$hostConnection/cart/update.php';
  static const addFav = '$hostConnection/fav/add.php';
  static const deleteFav = '$hostConnection/fav/delete.php';
  static const validateFav = '$hostConnection/fav/validate.php';
  static const getFav = '$hostConnection/fav/read.php';
}
//192.168.1.10
//255.255.255.0 mask
//192.168.1.1