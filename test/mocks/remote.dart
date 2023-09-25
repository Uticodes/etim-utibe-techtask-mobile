import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/data/core/network/NetworkService.dart';
import 'package:tech_task/data/core/network/urlPath.dart';
import 'package:tech_task/data/remote/remote.dart';
import 'package:tech_task/data/remote/remote_impl.dart';
import 'package:tech_task/data/repository/repository.dart';
import 'package:tech_task/domain/model/get_ingredients_model.dart';
import 'package:tech_task/domain/model/get_recipes_model.dart';

class MockRemote extends Mock implements AppRemote {
  @override
  Future<GetIngredientsResponse> getIngredients();

  @override
  Future<GetRecipesResponse> getRecipes(List<String> ingredients);
}

@GenerateMocks([Dio, AppRepository])
class MockRemoteImpl extends Mock implements AppRemoteImpl {
  final Dio dioClient;

  MockRemoteImpl(
      this.dioClient,
      );

  @override
  Future<GetIngredientsResponse> getIngredients() async {
    try {
      final response = await request(
        path: UrlPath.ingredients,
        method: RequestMethod.get,
      );
      final responseData = GetIngredientsResponse.fromJson(response.data);
      return responseData;
    } catch (err) {
      debugPrint("Ingredients remote error:: $err");
      rethrow;
    }
  }

  @override
  Future<GetRecipesResponse> getRecipes(List<String> ingredients) async {
    try {
      final response = await request(
        path: "${UrlPath.recipes}$ingredients",
        method: RequestMethod.get,
      );
      final responseData = GetRecipesResponse.fromJson(response.data);
      return responseData;
    } catch (err) {
      debugPrint("GetRecipes remote error:: $err");
      rethrow;
    }
  }
}