import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/data/core/enum/view_state.dart';
import 'package:tech_task/presentation/view_model/app_view_model.dart';

import '../mocks/remote.mocks.dart';
import '../mocks/response.dart';
import '../mocks/sharedpreference.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

@GenerateMocks([
  Dio,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppViewModel viewModel;
  MockBuildContext mockContext = MockBuildContext();
  late MockSharedPreferences mockSharedPreferences;
  MockAppRepository mockAppRepository = MockAppRepository();

  setUp(() {
    viewModel = AppViewModel(mockAppRepository);
    mockSharedPreferences = MockSharedPreferences();
  });

  group("Ingredients", () {
    test("Check if ingredients list is empty", () async {
      // Mock the response payload
      final responsePayload = mockEmptyIngredientsResponse();

      // Mock the repository response
      when(mockAppRepository.getIngredients()).thenAnswer((_) async {
        return responsePayload;
      });

      // Call the function to get ingredients
      await viewModel.getIngredients(
        mockContext,
        onSuccess: () {},
        onError: (error) => debugPrint("Test Error: $error"),
      );

      // // Expect that the view state is success
      expect(viewModel.viewState, ViewState.success);

      // Expect that the ingredients list is empty
      expect(viewModel.getIngredientsResponse?.ingredients, isEmpty);
    });

    test("Check if ingredients list is not empty", () async {
      // Mock the response payload
      final responsePayload = mockIngredientsResponse();

      // Mock the repository response
      when(mockAppRepository.getIngredients()).thenAnswer((_) async {
        return responsePayload;
      });

      // Call the function to get ingredients
      await viewModel.getIngredients(
        mockContext,
        onSuccess: () {},
        onError: (error) => debugPrint("Test Error: $error"),
      );

      // Expect that the view state is success
      expect(viewModel.viewState, ViewState.success);

      // Expect that the ingredients list is not empty
      expect(viewModel.getIngredientsResponse?.ingredients, isNotEmpty);

    });

    test("Check if error response", () async {
      // Mock the error response payload
      final errorResponsePayload = mockErrorIngredientsResponse();  // Set this to the error payload you want to mock

      // Mock the repository response to return an error
      when(mockAppRepository.getIngredients().onError((error, stackTrace) => errorResponsePayload)).thenAnswer((_) async {
        throw errorResponsePayload;
      });

      // Call the function to get ingredients
      await viewModel.getIngredients(
        mockContext,
        onSuccess: () {},
        onError: (error) => debugPrint("Test Error: $error"),
      );

      // Expect that the view state is error
      expect(viewModel.viewState, ViewState.error);

      // Expect that the ingredients list is empty (as it's an error response)
      expect(viewModel.getIngredientsResponse?.ingredients, null);
    });

  });
}
