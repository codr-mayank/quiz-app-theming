import 'package:flutter/material.dart';
import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.amberAccent.shade100,
      backgroundColor: Colors.amber,
      textTheme: TextTheme(body1: TextStyle(fontSize: 16, color: Colors.grey[900])));
}

void main() {
  return runApp(new MaterialApp(
    theme: _appTheme,
    home: QuizApp(),
  ));
}
