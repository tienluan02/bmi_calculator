import 'package:flutter/material.dart';
import 'ReuseableCard.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
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
                      child: CreateContainer(colour: Color(0xFF0A0E21)),
                    ),
                    Expanded(
                      child: CreateContainer(colour: Color(0xFF0A0E21)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CreateContainer(colour: Color(0xFF0A0E21)),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CreateContainer(colour: Color(0xFF0A0E21)),
                    ),
                    Expanded(
                      child: CreateContainer(colour: Color(0xFF0A0E21)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
