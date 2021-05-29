part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// Fired just after the app is launched
class AppLoaded extends AuthenticationEvent {
  final BuildContext context;

  AppLoaded({@required this.context});
}

class GetTitles extends AuthenticationEvent {}

// Fired when a user has successfully logged in
class UserLoggedIn extends AuthenticationEvent {
  final BuildContext context;

  UserLoggedIn({@required this.context});
}

// Fired when the user has logged out
class UserLoggedOut extends AuthenticationEvent {}


