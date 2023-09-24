import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/domain/model/get_recipes_model.dart';
import 'package:tech_task/presentation/recipes/recipes.dart';

void main() {

  testWidgets('SelectLaunchDate UI test', (tester) async {
    // GetRecipesResponse instance with some example data
    GetRecipesResponse recipesResponse = GetRecipesResponse(
      recipes: [
        Recipe(
            title: "Ham and Cheese Toastie",
            ingredients: ["Ham", "Cheese", "Bread", "Butter"]),
        Recipe(title: "Salad", ingredients: [
          "Lettuce",
          "Tomato",
          "Cucumber",
          "Beetroot",
          "Salad Dressing"
        ]),
        Recipe(
            title: "Hotdog",
            ingredients: ["Hotdog Bun", "Sausage", "Ketchup", "Mustard"]),
      ],
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(ScreenUtilInit(
      designSize: Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          home: RecipesScreen(
        getRecipesResponse: recipesResponse,
      )),
    ));

    // Wait for the widgets to settle.
    await tester.pumpAndSettle();

    // Verify if the "Recipes" text on AppBar and "ListView" is displayed.
    expect(find.text('Recipes'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // Expect to find the title of the first recipe in the screen
    expect(find.text('Ham and Cheese Toastie'), findsOneWidget);

    // Expect to find the ingredients of the first recipe in the screen
    expect(find.text('Ham, Cheese, Bread, Butter'), findsOneWidget);

  });

}
