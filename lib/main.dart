import 'package:flutter/material.dart';
import 'package:onlineexam_app_v1/presentation/app_theme/app_theme_data.dart';
import 'package:onlineexam_app_v1/presentation/screens/default_screen.dart';
import 'package:onlineexam_app_v1/presentation/screens/login_screen.dart';

import 'di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routeName,
      routes: {
        DefaultScreen.routeName: (_) => const DefaultScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      theme: AppThemeData.lightTheme,
    );
  }
}
