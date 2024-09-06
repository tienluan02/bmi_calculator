import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.child, this.onPress});

  final IconData? child;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: CircleBorder(),
        elevation: 6.0,
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),
        onPressed: onPress,
    child: Icon(child),);
  }
}
