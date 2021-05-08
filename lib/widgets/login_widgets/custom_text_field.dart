import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final hintText;
  final Color hintColor;
  final Function(String) validator;
  final bool thereIsValidator;

  const CustomTextField(
      {this.controller,
      this.hintText,
      this.hintColor = kHintColor,
      this.validator,
      this.thereIsValidator = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kHintColor),
        ),
      ),
      validator: thereIsValidator == null
          // ignore: missing_return
          ? (value) {
              print(value);
            }
          : validator,
    );
  }
}
