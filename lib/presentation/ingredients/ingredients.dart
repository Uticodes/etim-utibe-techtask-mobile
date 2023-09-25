import 'package:flutter/material.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../data/core/enum/view_state.dart';
import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../components/app_alert.dart';
import '../components/base_view.dart';
import '../components/custom_app_bar.dart';
import '../components/loader.dart';
import '../components/progress_loader.dart';
import '../recipes/recipes.dart';
import '../view_model/app_view_model.dart';
import 'ingredient_item.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      onModelReady: (model) {
        model.getIngredients(context,
            onSuccess: () {
              model.getLaunchDate();
            },
            onError: (error) =>
                AppAlert.show(context, message: error, success: false));
      },
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
          context,
          headerTitle: 'Ingredients',
          onTap: () {
            navigationService.goBack();
          },
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextView.getAppTextViewBold(
                    "Select Recipes to get an ingredients",
                    size: AppFontSizes.fontSize16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              child: model.viewState == ViewState.loading
                  ? model.showFloatingBtn
                      ? null
                      : const Expanded(
                          child: ProgressLoader(
                          allowBackButton: false,
                        ))
                  : model.getIngredientsResponse?.ingredients != null
                      ? SizedBox(
                          height: context.getHeight(),
                          child: ListView.builder(
                              itemCount: model
                                  .getIngredientsResponse?.ingredients.length,
                              itemBuilder: (context, index) {
                                var ingredients = model
                                    .getIngredientsResponse?.ingredients[index];
                                String? title = ingredients
                                    ?.title; // get title for this index;
                                String? useBy = ingredients
                                    ?.useBy; // get date for this index;
                                bool isSelected =
                                    model.selectedIngredients.contains(title) &&
                                        model.selectedUseBy.contains(useBy);

                                return IngredientItem(
                                  title: title,
                                  useBy: useBy,
                                  isSelected: isSelected,
                                  onItemSelect: (bool selected) {
                                    model.handleItemSelection(
                                        context, title, useBy, selected);
                                  },
                                );
                              }),
                        )
                      : const SizedBox.shrink(),
            ),
            40.0.sbH,
          ],
        )),
        floatingActionButton: model.showFloatingBtn
            ? FloatingActionButton.extended(
                backgroundColor: AppColors.jade,
                onPressed: () {
                  model.getRecipes(context, onSuccess: (response) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipesScreen(
                                  getRecipesResponse: response,
                                )));
                  }, onError: (error) {
                    Loader(context).close();
                    AppAlert.show(context, message: error, success: false);
                  });
                },
                label: SizedBox(
                  width: 100,
                  child: AppTextView.getAppTextViewBold("Get Recipes",
                      size: AppFontSizes.fontSize16, color: AppColors.white),
                ),
              )
            : null,
      ),
    );
  }
}
