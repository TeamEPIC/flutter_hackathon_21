import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function validator;
  final Function onSaved;
  final TextEditingController controller;

  const AuthTextFormField(
      {this.hintText,
      this.labelText,
      this.validator,
      this.onSaved,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15.0),
        ),
        //validator: (value) => validator,
        onSaved: (newValue) => onSaved,
        controller: controller,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
