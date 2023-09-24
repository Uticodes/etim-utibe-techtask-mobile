import 'package:flutter/material.dart';

import '../presentation/components/route_error_page.dart';
import '../presentation/ingredients/ingredients.dart';

class AppRoutes {
  static const ingredients = '/ingredients';
  static const recipes = '/recipes';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g navigationService.navigate(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {
      case AppRoutes.ingredients:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const IngredientsScreen(),
          settings: settings,
          fullscreenDialog: true,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ErrorPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}
