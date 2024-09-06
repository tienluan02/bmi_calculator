import 'package:flutter/cupertino.dart';
import 'constants.dart';

class CreateContainer extends StatelessWidget {
  const CreateContainer({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardChild,
    );
  }
}

class GenderContent extends StatelessWidget {
  final IconData fontName;
  final String label;

  const GenderContent({
    super.key,
    required this.fontName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        fontName,
        size: kIconSize,
        color: kFontColor,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(label, style: kTextStyleForFonts),
    ]);
  }
}

class IconContent extends StatelessWidget {
  final String label;

  const IconContent({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label, style: kTextStyleForFonts),
    );
  }
}

class CreateGenderContainer extends StatelessWidget {
  const CreateGenderContainer(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
