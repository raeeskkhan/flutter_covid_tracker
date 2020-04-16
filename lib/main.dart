import 'package:flutter/material.dart';
import 'package:fluttercovidtrackercomplex/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "COVID19 TRACKER",
      home: HomePage(),
    );
  }
}

