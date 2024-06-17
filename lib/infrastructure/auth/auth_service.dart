import 'package:bkc_super_app/domain/auth/auth_failure.dart';

import '../../domain/auth/auth_repository_interface.dart';
import '../../domain/auth/user.dart';
import 'package:dartz/dartz.dart';

class AuthService {
  final AuthRepositoryInterface _authRepository;

  AuthService(this._authRepository);

  Future<Either<AuthFailure, User>> login(String username, String password) {
    return _authRepository.login(username, password);
  }
}
