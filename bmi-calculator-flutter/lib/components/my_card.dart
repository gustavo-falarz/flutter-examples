import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  MyCard({this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

enum Gender {
  MALE,
  FEMALE,
}
