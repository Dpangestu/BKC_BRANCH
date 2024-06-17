import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/auth_repository_interface.dart';
import '../../domain/auth/user.dart';
import 'auth_dto.dart';
import 'api_config.dart';

class AuthRepository implements AuthRepositoryInterface {
  final http.Client _client;

  AuthRepository(this._client);

  @override
  Future<Either<AuthFailure, User>> login(
      String username, String password) async {
    print(
        'Sending login request with username: $username and password: $password');

    try {
      final response = await _client.post(
        Uri.parse('${ApiConfig.baseUrl}${ApiConfig.loginEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final authDTO = AuthDTO.fromJson(json);
        return right(authDTO.toDomain());
      } else {
        return left(AuthFailure('Login failed: ${response.body}'));
      }
    } catch (e) {
      print('Error: $e');
      return left(AuthFailure('Unexpected error: $e'));
    }
  }
}
