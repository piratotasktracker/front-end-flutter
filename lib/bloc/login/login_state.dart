part of "login_cubit.dart";

abstract interface class ILoginState extends Equatable {
  const ILoginState();
}

class LoginInitialState extends ILoginState {

  const LoginInitialState();
  
  @override
  List<Object?> get props => [];

}

class LoginLoadingState extends ILoginState {

  const LoginLoadingState();

  @override
  List<Object?> get props => [];

}

class LoginSuccessState extends ILoginState {

  const LoginSuccessState();

  @override
  List<Object?> get props => [];

}

class LoginErrorState extends ILoginState {

  final ErrorMessage error;

  const LoginErrorState({required this.error});

  @override
  List<Object?> get props => [error];
  
}

