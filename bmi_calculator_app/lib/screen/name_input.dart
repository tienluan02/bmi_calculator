import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
import '../components/round_icon_button.dart';
import 'result_screen.dart';

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  Color maleCardColor = kColorContainerUnpressed;
  Color femaleCardColor = kColorContainerUnpressed;
  int height = 180;
  int weight = 60;
  int age = 20;
  GenderName? gender;

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

  double calculateBMI(double weight, double height) {
    return ((weight/((height/100)*(height/100))).toInt()).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
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
                    child: CreateContainer(
                      onPress: () {
                        setState(
                          () {
                            updateColor(GenderName.male);
                            gender = GenderName.male;
                          },
                        );
                      },
                      colour: maleCardColor,
                      cardChild: const GenderContent(
                          fontName: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: CreateContainer(
                      onPress: () {
                        setState(
                          () {
                            updateColor(GenderName.female);
                            gender = GenderName.female;
                          },
                        );
                      },
                      colour: femaleCardColor,
                      cardChild: const GenderContent(
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
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: kFontColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTextStyleForCm),
                        const Text(
                          'cm',
                          style: kTextStyleForFonts,
                        ),
                      ],
                    ),
                    Slider(
                        activeColor: Colors.white,
                        inactiveColor: kInactiveColorHeight,
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const IconContent(
                            label: 'Weight',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: kTextStyleForCm),
                              const Text(
                                'kg',
                                style: kTextStyleForFonts,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CreateContainer(
                      colour: kColorContainerUnpressed,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const IconContent(label: 'Age'),
                          Center(
                              child:
                                  Text(age.toString(), style: kTextStyleForCm)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundIconButton(
                                child: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                child: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResultScreen(
                  age: age,
                  weight: weight,
                  height: height.toDouble(),
                  genderName: gender,
                  bmiResult: calculateBMI(weight.toDouble(), height.toDouble()),
                );
              },
            ),
          );
        },
        child: const BottomButton(buttonItem: 'CALCULATE'),
      ),
    );
  }
}
