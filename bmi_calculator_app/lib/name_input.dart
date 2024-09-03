import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  Color maleCardColor = kColorContainerUnpressed;
  Color femaleCardColor = kColorContainerUnpressed;
  int height = 180;

  void updateColor(GenderName gender) {
    if (gender == GenderName.male) {
      if (maleCardColor == kColorContainerUnpressed) {
        maleCardColor = kColorContainerPressed;
        femaleCardColor = kColorContainerUnpressed;
      }
    } else {
      if (femaleCardColor == kColorContainerUnpressed) {
        femaleCardColor = kColorContainerPressed;
        maleCardColor = kColorContainerUnpressed;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        cardChild: GenderContent(
                            fontName: FontAwesomeIcons.mars, label: 'Male'),
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
                        cardChild: GenderContent(
                            fontName: FontAwesomeIcons.venus, label: 'Female'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CreateContainer(
                  colour: kColorContainerUnpressed,
                  cardChild: Column(
                    children: [
                      IconContent(label: 'Height'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kTextStyleForCm),
                          Text(
                            'cm',
                            style: kTextStyleForFonts,
                          ),
                        ],
                      ),
                      Slider(
                          activeColor: kColorBottomContainer,
                          inactiveColor: Color(0xFF8D8E98),
                          min: 120.0,
                          max: 220.0,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          })
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CreateContainer(
                        colour: kColorContainerUnpressed,
                        cardChild: Icon(FontAwesomeIcons.person),
                      ),
                    ),
                    Expanded(
                      child: CreateContainer(
                        colour: kColorContainerUnpressed,
                        cardChild: Icon(FontAwesomeIcons.person),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: kColorBottomContainer,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: kBottomContainerHeight,
              )
            ],
          ),
        ));
  }
}
