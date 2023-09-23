import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'AppInterceptor.dart';
import 'api_error_handler.dart';
import 'configs/network_config.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global

enum RequestMethod { post, get, put, delete, upload }

class NetworkService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;
  String? baseUrl;
  String authToken = "";

  NetworkService({this.baseUrl}) {
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() async {
    // var authToken = await sharedPreference.getToken();
    debugPrint("Show _initialiseDio saved token..$authToken");
    dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
      baseUrl: NetworkConfig.devBaseUrl.toString(),
    ));

    dio!.interceptors
      ..add(AppInterceptor(authToken))
      ..add(LogInterceptor(requestBody: true))
      ..add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          logPrint: (object) {
            debugPrint("logPrint $object");
          },
          maxWidth: 90));
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkService.test(this.dio);

  Future<Response> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    Options? options,
    classTag = '',
  }) async {
    // var authToken = await sharedPreference.getToken();
    Response response;
    var params = queryParams ?? {};
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio!.post(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: authToken));
          break;
        case RequestMethod.get:
          response = await dio!.get(path,
              queryParameters: params,
              options: options ?? await _getOption(token: authToken));

          break;
        case RequestMethod.put:
          response = await dio!.put(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: authToken));
          break;
        case RequestMethod.delete:
          response = await dio!.delete(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: authToken));
          break;
        case RequestMethod.upload:
          response = await dio!.post(path,
              data: formData,
              queryParameters: params,
              options:
                  options ?? await _getOption(token: authToken, upload: true),
              onSendProgress: (sent, total) {});
          break;
      }
      return response;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // perform action
      }
      return Future.error(apiError, stackTrace);
    }
  }

  Future<Options> _getOption(
      {required String token, bool upload = false}) async {
    return Options(headers: {
      "Authorization": "Bearer $token",
      'Accept': 'application/json',
      'x-channel': 'mobile',
      if (upload) "Content-Disposition": "form-data",
      if (upload) "Content-Type": "multipart/form-data",
      if (upload) "Accept": "*/*",
    });
  }
}
