import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/screen/name_input.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class ResultScreen extends StatelessWidget {
  final int age;
  final int weight;
  final double height;
  final GenderName? genderName;
  final double bmiResult;

  const ResultScreen(
      {super.key,
      required this.age,
      required this.weight,
      required this.height,
      required this.genderName,
      required this.bmiResult,
      });

  String greenAnswer(double bmiResult) {
    if (bmiResult < 18.5) {
      return basicAnswer[0];
    } else if (bmiResult < 25) {
      return basicAnswer[1];
    }
    return basicAnswer[2];
  }

  String giveAdvice (double bmiResult) {
    if (bmiResult < 18.5) {
      return advice[0];
    } else if (bmiResult < 25) {
      return advice[1];
    }
    return advice[2];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CreateContainer(
                  colour: kColorContainerUnpressed,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(greenAnswer(bmiResult),
                          style: kResultTextStyle),
                      Text(bmiResult.toString(), style: kBmiResultStyle),
                      const Column(
                        children: [
                          Text('Normal BMI range:', style: kBmiNormal),
                          Text('18,5 - 25 kg/m2', style: kBmiRange),
                        ],
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          giveAdvice(bmiResult), 
                          style: kAdviceStyle),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NameInput();
                  }));
                },
                child: const BottomButton(buttonItem: 'RE-CALCULATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
