

import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const RegisterButton({Key key, this.onPressed, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed:()=>onPressed,
      child: Text(text),
    );
  }
}