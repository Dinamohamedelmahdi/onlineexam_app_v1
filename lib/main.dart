import 'package:flutter/material.dart';
import 'package:onlineexam_app_v1/di.dart';
import 'package:onlineexam_app_v1/presentation/login/loginscreen.dart';

void main() {
configureDependencies();
runApp(MaterialApp(
  home: LoginScreen(),

));
}
