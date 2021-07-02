import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/user_preferences.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitial());

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is CheckSubscription) {
      yield* _mapCheckSubscriptionToState(event);
    }

  }

  Stream<SubscriptionState> _mapCheckSubscriptionToState(CheckSubscription event) async* {
    yield SubscriptionLoading();
    try {
      UserPreferences userPref = UserPreferences();
      var subscription = await userPref.getSubscription();
      if (subscription != null) {
        if(subscription) {
          yield Subscriped();
        }else {
          yield NotSubscription();
        }
      } else {
        yield NotSubscription();
      }
    } catch (e){
      yield SubscriptionFailure();
    }
  }


}
