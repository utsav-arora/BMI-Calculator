import 'package:bmi/Components/bottom_button.dart';
import 'package:bmi/Components/card_icon.dart';
import 'package:bmi/Screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/constants.dart';
import 'result_page.dart';
import '../Components/round_icon_button.dart';
import 'package:bmi/Components/calculator_brain.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child : GestureDetector(
                      onTap: (){
                        print('left pressed');
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    child: ReusableCard(
                      colour: (selectedGender == Gender.male)?activeCardColor:inactiveCardColor,
                      cardChild: CardIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                    ),
                  ),
                  Expanded(
                    child : GestureDetector(
                      onTap: (){
                        print('right pressed');
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                    colour: (selectedGender == Gender.female)?activeCardColor:inactiveCardColor,
                        cardChild: CardIcon(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                  ),),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style: numberTextStyle,
                        ),
                        Text('cm',
                        style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFEB1555),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x28EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                    child : Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      inactiveColor: Color(0xFF8E8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                    ),
                  ],
                )
              ),
            ),
            Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: labelTextStyle,
                        ),
                        Text(weight.toString(),
                        style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed: (){
                              setState(() {
                                weight--;
                              });
                                }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: labelTextStyle,
                        ),
                        Text(age.toString(),
                          style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),),
           BottomButton(label: 'Calculate BMI',
               onTap: (){
                CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
             Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
               bmiReading: calc.calculateBMI(),
               textResult: calc.getTextResult(),
               resultInterpretation: calc.getInterpretation(),
             )));
               }
           ),
          ],
        ));
  }
}



