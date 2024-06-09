import 'package:bkc_super_app/Service/api_service.dart';
import 'package:bkc_super_app/Models/UserModel.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<UserModel> login(String username, String password) async {
    final endpoint = '/auth/login'; // assume the login endpoint is '/login'
    final data = {
      'username': username,
      'password': password,
    };

    final response = await _apiService.post(endpoint, data);

    if (response['status'] == 'uccess') {
      return UserModel.fromJson(response['data']);
    } else {
      throw Exception('Failed to login');
    }
  }
}
