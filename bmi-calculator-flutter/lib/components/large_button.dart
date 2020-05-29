import 'package:flutter/material.dart';

import '../constants.dart';

class LargeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  LargeButton({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        color: buttonColor,
        width: double.infinity,
        height: buttonHeight,
        child: Center(
          child: Text(
            this.label,
            style: largeButtonLabelStyle,
          ),
        ),
      ),
    );
  }
}
