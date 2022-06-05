
class User {

  late String token;


  User();

  User.fromJson(Map<String, dynamic> json) {

    token = json['token'];

  }
}
