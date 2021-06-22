import 'package:bmi/Components/bottom_button.dart';
import 'package:bmi/Components/constants.dart';
import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';

class ResultPage extends StatelessWidget {

  final String bmiReading;
  final String textResult;
  final String resultInterpretation;

  ResultPage({required this.bmiReading , required this.resultInterpretation , required this.textResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30.0),
        child : Text('YOUR RESULT',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
          ),
            ),
          ),
          Expanded(
              flex: 5,
              child:ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(textResult.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D876),
                    ),),
                    Text(bmiReading,
                      style: TextStyle(
                        fontSize: 90.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(resultInterpretation,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(label: 'RE-CALCULATE',
              onTap: (){Navigator.pop(context);}
          ),
        ],
      ),
    );
  }
}
