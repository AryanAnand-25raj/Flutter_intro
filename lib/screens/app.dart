import 'package:aryan_first_project/screens/my_home_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // const is uswed to denote the key value pair
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "Hello World", home: MyhomeScreen());
  }
}
