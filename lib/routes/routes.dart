import 'package:flutter/material.dart';

import '../presentation/components/route_error_page.dart';

class AppRoutes {
  static const ingredients = '/ingredients';
  static const recipes = '/recipes';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ErrorPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}
