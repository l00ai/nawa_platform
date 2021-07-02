// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PortalService extends PortalService {
  _$PortalService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PortalService;

  @override
  Future<Response<TitleResponse>> getTitles() {
    final $url = '/Settings/Title';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<TitleResponse, TitleResponse>($request);
  }

  @override
  Future<Response<TitleResponse>> getTitlesById(String titleID) {
    final $url = '/Settings/Title';
    final $params = <String, dynamic>{'TitleID': titleID};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<TitleResponse, TitleResponse>($request);
  }

  @override
  Future<Response<SettingsResponse>> getSettings() {
    final $url = '/Settings/Title';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SettingsResponse, SettingsResponse>($request);
  }

  @override
  Future<Response<SliderResponse>> getSlider() {
    final $url = '/Slider';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SliderResponse, SliderResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getStoriesAsType(String typeId) {
    final $url = '/Stories';
    final $params = <String, dynamic>{'Type': typeId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getStoriesQ(String q) {
    final $url = '/Stories';
    final $params = <String, dynamic>{'q': q};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getStoriesForHome(
      {String showInHome = '1'}) {
    final $url = '/Stories';
    final $params = <String, dynamic>{'ShowInHome': showInHome};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getHeritageAsType(String typeId) {
    final $url = '/Heritage';
    final $params = <String, dynamic>{'Type': typeId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getHeritageQ(String q) {
    final $url = '/Heritage';
    final $params = <String, dynamic>{'q': q};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<StoriesResponse>> getHeritageForHome(
      {String showInHome = '1'}) {
    final $url = '/Heritage';
    final $params = <String, dynamic>{'ShowInHome': showInHome};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StoriesResponse, StoriesResponse>($request);
  }

  @override
  Future<Response<String>> subscriptions(Map<String, dynamic> body) {
    final $url = '/Subscriptions';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> needHelp(Map<String, dynamic> body) {
    final $url = '/NeedHelp';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<String, String>($request);
  }
}
