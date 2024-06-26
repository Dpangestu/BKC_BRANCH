import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart'; // Tambahkan ini
import 'auth_failure.dart';
import 'user.dart';

abstract class AuthRepositoryInterface {
  Future<Either<AuthFailure, User>> login(
      String username, String password, BuildContext context);
}
