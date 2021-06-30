import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../state/Counter.dart';
import '../component/someComponent.dart';

class CounterProvider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final count = useProvider(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SomeComponent(title: 'piyo')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
