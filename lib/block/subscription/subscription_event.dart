part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();

  @override
  List<Object> get props => [];
}

class CheckSubscription extends SubscriptionEvent {
  final BuildContext context;

  CheckSubscription({@required this.context});
}
