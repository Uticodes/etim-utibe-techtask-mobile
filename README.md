# Lunch Recipes App

This Flutter app helps users decide what to have for lunch based on the contents of their fridge.

## Features

1. **Lunch Date Input:**
 - Allow the user to input their preferred lunch date.

2. **Fetch Ingredients:**
 - Fetch ingredients from the `ingredients` endpoint.

3. **Ingredient Selection:**
 - Allow the user to choose ingredients from the list.

4. **Handle Expired Ingredients:**
 - Check and handle expired ingredients. if an ingredient use-by is expired based on Selected lunch year, the ingredient will not be selectable.

5. **Fetch Recipes based on Ingredients:**
 - Fetch recipes from the `recipes` endpoint based on chosen ingredients.

6. **Display Recipes and Ingredients:**
 - Display the available recipes and associated ingredients.

## Installation

Ensure you have Flutter SDK installed. For installation instructions, visit [Flutter Install](https://flutter.dev/docs/get-started/install).

Clone the repository:

```bash```
git clone https://github.com/Uticodes/etim-utibe-techtask-mobile.git
cd lunch-recipes-app

## Install dependencies:

- Run ```flutter pub get```

## Build

- Build the Flutter app using ```flutter build apk```

## Testing

- Before running any test case, you have to run: ```flutter pub run build_runner build``` to build some mock classes.
- To run all the test cases (unit and widget tests): Run ```flutter test```

## Usage

Run the app on an emulator/simulator or a connected device: Run ```flutter run```

## Technologies Used:
- MVVM and Clean Architecture pattern
- Provider for state management
- Retrofit with Dio for the Network layer
- flutter_test package for testing
- Mockito for data mocking
- flutter_dotenv for environment variables configurations
- flutter_spinkit for loading indicators
- another_flushbar for error dialog
- flutter_screenutil for screen adaptation


## Screenshots:



## How to use the App:

1. On the welcome screen, you have the option to select a preferred lunch date by clicking on the highlighted input filed, a calender will pop-up, select a date and click on okay. Then click on the 'Proceed' button to move to the next screen.
2. On the Ingredients screen, based on the *lunch date* you selected, the ingredients items maybe be clickable. If the items are selectable; Go ahead and selected the ingredients you need, then click on the 'Get Recipes' buttons to proceed to the next screen. If you can't selects on them, it means they're expired. If you want to chang that; You can go back the the welcome screen and back-date your lunch dates.
3. On the Recipes screen, you can see list of recipes and their ingredients.

## Getting Started with Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
