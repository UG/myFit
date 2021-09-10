import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final titleProvider = StateNotifierProvider<Title, String>((_) => Title());

class Title extends StateNotifier<String> {
  Title() : super('foo bar buzz');
  //void increment() => state++;
  void setTitle(arg) {
    state = arg;
  }
}

class TitleRiverPod extends HookWidget {
  const TitleRiverPod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = useProvider(titleProvider);

    return Scaffold(
      body: Center(
        child: Text(
          '$title',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(titleProvider.notifier).setTitle('nekoneko'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
