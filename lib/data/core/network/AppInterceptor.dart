import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


/// [Interceptor] extension for setting token header
/// and other required properties for all requests
class AppInterceptor extends Interceptor {
  String? authToken;
  AppInterceptor(this.authToken);

  /// sets the auth token and Apptoken
  /// Apptoken is an identify for each app
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
      debugPrint("Show AppInterceptor saved token..$authToken");
      options.headers.addAll({"Authorization": "Bearer $authToken"});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      // perform action
    }
    return super.onResponse(response, handler);
  }
}
