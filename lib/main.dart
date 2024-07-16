import 'package:flutter/material.dart';
import 'package:ui_class1_flupcs1/pages/login.dart';

void main() {
  runApp(const MyApp());//class create object MyApp in the low position||||
}
//flutter visual everything is object
class MyApp extends StatelessWidget {
  const MyApp({super.key});
//override style OOP
  @override
  Widget build(BuildContext context) {
    //return static value is create obj MaterialApp
    return  MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flutter Demo',
      home:   LoginPage(),
    );
  }
}
