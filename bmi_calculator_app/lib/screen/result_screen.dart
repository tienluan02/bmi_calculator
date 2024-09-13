import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/screen/name_input.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class ResultScreen extends StatelessWidget {

  final int age;
  final int weight;
  final double height;
  final GenderName? genderName;

  const ResultScreen(
      {super.key,
      required this.age,
      required this.weight,
      required this.height,
      required this.genderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Expanded(
                flex: 5,
                child: CreateContainer(
                  colour: kColorContainerUnpressed,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('àdasf', style: kResultTextStyle),
                      Text('13241234', style: kBmiResultStyle),
                      Text(
                          textAlign: TextAlign.center,
                          'you will need a medical treatment', style: kAdviceStyle),
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
