import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nawa_platform/helper/user_preferences.dart';
import 'package:nawa_platform/model/title_response.dart';
import 'package:nawa_platform/repository/portal_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PortalRepository _portalService ;

  AuthenticationBloc(PortalRepository portalService):
        assert(portalService != null),
        _portalService = portalService,
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }

  }

  var _response ;
  

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      UserPreferences userPref = UserPreferences();
      var status = await userPref.getSplashStatus();
       _response = await _portalService.getTitle(event.context);
      if (status != null) {
        if(status) {
          yield AuthenticationAuthenticated(titles: _response);
        }else {
          yield AuthenticationNotAuthenticated(titles: _response);
        }
      } else {
        yield AuthenticationNotAuthenticated(titles: _response);
      }
    } catch (e) {
      print(e);
      yield AuthenticationFailure(message:'');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    UserPreferences userPref = UserPreferences();
    await userPref.splashSeen(true);
    yield AuthenticationAuthenticated(titles: _response);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
    UserPreferences userPref = UserPreferences();
    await userPref.splashSeen(false);
    yield AuthenticationNotAuthenticated(titles: null);
  }



}
