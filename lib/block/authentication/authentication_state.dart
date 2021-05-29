part of 'authentication_bloc.dart';


abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];

}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {
  final TitleResponse titles;

  AuthenticationNotAuthenticated({@required this.titles});

  @override
  List<Object> get props => [titles];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final TitleResponse titles;

  AuthenticationAuthenticated({@required this.titles});

  @override
  List<Object> get props => [titles];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
