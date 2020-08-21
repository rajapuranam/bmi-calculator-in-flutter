import 'dart:math';

import 'package:flutter/cupertino.dart';


class CalculateBMI {
  int height;
  final int weight;

  CalculateBMI({@required this.height, @required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  double _bmi;

  String getBMI() {
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi <= 16)
      return 'Severe  Thinness';
    else if (_bmi > 16 && _bmi <= 17)
      return 'Moderate  Thinness';
    else if (_bmi > 17 && _bmi < 18.5)
      return 'Mild  Thinness';
    else if (_bmi >= 18.5 && _bmi < 25)
      return 'Normal';
    else if (_bmi >= 25 && _bmi < 30)
      return 'Overweight';
    else if (_bmi >= 30 && _bmi < 35)
      return 'Obese  Class  I';
    else if (_bmi > 35 && _bmi <= 40)
      return 'Obese  Class  II';
    else
      return 'Obese  Class  III';
  }
}
