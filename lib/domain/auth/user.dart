class User {
  final int id;
  final String username;
  final String nama_lengkap;
  final String id_role;
  final String unit_kerja;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int login_attempts;
  final DateTime? lockout_until;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.nama_lengkap,
    required this.id_role,
    required this.unit_kerja,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.login_attempts,
    this.lockout_until,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      nama_lengkap: json['nama_lengkap'],
      id_role: json['id_role'],
      unit_kerja: json['unit_kerja'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'],
      login_attempts: json['login_attempts'],
      lockout_until: json['lockout_until'] != null
          ? DateTime.parse(json['lockout_until'])
          : null,
      token: json['access_token'] ?? '',
    );
  }
}
