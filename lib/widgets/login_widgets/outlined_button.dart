import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  final width;
  final height;
  final fontSize;
  final textColor;
  final outLinedColor;
  const CustomOutlinedButton(
      {this.buttonTitle,
      this.onTap,
      this.width,
      this.height,
      this.fontSize,
      this.textColor,
      this.outLinedColor = kOrangeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(side: BorderSide(color: outLinedColor)),
        child: new Text(
          buttonTitle,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
        onPressed: onTap,
      ),
    );
  }
}
