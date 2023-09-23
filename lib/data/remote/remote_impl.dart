import 'package:dio/dio.dart';
import 'package:tech_task/data/remote/remote.dart';
import '../core/network/NetworkService.dart';


/// This calls implements the UserRemote logic
class AppRemoteImpl extends NetworkService implements AppRemote {
  final Dio dioClient;

  AppRemoteImpl(
    this.dioClient,
  );


}
