import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen.dart';

void main() {
  runApp(MyApp());
  debugPrint('hi');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFE6BA95)),
    );
  }
}
