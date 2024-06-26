import '../../domain/auth/user.dart';

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
      accessToken: json['access_token'] ?? '', // Tambahkan handling null
      tokenType: json['token_type'] ?? 'bearer', // Default token type jika null
      expiresIn: json['expires_in'],
      user: User.fromJson(json['user']),
    );
  }

  User toDomain() {
    return this.user.copyWith(token: this.accessToken);
  }

  String get token {
    return '${tokenType ?? ''} ${accessToken ?? ''}';
  }
}

extension UserCopyWith on User {
  User copyWith({
    int? id,
    String? username,
    String? nama_lengkap,
    String? id_role,
    String? unit_kerja,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? status,
    int? login_attempts,
    DateTime? lockout_until,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      nama_lengkap: nama_lengkap ?? this.nama_lengkap,
      id_role: id_role ?? this.id_role,
      unit_kerja: unit_kerja ?? this.unit_kerja,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      login_attempts: login_attempts ?? this.login_attempts,
      lockout_until: lockout_until ?? this.lockout_until,
      token: token ?? this.token,
    );
  }
}
