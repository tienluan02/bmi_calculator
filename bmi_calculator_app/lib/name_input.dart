import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80;
const colorContainerValue = Color(0xFF1D1E33);
const colorContainerPressed = Color(0xFF111328);
const colorBottomContainer = Color(0xFFBE1555);
enum GenderName {male, female}

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  Color maleCardColor = colorContainerValue;
  Color femaleCardColor = colorContainerValue;

  void updateColor(GenderName gender) {
    if (gender == GenderName.male) {
      if (maleCardColor == colorContainerValue) {
        maleCardColor = colorContainerPressed;
        femaleCardColor = colorContainerValue;
      }
    } else {
      if (femaleCardColor == colorContainerValue) {
        femaleCardColor = colorContainerPressed;
        maleCardColor = colorContainerValue;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateColor(GenderName.male);
                          });
                        },
                        child: CreateContainer(
                          colour: maleCardColor,
                          cardChild: IconContent(fontName: FontAwesomeIcons.mars, label: 'Male'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateColor(GenderName.female);
                          });
                        },
                        child: CreateContainer(
                          colour: femaleCardColor,
                          cardChild: IconContent(fontName: FontAwesomeIcons.venus, label: 'Female'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CreateContainer(
                  colour: colorContainerValue,
                  cardChild: Icon(FontAwesomeIcons.person),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerValue,
                        cardChild: Icon(FontAwesomeIcons.person),
                      ),
                    ),
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerValue,
                        cardChild: Icon(FontAwesomeIcons.person),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: colorBottomContainer,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: bottomContainerHeight,
              )
            ],
          ),
        ));
  }
}

