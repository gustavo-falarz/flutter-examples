import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight.';
    } else if (_bmi >= 18.5) {
      return 'You have normal body weight.';
    } else {
      return 'You have lower than normal body weight.';
    }
  }
}
