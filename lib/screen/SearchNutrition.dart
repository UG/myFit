import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sqflite/sqflite.dart';

final keywordProvider =
    StateNotifierProvider<SearchKeyword, String>((_) => SearchKeyword());

class SearchKeyword extends StateNotifier<String> {
  SearchKeyword() : super('input keyword Food Name');
  void setKeyword(arg) {
    state = arg;
  }
}

class SearchNutirition extends HookWidget {
  SearchNutirition({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  void setKeyword(String val) async {
    inputText = val;
    Database db = await openDatabase('Nutrition.db');
    String sql = 'select id,name from Food where name like "%' + val + '%";';
    List<Map> items = await db.rawQuery(sql);
    print(items);
  }

  var inputText = "";
  @override
  Widget build(BuildContext context) {
    useEffect(() {}, const []);
    double screenWidth = MediaQuery.of(context).size.width;
    final title = useProvider(keywordProvider);
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
                    onChanged: setKeyword,
                    decoration: InputDecoration(
                      labelText: '食物名を入力',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  width: screenWidth * .5,
                  child: ElevatedButton(
                    child: const Text('検索', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      context
                          .read(keywordProvider.notifier)
                          .setKeyword(inputText);
                    },
                  ),
                ),
              ]))),
    );
  }
}
