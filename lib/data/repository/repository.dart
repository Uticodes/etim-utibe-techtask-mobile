import '../../domain/model/get_ingredients_model.dart';

abstract class AppRepository {
  Future<GetIngredientsResponse> getIngredients();
}