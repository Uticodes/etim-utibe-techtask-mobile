import 'package:tech_task/domain/model/get_ingredients_model.dart';
import 'package:tech_task/domain/model/get_recipes_model.dart';

GetIngredientsResponse mockIngredientsResponse() {
  final jsonData = [
    {
      "title": "Ham",
      "use-by": "2020-11-25"
    },
    {
      "title": "Cheese",
      "use-by": "2020-01-08"
    },
    {
      "title": "Bread",
      "use-by": "2020-11-01"
    },
    {
      "title": "Butter",
      "use-by": "2020-11-25"
    },
    {
      "title": "Bacon",
      "use-by": "2020-11-02"
    },
    {
      "title": "Eggs",
      "use-by": "2020-11-25"
    },
    {
      "title": "Mushrooms",
      "use-by": "2020-11-11"
    },
    {
      "title": "Sausage",
      "use-by": "2020-11-25"
    },
    {
      "title": "Hotdog Bun",
      "use-by": "2019-11-25"
    },
    {
      "title": "Ketchup",
      "use-by": "2019-11-11"
    },
    {
      "title": "Mustard",
      "use-by": "2019-11-10"
    },
    {
      "title": "Lettuce",
      "use-by": "2019-11-10"
    },
    {
      "title": "Tomato",
      "use-by": "2019-11-05"
    },
    {
      "title": "Cucumber",
      "use-by": "2019-11-05"
    },
    {
      "title": "Beetroot",
      "use-by": "2019-11-06"
    },
    {
      "title": "Salad Dressing",
      "use-by": "2019-11-06"
    }
  ];

  List<Ingredient> ingredients = jsonData.map((data) => Ingredient.fromJson(data)).toList();

  return GetIngredientsResponse(ingredients: ingredients);
}

GetIngredientsResponse mockEmptyIngredientsResponse() {
  final jsonData = [];

  List<Ingredient> ingredients = jsonData.map((data) => Ingredient.fromJson(data)).toList();

  return GetIngredientsResponse(ingredients: ingredients);
}

GetIngredientsResponse mockErrorIngredientsResponse() {
  final jsonData = [{
    "title": "Connection Error",
  }];

  List<Ingredient> ingredients = jsonData.map((data) => Ingredient.fromJson(data)).toList();

  return GetIngredientsResponse(ingredients: ingredients);
}

GetRecipesResponse mockRecipesResponse() {
  final jsonData = [
    {
      "title": "Ham and Cheese Toastie",
      "ingredients": [
        "Ham",
        "Cheese",
        "Bread",
        "Butter"
      ]
    },
    {
      "title": "Salad",
      "ingredients": [
        "Lettuce",
        "Tomato",
        "Cucumber",
        "Beetroot",
        "Salad Dressing"
      ]
    },
    {
      "title": "Hotdog",
      "ingredients": [
        "Hotdog Bun",
        "Sausage",
        "Ketchup",
        "Mustard"
      ]
    }
  ];

  List<Recipe> recipes = jsonData.map((data) => Recipe.fromJson(data)).toList();

  return GetRecipesResponse(recipes: recipes);
}