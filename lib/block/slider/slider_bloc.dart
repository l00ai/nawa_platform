import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nawa_platform/model/slider_item.dart';
import 'package:nawa_platform/repository/portal_repository.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {

  final PortalRepository _portalService;

  SliderBloc(PortalRepository portalService) :
        assert(portalService != null),
        _portalService = portalService,
        super(SliderInitial());


  @override
  Stream<SliderState> mapEventToState(
    SliderEvent event,
  ) async* {
    if(event is GetSliderData){
      yield* _mapGetSliderDataToState(event);
    }
  }

  Stream<SliderState> _mapGetSliderDataToState(GetSliderData event) async* {
    yield SliderLoading();
    try {
      final sliders = await _portalService.getSliderData(event.context);

      if (sliders != null) {
        yield GetSliderSuccess(sliders: sliders.sliders);
      } else {
        yield GetSliderFailure(error: 'لا يوجد عناصر');
      }
    } catch (e) {
      print(e.toString());
      yield GetSliderFailure(error: 'لا يوجد إتصال بالإنترنت !');
    }
  }

}
