import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphicInputField extends StatelessWidget {
  const NeumorphicInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: TextField(
        onChanged: (value) {},
        style: const TextStyle(fontSize: 16, color: Colors.white),
        controller: TextEditingController(),
        decoration: const InputDecoration(
            filled: false,
            contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 3),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Enter your name',
            hintStyle: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0XFF1E1E1E),
          ),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
            inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}
