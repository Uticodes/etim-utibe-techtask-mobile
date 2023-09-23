class GetRecipesResponse {
  final List<Recipe> recipes;

  GetRecipesResponse({required this.recipes});

  factory GetRecipesResponse.fromJson(List<dynamic> json) {
    List<Recipe> recipes = json.map((item) {
      return Recipe.fromJson(item);
    }).toList();

    return GetRecipesResponse(recipes: recipes);
  }

  Map<String, dynamic> toJson() {
    return {
      "recipes": recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }
}

class Recipe {
  final String? title;
  final List<String> ingredients;

  Recipe({required this.title, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json["title"],
      ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "ingredients": ingredients,
    };
  }
}
