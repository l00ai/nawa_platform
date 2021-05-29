part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSliderData extends SliderEvent {
  final BuildContext context;
  GetSliderData({@required this.context});
}
