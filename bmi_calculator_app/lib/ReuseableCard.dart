import 'package:flutter/cupertino.dart';

class CreateContainer extends StatelessWidget {
  CreateContainer({required this.colour});

  Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ));
  }
}
