import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/presentation/components/base_view.dart';
import 'package:tech_task/presentation/view_model/app_view_model.dart';
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
          //primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
        onModelReady: (model) {
      model.getRecipes(context,
              onError: (error) => debugPrint("Error: $error"));
    },
    builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    ));
  }
}
