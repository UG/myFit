import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final titleProvider = StateNotifierProvider<Title, String>((_) => Title());

class Title extends StateNotifier<String> {
  Title() : super('foo bar buzz');
  void setTitle(arg) {
    state = arg;
  }
}

class TitleRiverPod extends HookWidget {
  TitleRiverPod({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  void setTitle(val) {
    inputText = val;
  }

  var inputText = "";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final title = useProvider(titleProvider);
    return Scaffold(
      body: Center(
          child: Container(
              width: screenWidth * 0.9,
              child: Column(children: [
                SizedBox(height: 20),
                Center(
                    child: Container(
                        child: Text('$title',
                            style: TextStyle(
                              fontSize: 40,
                            )))),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: setTitle,
                    decoration: InputDecoration(
                      labelText: '入力文字',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  width: screenWidth * .5,
                  child: ElevatedButton(
                    child: const Text('文字変更', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      context.read(titleProvider.notifier).setTitle(inputText);
                    },
                  ),
                ),
              ]))),
    );
  }
}
