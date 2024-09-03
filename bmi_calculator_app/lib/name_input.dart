import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80;
const colorContainerUnpressed = Color(0xFF1D1E33);
const colorContainerPressed = Color(0xFF111328);
const colorBottomContainer = Color(0xFFBE1555);
enum GenderName {male, female}

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  Color maleCardColor = colorContainerUnpressed;
  Color femaleCardColor = colorContainerUnpressed;

  void updateColor(GenderName gender) {
    if (gender == GenderName.male) {
      if (maleCardColor == colorContainerUnpressed) {
        maleCardColor = colorContainerPressed;
        femaleCardColor = colorContainerUnpressed;
      }
    } else {
      if (femaleCardColor == colorContainerUnpressed) {
        femaleCardColor = colorContainerPressed;
        maleCardColor = colorContainerUnpressed;
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
                      child: CreateGenderContainer(
                        onPress: () {
                          setState(() {
                            updateColor(GenderName.male);
                          });
                        },
                        colour: maleCardColor,
                        cardChild: IconContent(fontName: FontAwesomeIcons.mars, label: 'Male'),
                      ),
                    ),
                    Expanded(
                      child: CreateGenderContainer(
                        onPress: () {
                          setState(() {
                            updateColor(GenderName.female);
                          });
                        },
                        colour: femaleCardColor,
                        cardChild: IconContent(fontName: FontAwesomeIcons.venus, label: 'Female'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CreateContainer(
                  colour: colorContainerUnpressed,
                  cardChild: Icon(FontAwesomeIcons.person),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerUnpressed,
                        cardChild: Icon(FontAwesomeIcons.person),
                      ),
                    ),
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerUnpressed,
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

