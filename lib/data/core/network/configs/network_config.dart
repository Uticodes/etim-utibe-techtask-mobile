import 'package:flutter_dotenv/flutter_dotenv.dart';

/// this class has all remote service configurations
class NetworkConfig {
  static String? devBaseUrl;

  // Static initializer block
  static void initializeDevBaseUrl() {
    final baseUrl = dotenv.env['BASE_URL'];
    devBaseUrl = baseUrl;
  }
}
