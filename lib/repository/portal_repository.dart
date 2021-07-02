import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:nawa_platform/helper/connection_exception.dart';
import 'package:nawa_platform/helper/user_preferences.dart';
import 'package:nawa_platform/model/slider_response.dart';
import 'package:nawa_platform/model/stories_response.dart';
import 'package:nawa_platform/model/title_response.dart';
import 'package:nawa_platform/network/portal_service.dart';
import 'package:provider/provider.dart';

abstract class PortalRepository {

  Future<SliderResponse> getSliderData(BuildContext context);
  Future<TitleResponse> getTitle(BuildContext context);
  Future<StoriesResponse> getStoriesForHome(BuildContext context);
  Future<StoriesResponse> getStoriesQ(BuildContext context, String q);
  Future<StoriesResponse> getStoriesAsType(BuildContext context, String typeID);
  Future<StoriesResponse> getHeritageAsType(BuildContext context, String typeID);
  Future<StoriesResponse> getHeritageForHome(BuildContext context);
  Future<StoriesResponse> getHeritageQ(BuildContext context, String q);
  Future<String> subscriptions(BuildContext context, Map<String, dynamic> body);
  Future<String> needHelp(BuildContext context, Map<String, dynamic> body);

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

  @override
  Future<StoriesResponse> getStoriesForHome(BuildContext context) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getStoriesForHome();
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }

  @override
  Future<StoriesResponse> getStoriesAsType(BuildContext context, String typeID) async{
    var _response = await Provider.of<PortalService>(context, listen: false).getStoriesAsType(typeID);
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }

  @override
  Future<StoriesResponse> getHeritageForHome(BuildContext context) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getHeritageForHome();
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }

  @override
  Future<StoriesResponse> getHeritageAsType(BuildContext context, String typeID) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getHeritageAsType(typeID);
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }

  @override
  Future<String> needHelp(BuildContext context, Map<String, dynamic> body) async {
    var _response = await Provider.of<PortalService>(context, listen: false).needHelp(body);
    if(_response.isSuccessful){
      var data = jsonDecode(_response.body);
      if(data['Code'] > 0){
        UserPreferences userPref = UserPreferences();
        await userPref.subscription(true);
        return _response.body;
      }else{
        return null;
      }
    }else {
      return null;
    }
  }

  @override
  Future<String> subscriptions(BuildContext context, Map<String, dynamic> body) async {
    var _response = await Provider.of<PortalService>(context, listen: false).subscriptions(body);
    if(_response.isSuccessful){
      var data = jsonDecode(_response.body);
      if(data['Code'] > 0){
        UserPreferences userPref = UserPreferences();
        await userPref.subscription(true);
        return _response.body;
      }else{
        return null;
      }
    }else {
      return null;
    }
  }

  @override
  Future<StoriesResponse> getStoriesQ(BuildContext context, String q) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getStoriesQ(q);
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }

  @override
  Future<StoriesResponse> getHeritageQ(BuildContext context, String q) async {
    var _response = await Provider.of<PortalService>(context, listen: false).getHeritageQ(q);
    if(_response.isSuccessful){
      return _response.body;
    }else {
      throw ConnectionException();
    }
  }


}
