class User {
  final int id;
  final String username;
  final String fullName;
  final String roleId;
  final String unitOfWork;
  final String email;
  final DateTime? emailVerifiedAt; // Gunakan DateTime? karena bisa null
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int loginAttempts;
  final DateTime? lockoutUntil; // Gunakan DateTime? karena bisa null
  final String token; // Tambahkan properti token

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.roleId,
    required this.unitOfWork,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.loginAttempts,
    this.lockoutUntil,
    required this.token, // Inisialisasikan properti token di konstruktor
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      fullName: json['nama_lengkap'],
      roleId: json['id_role'],
      unitOfWork: json['unit_kerja'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      status: json['status'],
      loginAttempts: json['login_attempts'],
      lockoutUntil: json['lockout_until'] != null
          ? DateTime.parse(json['lockout_until'])
          : null,
      token: json['access_token'], // Assign token from JSON response
    );
  }
}
