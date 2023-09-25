class GetIngredientsResponse {
  final List<Ingredient> ingredients;

  GetIngredientsResponse({required this.ingredients});

  factory GetIngredientsResponse.fromJson(List<dynamic> json) {
    List<Ingredient> ingredients = json.map((item) {
      return Ingredient(
        title: item["title"] ?? "",
        useBy: item["use-by"] ?? "",
      );
    }).toList();

    return GetIngredientsResponse(ingredients: ingredients);
  }

  Map<String, dynamic> toJson() {
    return {
      "ingredients": ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }
}

class Ingredient {
  final String? title;
  final String? useBy;

  Ingredient({required this.title, required this.useBy});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      title: json["title"],
      useBy: json["use-by"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "use-by": useBy
    };
  }
}
