import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80;
const colorContainerValue = Color(0xFF1D1E33);
const colorBottomContainer = Color(0xFFBE1555);

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
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
                      child: CreateContainer(
                          colour: colorContainerValue,
                        cardChild: Icon(
                            FontAwesomeIcons.tractor),
                      ),
                    ),
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerValue,
                        cardChild: Icon(
                            FontAwesomeIcons.tractor),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CreateContainer(
                  colour: colorContainerValue,
                  cardChild: Icon(
                      FontAwesomeIcons.person),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerValue,
                        cardChild: Icon(
                            FontAwesomeIcons.person),
                      ),
                    ),
                    Expanded(
                      child: CreateContainer(
                        colour: colorContainerValue,
                        cardChild: Icon(
                            FontAwesomeIcons.person),
                      ),
                    ),
                  ],
                ),
              ), Container(
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
