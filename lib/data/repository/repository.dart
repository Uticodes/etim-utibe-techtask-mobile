import '../../domain/model/get_ingredients_model.dart';
import '../../domain/model/get_recipes_model.dart';

abstract class AppRepository {
  Future<GetIngredientsResponse> getIngredients();
  Future<GetRecipesResponse> getRecipes(List<String> ingredients);
}