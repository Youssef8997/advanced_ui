import 'package:advanced_ui/utls/theme/light_theme.dart';
import 'package:advanced_ui/views/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
