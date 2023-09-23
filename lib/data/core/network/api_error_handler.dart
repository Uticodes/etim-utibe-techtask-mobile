import 'package:dio/dio.dart';
import 'ApiErrorModel.dart';

/// Helper class for converting [DioException] into readable formats
class ApiError {
  int? errorType = 0;

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioException) {
      DioException dioError = error; // as DioError;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout, please try again later";
          break;
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Error in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate in connection with API server";
          break;

        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          errorType = dioError.response?.statusCode;
          errorDescription = _handleErrorFromStatusCode(dioError.response);
          break;
      }
    } else {
      errorDescription = "Oops! an error occurred, we are working on a fix";
    }
  }

  @override
  String toString() => '$errorDescription';

  String? _handleErrorFromStatusCode(Response? response) {
    String? message;
    switch (response?.statusCode) {
      case 250:
      case 400:
      case 403:
      case 404:
      case 409:
      case 422:
      case 500:
        message = _handleResponseFromLaravel(response);
        break;
      default:
    }
    return message;
  }

  String? _handleResponseFromLaravel(Response<dynamic>? data) {
    final response = ErrorResponse.fromJson(data?.data);
    return response.message;
  }
}
