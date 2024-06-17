import 'package:bkc_super_app/domain/auth/user.dart';

class AuthDTO {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final User user;

  AuthDTO({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  factory AuthDTO.fromJson(Map<String, dynamic> json) {
    return AuthDTO(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      user: User.fromJson(json['user']),
    );
  }

  // Optional: Convert to domain model if needed
  User toDomain() {
    return this.user;
  }
}
