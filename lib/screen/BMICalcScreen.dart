import "package:flutter/material.dart";
import 'package:myfit/util/validators.dart';

class BMICalcScreen extends StatefulWidget {
  BMICalcScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  BMICalcState createState() => BMICalcState();
}

var heightValue = "";
var weightValue = "";
var isCalced = false;
var bmi = "";
var avarageWeight = "---";
var bestWeight = "---";
var diffColor = Colors.green;

RegExp numberRegEx = new RegExp("[0-9]{4}");
formValidation(var value) {
  String v = value.toString();
  if (v.isNull || v.isEmpty) {
    return "必須項目が入力されていません";
  } else if (!v.isNumber) {
    return "半角数値のみ扱えます";
  } else if (v.length > 5) {
    return "5桁以上は扱えません";
  } else {
    return null;
  }
}

class BMICalcState extends State<BMICalcScreen> {
  void updateHeight(String v) {
    setState(() {
      heightValue = v;
    });
  }

  void updateWeight(String v) {
    setState(() {
      weightValue = v;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final _heightKey = GlobalKey<FormState>();
  final _weightKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 計算機'),
      ),
      body: Center(
        child: Container(
            width: screenWidth * 0.9,
            child: Column(
              children: [
                Text('height :' + screenHeight.toString()),
                Text('width :' + screenWidth.toString()),
                Container(height: 50),
                Text(
                  'BMI計算機',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: screenWidth * .6,
                    child: Column(children: [
                      TextFormField(
                        key: _heightKey,
                        onChanged: (value) {
                          updateHeight(value);
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return formValidation(value);
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            labelText: '身長', suffix: Text("cm")),
                      ),
                      TextFormField(
                        key: _weightKey,
                        onChanged: (value) {
                          updateWeight(value);
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return formValidation(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            labelText: '体重', suffix: Text("kg")),
                      ),
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                double w = double.parse(weightValue);
                                double h = double.parse(heightValue);
                                double hm = h / 100;
                                double bmiraw = (w / (hm * hm));
                                double aweight = 22 * (hm * hm);
                                avarageWeight = aweight.toStringAsPrecision(4);
                                double diff =
                                    double.parse(weightValue) - aweight;
                                if (diff > 0) {
                                  bestWeight =
                                      "+" + diff.toStringAsPrecision(4);
                                  diffColor = Colors.red;
                                } else {
                                  bestWeight = diff.toStringAsPrecision(4);
                                  diffColor = Colors.blue;
                                }
                                setState(() {
                                  bmi = bmiraw.toStringAsPrecision(4);
                                  isCalced = true;
                                });
                              },
                              child: Text("計算する"))),
                      isCalced
                          ? Container(
                              height: 80,
                              child: Column(
                                children: [
                                  Text('あなたのBMIは'),
                                  Text("$bmi です"),
                                ],
                              ),
                            )
                          : Container(
                              height: 80,
                            ),
                      Text('推奨BMI: 22'),
                      Text("推奨BMIの体重：$avarageWeight kg"),
                      Row(
                        children: [
                          Text('推奨体重の目標との差異：'),
                          Text(
                            "$bestWeight kg",
                            style: TextStyle(color: diffColor),
                          ),
                        ],
                      ),
                    ])),
              ],
            )),
      ),
    );
  }
}
