import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_task/data/remote/remote.dart';
import '../../domain/model/get_ingredients_model.dart';
import '../core/network/NetworkService.dart';
import '../core/network/urlPath.dart';


/// This calls implements the UserRemote logic
class AppRemoteImpl extends NetworkService implements AppRemote {
  final Dio dioClient;

  AppRemoteImpl(
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

}
