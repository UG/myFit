import "package:flutter/material.dart";
import 'package:myfit/util/validators.dart';
import '../main.dart';

class BMICalcScreen extends StatefulWidget {
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

String bmiCategorize(String bmi) {
  double b = double.parse(bmi);
  if (b < 18) {
    return "やせすぎ";
  } else if (25 > b && b > 18) {
    return "適正体重";
  } else if (30 > b && b > 25) {
    return "やや肥満";
  } else if (35 > b && b > 30) {
    return "肥満";
  } else {
    return "病的な肥満";
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Center(
          child: Container(
            width: screenWidth * .6,
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
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
                  decoration:
                      InputDecoration(labelText: '身長', suffix: Text("cm")),
                ),
                TextFormField(
                  onChanged: (value) {
                    updateWeight(value);
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return formValidation(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration(labelText: '体重', suffix: Text("kg")),
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            double w = double.parse(weightValue);
                            double h = double.parse(heightValue);
                            double hm = h / 100;
                            double bmiraw = (w / (hm * hm));
                            double aweight = 22 * (hm * hm);
                            avarageWeight = aweight.toStringAsPrecision(4);
                            double diff = double.parse(weightValue) - aweight;
                            if (diff > 0) {
                              bestWeight = "+" + diff.toStringAsPrecision(4);
                              diffColor = Colors.red;
                            } else {
                              bestWeight = diff.toStringAsPrecision(4);
                              diffColor = Colors.blue;
                            }
                            setState(() {
                              bmi = bmiraw.toStringAsPrecision(4);
                              isCalced = true;
                            });
                          }
                        },
                        child: Text("計算する"))),
                isCalced
                    ? Container(
                        height: 70,
                        child: Column(
                          children: [
                            Text('あなたのBMIは'),
                            Text(
                              "$bmi です",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              bmiCategorize(bmi),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 70,
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
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      tableElement(
                          child: Text(
                        "BMI目安",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      tableElement(
                          child: Text(
                        "肥満指標",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('18未満')),
                      tableElement(child: Text('痩せすぎ')),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('20-24')),
                      tableElement(child: Text('適正体重')),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('25-30')),
                      tableElement(child: Text('やや肥満')),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('30-35')),
                      tableElement(child: Text('肥満')),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('35-40')),
                      tableElement(child: Text('重度な肥満')),
                    ]),
                    TableRow(children: [
                      tableElement(child: Text('40+')),
                      tableElement(child: Text('病的な肥満')),
                    ]),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget tableElement({child: Widget}) {
    return Container(
      child: child,
      padding: EdgeInsets.all(5.0),
    );
  }
}
