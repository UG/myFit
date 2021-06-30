import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../state/Counter.dart';

class SomeComponent extends HookWidget {
  SomeComponent({Key? key, required this.title}) : super(key: key);
  final String title;
  final count = useProvider(counterProvider);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [Text(title), Text(count.toString())],
      ),
    ));
  }
}
