// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/my_app.dart';
import 'package:task_manager_app/view/home_screen/home_screen.dart';

void main() {
  testWidgets('Add Task Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the home screen is displayed
    expect(find.byType(HomeScreen), findsOneWidget);

    // Tap on the Add floating action button
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the dialog is displayed
    expect(find.text('Add New Task'), findsOneWidget);

    // Enter data into the title field
    expect(find.widgetWithText(TextFormField, 'Title'), findsOneWidget);
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Title'), 'Test Title');

    expect(find.widgetWithText(TextFormField, 'Details'), findsOneWidget);
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Details'), 'Test Details');

    // Tap on the add button
    await tester.tap(find.widgetWithText(TextButton, 'Add'));
    // On Add button Tap add new item to the List
    await tester.pumpAndSettle();
  });
}
