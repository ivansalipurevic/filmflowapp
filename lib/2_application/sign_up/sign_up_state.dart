import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const SignUpState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  SignUpState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccess];
}
