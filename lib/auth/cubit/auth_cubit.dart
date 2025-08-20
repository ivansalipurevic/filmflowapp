import 'package:filmflowapp/auth/cubit/auth_state.dart';
import 'package:filmflowapp/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthState(isLoading: false));

  void signInWithEmailAndPassword(String email, String password) async {
    emit(AuthState(isLoading: true));
    final result = await authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (result) {
      emit(AuthState(isLoading: false, isSuccess: true));
    } else {
      emit(AuthState(isLoading: false, errorMessage: 'Invalid user password'));
    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    emit(AuthState(isLoading: true));
    final result = await authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (result) {
      emit(AuthState(isLoading: false, isSuccess: true));
    } else {
      emit(AuthState(isLoading: false, errorMessage: 'Invalid user password'));
    }
  }

  void loginWithEmailAndPassword(String email, String password) {
    signInWithEmailAndPassword(email, password);
  }
}
