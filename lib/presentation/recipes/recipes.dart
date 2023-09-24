import 'package:flutter/material.dart';
import 'package:tech_task/presentation/recipes/recipe_item.dart';

import '../../domain/model/get_recipes_model.dart';
import '../../utils/constants.dart';
import '../components/custom_app_bar.dart';

class RecipesScreen extends StatefulWidget {
  final GetRecipesResponse getRecipesResponse;

  const RecipesScreen({super.key, required this.getRecipesResponse});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  getLaunchDate() async {
    var lunchDate = await sharedPreference.getLaunchDate();
    debugPrint("Lunch Date: $lunchDate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        headerTitle: 'Recipes',
        onTap: () {
          navigationService.goBack();
        },
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: widget.getRecipesResponse.recipes.length,
              itemBuilder: (context, index) {
                var recipe = widget.getRecipesResponse.recipes[index];

                return RecipeItem(
                  title: recipe.title,
                  ingredients: recipe.ingredients.join(", "),
                );
              })),
    );
  }
}
