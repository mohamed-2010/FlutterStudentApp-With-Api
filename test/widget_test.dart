// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mrstudentapp/main.dart';
import 'package:mrstudentapp/presentation/screens/home.dart';
import 'package:mrstudentapp/presentation/screens/login.dart';
import 'package:mrstudentapp/presentation/screens/on_boarding.dart';
import 'package:mrstudentapp/shered/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final prefs = await SharedPreferences.getInstance();
    final bool? seen = prefs.getBool('seen');
    final Widget widget;
    final String token = prefs.getString('token').toString();
    if(seen != null && seen != false){
      if(token != null && token != ''){
        widget = HomeScreen();
      }else{
        widget = LoginScreen();
      }
    }else{
      widget = OnboardingPage();
    }
    await tester.pumpWidget(MyApp(
      seen: seen, widget: widget, approute: AppRoute(),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
