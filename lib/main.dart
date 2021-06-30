import 'package:flutter/material.dart';
//import './screen/BMICalcScreen.dart';
import './screen/CounterProvider.dart';
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
      //home: BMICalcScreen(title: 'My Fit'),
      home: CounterProvider(),
      debugShowCheckedModeBanner: false,
    );
  }
}
