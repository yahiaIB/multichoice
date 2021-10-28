import 'package:flutter/material.dart';
import 'package:multichoice/styles/custom_colors.dart';

class Button extends StatelessWidget {
  const Button(this.text, this.onPress, {Key? key}) : super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 50,
      minWidth: double.infinity,
      onPressed: () => onPress(),
      color: CustomColors.buttonColor,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
