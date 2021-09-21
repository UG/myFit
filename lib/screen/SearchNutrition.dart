import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sqflite/sqflite.dart';

final keywordProvider =
    StateNotifierProvider<SearchKeyword, String>((_) => SearchKeyword());
final keywordOptionProvider =
    StateNotifierProvider<KeywordOption, List<String>>((_) => KeywordOption());

class KeywordOption extends StateNotifier<List<String>> {
  KeywordOption() : super([]);
  void setOption(opt) {
    state = opt;
  }
}

class SearchKeyword extends StateNotifier<String> {
  SearchKeyword() : super('input Food Name');
  void setKeyword(arg) {
    state = arg;
  }
}

class SearchNutirition extends HookWidget {
  SearchNutirition({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  void setKeyword(String val) async {
    final Database db = await database;
    String sql = 'select id,name from Food where name like "%' + val + '%";';
    List<Map> food = await db.rawQuery(sql);
  }

  final Future<Database> database = openDatabase('Nutrition.db');

  var inputText = "";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String title = useProvider(keywordProvider);
    List<String> keyOption = useProvider(keywordOptionProvider);

    void getFullKeyWord() async {
      final Database db = await database;
      String sql = 'select name from Food;';
      List food = await db.rawQuery(sql);
      List<String> options = food.map((obj) => obj['name'].toString()).toList();
      context.read(keywordOptionProvider.notifier).setOption(options);
    }

    useEffect(() {
      getFullKeyWord();
    }, []);
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
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable.empty();
                      }
                      print(keyOption.length);
                      return keyOption.where((obj) {
                        return obj.contains(textEditingValue.text);
                      });
                    },
                    /** 
                    onChanged: setKeyword,
                    decoration: InputDecoration(
                      labelText: '食物名を入力',
                      border: OutlineInputBorder(),
                    ),
                    */
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
