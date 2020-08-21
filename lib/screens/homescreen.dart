import 'package:BMI_Calculator/calculate_bmi.dart';
import 'package:BMI_Calculator/widgets/height.dart';
import 'package:flutter/material.dart';
import 'package:BMI_Calculator/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 22, weight = 57, height = 175;
  bool isMale = false, isFemale = false;

  Widget weightFunc() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(width: 5, color: Colors.white),
        ),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Text('Weight', style: kTitleStyle),
              Text("kg", style: kFadeValuesStyle),
              SizedBox(height: 10),
              Text(weight.toString(), style: kValuesStyle),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    elevation: 3,
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    constraints:
                        BoxConstraints.tightFor(width: 38.0, height: 38.0),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                  ),
                  RawMaterialButton(
                    elevation: 3,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                    constraints:
                        BoxConstraints.tightFor(width: 38.0, height: 38.0),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ageFunc() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(width: 5, color: Colors.white),
        ),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Text('Age', style: kTitleStyle),
              Text("years", style: kFadeValuesStyle),
              SizedBox(height: 10),
              Text(age.toString(), style: kValuesStyle),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    elevation: 3,
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        age--;
                      });
                    },
                    constraints:
                        BoxConstraints.tightFor(width: 38.0, height: 38.0),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                  ),
                  RawMaterialButton(
                    elevation: 3,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                    ),
                    onPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                    constraints:
                        BoxConstraints.tightFor(width: 38.0, height: 38.0),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heightFunc() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(width: 5, color: Colors.white),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text("Height", style: kTitleStyle),
              Text("cm", style: kFadeValuesStyle),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: HeightBackground(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return constraints.isTight
                          ? Container()
                          : HeightSlider(
                              minValue: 120,
                              maxValue: 220,
                              width: constraints.maxWidth,
                              value: height,
                              onChanged: (val) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    height = val;
                                  });
                                });
                              },
                            );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget genderFunc() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = true;
                isFemale = false;
              });
            },
            child: Card(
              elevation: isMale ? 1 : 10,
              margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(width: 5, color: Colors.white),
              ),
              color: Colors.white,
              child: Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.mars,
                        size: 30.0, color: Color(0xff2b2b2b)),
                    SizedBox(width: 10.0),
                    Text('Male', style: kGenderStyle),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = false;
                isFemale = true;
              });
            },
            child: Card(
              elevation: isFemale ? 1 : 10,
              margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(width: 5, color: Colors.white),
              ),
              color: Colors.white,
              child: Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.venus,
                        size: 30.0, color: Color(0xff2b2b2b)),
                    SizedBox(width: 10.0),
                    Text('Female', style: kGenderStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget calculateFunc() {
    return RaisedButton(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      onPressed: () {
        _showResult();
      },
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
        child: Text('Calculate'.toUpperCase(), style: kCalcStyle),
      ),
    );
  }

  void _showResult() {
    var _bmi;
    CalculateBMI obj = CalculateBMI(height: height, weight: weight);
    _bmi = obj.getBMI();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: _bmi.toString().split('.')[0],
                    style: kBMI1,
                    children: <TextSpan>[
                      TextSpan(
                        text: '.' + _bmi.toString().split('.')[1],
                        style: kBMI2,
                      )
                    ],
                  ),
                ),
                Text(obj.getResult(), style: kBMIResult),
                SizedBox(height: 20),
                Text('Normal BMI range: \n18.5 kg/m\u00B2 - 25 kg/m\u00B2',
                    style: kBasicStyle, textAlign: TextAlign.center),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      elevation: 5,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      onPressed: () {
                        // Logic to save result
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 5),
                        child: Text(
                          'Save'.toUpperCase(),
                          style: kCalcStyle.copyWith(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    RaisedButton(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      onPressed: () {
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 5),
                        child: Text(
                          'Share'.toUpperCase(),
                          style: kCalcStyle.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontFamily: 'ArvoBold',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'BMI   Calculator',
          style: kAppBarStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                genderFunc(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: ageFunc()),
                    Expanded(child: weightFunc()),
                  ],
                ),
                SizedBox(height: 10),
                Container(height: 200, child: heightFunc()),
                SizedBox(height: 10),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 180),
                Positioned(
                  bottom: 0,
                  child: ClipPath(
                    clipper: OvalTopBorderClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  child: calculateFunc(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
