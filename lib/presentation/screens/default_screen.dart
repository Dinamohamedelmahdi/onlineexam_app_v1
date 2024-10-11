import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  static const String routeName = "DefaultScreen";

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("login"),),
      body: Column(
        children: [
Text("you are ")
        ],
      ),

    );
  }
}
