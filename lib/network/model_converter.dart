import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:nawa_platform/model/settings_response.dart';
import 'package:nawa_platform/model/slider_response.dart';
import 'package:nawa_platform/model/stories_response.dart';
import 'package:nawa_platform/model/title_response.dart';


class ModelConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      var mapData = json.decode(body);
      var data = TitleResponse.fromJson(mapData);
      return response.copyWith<BodyType>(body: data as BodyType);
    } catch (e) {
      try {
        var mapData = json.decode(body);
        var data = SettingsResponse.fromJson(mapData);
        return response.copyWith<BodyType>(body: data as BodyType);
      } catch (e) {
        try {
          var mapData = json.decode(body);
          var data = SliderResponse.fromJson(mapData);
          return response.copyWith<BodyType>(body: data as BodyType);
        } catch (e) {
          try {
            var mapData = json.decode(body);
            var data = StoriesResponse.fromJson(mapData);
            return response.copyWith<BodyType>(body: data as BodyType);
          } catch (e) {
            chopperLogger.warning(e);
            return response.copyWith<BodyType>(body: body);
          }
        }
      }
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }

}