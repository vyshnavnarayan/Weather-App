import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/my_themes.dart';
import 'package:weather/weather/view/weather_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: CustomThemes.lightTheme,
        darkTheme: CustomThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: const Weather());
  }
}
