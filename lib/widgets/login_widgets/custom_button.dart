import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final width;
  final height;
  final color;
  final buttonText;
  final fontSize;
  final onTap;

  const CustomButton(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.buttonText,
      this.fontSize,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
