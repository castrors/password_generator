import 'package:flutter/material.dart';
import 'package:password_generator/colors.dart';

class RoundedContainer extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final double height;

  const RoundedContainer(
      {Key key, this.backgroundColor = fieldColor, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          height: height,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              color: backgroundColor),
          child: Center(child: child)),
    );
  }
}
