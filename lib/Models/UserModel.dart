// import 'package:http/http.dart' as http;

class UserModel {
  String username;
  String password;
  String token;

  UserModel(
      {required this.username, required this.password, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      token: json['token'],
    );
  }
}
