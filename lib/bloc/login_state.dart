part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Success extends LoginState {
   String token;
   Success ({required this.token});
}

class Failed extends LoginState {}

class Loading extends LoginState {}

class Offline extends LoginState {}
