import 'package:flutter/material.dart';

const double  kLabelSize = 30;
const double kIconSize = 80;

const List<String> basicAnswer = [
  'Lightweight',
  'Normal',
  'Overweight',
];

const List<String> advice = [
  'you will need to eat more',
  'you are ready to go my friend !',
  'you will need to do some exercises'
];

const double kBottomContainerHeight = 80;
const kFontColor = Color(0xFF8D8E98);
const kColorContainerUnpressed = Color(0xFF1D1E33);
const kColorContainerPressed = Color(0xFF111328);
const kColorBottomContainer = Color(0xFFBE1555);
const kBackgroundColor = Color(0xFF0A0E21);
const kInactiveColorHeight = Color(0xFF8D8E98);
enum GenderName {male, female}

const kTextStyleForFonts = TextStyle(
fontSize: kLabelSize,
fontWeight: FontWeight.bold,
color: kFontColor,
);

const kTextStyleForCm = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
  color: Colors.white,
);

const kResultTextStyle = TextStyle(
color: Color(0xFF24D876),
fontWeight: FontWeight.bold,
fontSize: 22,
);

const kBmiResultStyle = TextStyle(
  color: Colors.white,
  fontSize: 60,
  fontWeight: FontWeight.bold,
);

const kAdviceStyle = TextStyle(
  color: Colors.white,
  fontSize: 30,
);

const kBmiNormal = TextStyle(
  color: kFontColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kBmiRange = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white,
);

class BottomButton extends StatelessWidget {
  final String buttonItem;
  const BottomButton({super.key, required this.buttonItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorBottomContainer,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: Center(
          child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(buttonItem, style: kTextStyleForFonts))),
    );
  }
}
