import 'dart:math';



class CalculatorBrain {
  final height;
  final weight;

  CalculatorBrain({required this.weight, required this.height});

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getTextResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if(_bmi >18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'Cut off some Calories from your meal and workout more!';
    else if(_bmi >18.5)
      return 'Going Good Take balanced diet plan and continue with the workout!';
    else
      return 'Take more calories in your diet add some carbohydrate rich meals in your diet!';
  }

}