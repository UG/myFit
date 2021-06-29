import 'package:flutter/material.dart';
import './screen/BMICalcScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fit',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BMICalcScreen(title: 'My Fit'),
      debugShowCheckedModeBanner: false,
    );
  }
}
