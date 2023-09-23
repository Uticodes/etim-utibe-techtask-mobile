import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/presentation/select_lunch_date/select_lunch_date.dart';
import 'package:tech_task/routes/locator.dart';
import 'package:tech_task/routes/routes.dart';
import 'package:tech_task/services/navigation_service.dart';

void main() async {
  runZonedGuarded(() async {
    ///initialize .env
    await dotenv.load(fileName: ".env");
    ///setup dependency injector
    dependenciesInjector();

    runApp(
      const MyApp(),
    );
  }, (dynamic error, dynamic stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        title: 'Klasha Test App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const SelectLaunchDate(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
