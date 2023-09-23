
import '../../domain/model/get_ingredients_model.dart';

abstract class AppRemote {
  Future<GetIngredientsResponse> getIngredients();
}
