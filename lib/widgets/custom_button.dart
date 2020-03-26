import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Key buttonKey;
  final String text;
  final bool isEnabled;
  final Function onTap;

  const CustomButton({
    Key key,
    this.buttonKey,
    this.text,
    this.isEnabled,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      key: buttonKey,
      child: Text(text),
      onPressed: isEnabled ? onTap : null,
    );
  }
}
