class AuthFailure {
  final String message;

  AuthFailure(this.message);

  @override
  String toString() => 'AuthFailure: $message';
}
