import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/connection_exception.dart';
import 'package:nawa_platform/model/slider_response.dart';
import 'package:nawa_platform/model/title_response.dart';
import 'package:nawa_platform/network/portal_service.dart';
import 'package:provider/provider.dart';

abstract class PortalRepository {

  Future<SliderResponse> getSliderData(BuildContext context);
  Future<TitleResponse> getTitle(BuildContext context);

}

class PortalRepositoryImpl extends PortalRepository {

  @override
  Future<SliderResponse> getSliderData(BuildContext context) async {
      var _response = await Provider.of<PortalService>(context, listen: false).getSlider();
      if(_response.isSuccessful){
          return _response.body;
      }else {
        throw ConnectionException();
      }
  }

  @override
  Future<TitleResponse> getTitle(BuildContext context) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getTitles();
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }


}
