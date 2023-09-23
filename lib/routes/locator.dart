import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../data/core/network/configs/network_config.dart';
import '../data/remote/remote.dart';
import '../data/remote/remote_impl.dart';
import '../data/repository/repository.dart';
import '../data/repository/repository_impl.dart';
import '../presentation/view_model/app_view_model.dart';
import '../services/navigation_service.dart';

GetIt getIt = GetIt.I;

dependenciesInjector() async {
  ///initialize WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();

  ///initialize to get baseUrl
  NetworkConfig.initializeDevBaseUrl();

  //Interceptors configuration
  getIt.registerFactory(() {
    Dio dio = Dio();
    return dio;
  });

  ///View Model
  getIt.registerFactory<AppViewModel>(() => AppViewModel(getIt()));

  /// Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  getIt.registerFactory<AppRemote>(() => AppRemoteImpl(getIt<Dio>()));
  getIt.registerFactory<AppRepository>(
      () => AppRepositoryImpl(getIt<AppRemote>()));
}
