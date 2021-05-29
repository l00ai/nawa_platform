import 'dart:async';
import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor  {
  static const String AUTH_HEADER_1 = "content-type";
  static const String AUTH_HEADER_2 = "accept";
  static const String VALUE = "application/json";


  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest = request.copyWith(headers: {AUTH_HEADER_1: VALUE, AUTH_HEADER_2: VALUE});
    return newRequest;
  }


}