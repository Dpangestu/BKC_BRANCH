import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/auth_repository_interface.dart';
import '../../domain/auth/user.dart';

class AuthEvent {
  final String username;
  final String password;

  AuthEvent(this.username, this.password);
}

class AuthState {
  final bool isLoading;
  final Option<Either<AuthFailure, User>> authFailureOrSuccessOption;

  AuthState({
    required this.isLoading,
    required this.authFailureOrSuccessOption,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      authFailureOrSuccessOption: none(),
    );
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface _authRepository;

  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthState(isLoading: true, authFailureOrSuccessOption: none()));
      final failureOrSuccess =
          await _authRepository.login(event.username, event.password);
      emit(AuthState(
          isLoading: false,
          authFailureOrSuccessOption: some(failureOrSuccess)));
    });
  }
}
