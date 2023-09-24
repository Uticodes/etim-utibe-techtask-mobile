import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/presentation/select_lunch_date/select_lunch_date.dart';
import 'package:tech_task/routes/locator.dart';


void main() {

  setUp(() {
    dependenciesInjector();
  });

  testWidgets('SelectLaunchDate UI test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ScreenUtilInit(
      designSize: Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          home: SelectLaunchDate()),
    ));

    // Wait for the widgets to settle.
    await tester.pumpAndSettle();

    // Verify if the "Welcome!" text is displayed.
    expect(find.text('Welcome! 👋'), findsOneWidget);
    expect(find.text("You may select a preferred lunch date if not today."), findsOneWidget);

    // Verify if the "Select lunch date" text field is displayed.
    expect(find.byType(TextField), findsOneWidget);

    // Tap on the "Select lunch date" text field to open the date picker.
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Verify if the date picker is displayed.
    expect(find.byType(Dialog), findsOneWidget);

    // Close the date picker dialog.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Simulate tapping the "Proceed" button
    await tester.tap(find.text('Proceed'));

  });
}