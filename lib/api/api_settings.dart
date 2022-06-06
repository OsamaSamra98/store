class ApiSettings {

  //Auth Request
  static const String _BASE_URL = 'https://fakestoreapi.com/';
  static const String LOGIN = _BASE_URL + "auth/login";
  static const String LOGOUT = _BASE_URL + "auth/logout";
  static const String products = _BASE_URL + "products";

  //Cities Request

  //category Req && sub category
  static const String CATEGORY = _BASE_URL + products+"/categories";

  //product re
  static const String PRODUCT_DETAILS = _BASE_URL + "products";
  static const String profile = _BASE_URL + "users/2";


  //sub category



//address

  static const String ADDRESS = _BASE_URL + "addresses";

  static const String CARD = _BASE_URL + "payment-cards";
  static const String ORDER = _BASE_URL + "orders";




// static const String _API_BASE_URL = _BASE_URL + '/api/';
// static const String IMAGES_URL = _BASE_URL + '/images/';
//
// static const String GET_USERS = _API_BASE_URL + "users";

// static const String REGISTER = _API_BASE_URL + "students/auth/register";


// static const String TASK = _API_BASE_URL + "tasks";

}