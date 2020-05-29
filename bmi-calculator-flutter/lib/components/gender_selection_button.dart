import 'package:flutter/material.dart';

import '../constants.dart';


class GenderSelectionButton extends StatelessWidget {
  const GenderSelectionButton({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: genderIconSize,
        ),
        SizedBox(
          height: genderButtonSpacing,
        ),
        Text(
          label,
          style: thinLabelStyle,
        ),
      ],
    );
  }
}
