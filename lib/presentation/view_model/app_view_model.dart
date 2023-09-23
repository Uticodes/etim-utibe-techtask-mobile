import 'package:flutter/material.dart';

import '../../data/core/enum/view_state.dart';
import '../../data/repository/repository.dart';
import '../../domain/model/get_ingredients_model.dart';
import '../../domain/model/get_recipes_model.dart';
import '../components/base_view_model.dart';
import '../components/loader.dart';

class AppViewModel extends BaseViewModel {
  final AppRepository repository;

  AppViewModel(this.repository);

  GetIngredientsResponse? getIngredientsResponse;
  GetRecipesResponse? getRecipesResponse;
  String errorMessage = "";
  ViewState _state = ViewState.idle;

  @override
  ViewState get viewState => _state;

  void setViewState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void setError(String error) {
    errorMessage = error;
    notifyListeners();
  }

  Future<GetIngredientsResponse?> getIngredients(
      BuildContext context,
      Function(String) onError,
      ) async {
    try {
      final loader = Loader(context);
      setViewState(ViewState.loading);
      loader.show();

      var response = await repository.getIngredients();
      getIngredientsResponse = response;

      setViewState(ViewState.success);

      loader.close();

      return response;
    } catch (error) {
      setViewState(ViewState.error);
      setError(error.toString());
      onError(errorMessage.toString());
    }
    return null;
  }


}