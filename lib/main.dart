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
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
      headline: base.headline.copyWith(fontWeight: FontWeight.w500),
      title: base.title.copyWith(fontSize: 18.0),
      caption:
          base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      button: base.button.copyWith(letterSpacing: 3.0, fontSize: 14),
      body1: base.body1.copyWith(
          fontSize: 16, color: Colors.grey[900], fontFamily: 'Lobster_Two'));
}

void main() {
  return runApp(new MaterialApp(
    theme: _appTheme,
    home: QuizApp(),
  ));
}
