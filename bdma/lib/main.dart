import 'package:bdma/scene/login.dart';
import 'package:bdma/scene/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        cursorColor: Color(0xFFF0730F),
        primarySwatch: Colors.blue,
      ),
      home: Splashscreen(),
    );
  }
}
