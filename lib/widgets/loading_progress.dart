import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';

class LoadingProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(kOrangeColor),
    ));
  }
}
