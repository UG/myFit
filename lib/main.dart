import 'package:flutter/material.dart';
import './screen/BMICalcScreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fit',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('My Fit Home')),
        body: BMICalcScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
