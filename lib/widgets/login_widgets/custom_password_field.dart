import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomPasswordField extends StatefulWidget {
  final controller;
  final hintText;
  final Color hintColor;
  final Function(String) validator;
  final bool thereIsValidator;

  const CustomPasswordField(
      {this.controller,
      this.hintText,
      this.hintColor = kHintColor,
      this.validator,
      this.thereIsValidator = true});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: kHintColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kHintColor),
          ),
          suffixIcon: IconButton(
            icon: _obscureText
                ? Icon(Icons.visibility, color: kHintColor)
                : Icon(
                    Icons.visibility_off,
                    color: kHintColor,
                  ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )),
      validator: widget.thereIsValidator == null
          // ignore: missing_return
          ? (value) {
              print(value);
            }
          : widget.validator,
    );
  }
}
