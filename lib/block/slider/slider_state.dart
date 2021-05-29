part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {
  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}



class GetSliderSuccess extends SliderState {
  final List<SliderItem> sliders;

  GetSliderSuccess({@required this.sliders});

  @override
  List<Object> get props => [sliders];
}

class GetSliderFailure extends SliderState {
  final String error;

  GetSliderFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
