import 'package:tech_task/data/repository/repository.dart';

import '../../domain/model/get_ingredients_model.dart';
import '../../domain/model/get_recipes_model.dart';
import '../remote/remote.dart';

class AppRepositoryImpl extends AppRepository {
  final AppRemote remote;

  AppRepositoryImpl(
    this.remote,
  );

  @override
  Future<GetIngredientsResponse> getIngredients() async {
    return remote.getIngredients();
  }

  @override
  Future<GetRecipesResponse> getRecipes(List<String> ingredients) async {
    return remote.getRecipes(ingredients);
  }
}
