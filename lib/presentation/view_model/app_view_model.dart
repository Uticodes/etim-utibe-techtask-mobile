import 'package:flutter/material.dart';

import '../../data/core/enum/view_state.dart';
import '../../data/repository/repository.dart';
import '../../domain/model/get_ingredients_model.dart';
import '../../domain/model/get_recipes_model.dart';
import '../../utils/constants.dart';
import '../components/app_alert.dart';
import '../components/base_view_model.dart';
import '../components/loader.dart';

class AppViewModel extends BaseViewModel {
  final AppRepository repository;

  AppViewModel(this.repository);

  GetIngredientsResponse? getIngredientsResponse;
  GetRecipesResponse? getRecipesResponse;
  String errorMessage = "";
  List<String>? ingredients;
  List<String> selectedIngredients = [];
  List<String> selectedUseBy = [];
  String selectedLunchDate = "";
  bool showFloatingBtn = false;
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
    BuildContext context, {
    Function()? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      setViewState(ViewState.loading);

      var response = await repository.getIngredients();
      getIngredientsResponse = response;

      setViewState(ViewState.success);
      onSuccess!();

      return response;
    } catch (error) {
      setViewState(ViewState.error);
      setError(error.toString());
      onError!(errorMessage.toString());
    }
    return null;
  }

  Future<GetRecipesResponse?> getRecipes(
    BuildContext context, {
    Function(GetRecipesResponse)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      final loader = Loader(context);
      setViewState(ViewState.loading);
      loader.show();

      var response =
      await repository.getRecipes([selectedIngredients.join(", ")]);
      getRecipesResponse = response;

      setViewState(ViewState.success);
      loader.close();
      onSuccess!(response);
      clearSelectedIngredients();

      return response;
    } catch (error) {
      setViewState(ViewState.error);
      setError(error.toString());
      onError!(errorMessage.toString());
    }
    return null;
  }

  void handleItemSelection(
      BuildContext context, String? title, String? useBy, bool isSelected) {
    // Check if useBy date is not expired
    if (useBy != null && !isUseByExpired(useBy)) {
      if (isSelected) {
        selectedIngredients.add(title.toString());
        selectedUseBy.add(useBy);
      } else {
        selectedIngredients.remove(title);
        selectedUseBy.remove(useBy);
      }
    } else {
      // Display a message or handle the case where the useBy date is expired
      AppAlert.show(context,
          message: "The ingredient is expired and cannot be selected.");
      debugPrint("The ingredient is expired and cannot be selected.");
    }

    // Update showFloatingBtn based on whether selectedIngredients is not empty
    showFloatingBtn = selectedIngredients.isNotEmpty;
    debugPrint("Selected title: ${selectedIngredients.join(", ")}");
    debugPrint("Selected useBy: ${selectedUseBy.join(", ")}");

    notifyListeners();
  }

  bool isUseByExpired(String useBy) {
    // Convert useBy string to a DateTime object
    DateTime useByDate = DateTime.parse(useBy);

    // Get the launch date
    DateTime launchDate = DateTime.parse(selectedLunchDate);
    debugPrint("isUseByExpired useByDate: $useByDate");
    debugPrint("isUseByExpired launchDate: $launchDate");
    // Check if the useBy date is before the launch date (expired)
    return useByDate.isBefore(launchDate);
  }

  getLaunchDate() async {
    selectedLunchDate = await sharedPreference.getLaunchDate();
    debugPrint("Lunch Date: $selectedLunchDate");
  }

  /// Clear selected ingredients when "Get Recipes" is pressed
  clearSelectedIngredients() {
    selectedIngredients.clear();
    selectedUseBy.clear();
    showFloatingBtn = false;
  }

}