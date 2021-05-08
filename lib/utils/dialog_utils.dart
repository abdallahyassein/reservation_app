import 'package:flutter/material.dart';
import 'package:reservation_app/widgets/dialog/simple_dialog_message.dart';

Future showSimpleMessageDialog(BuildContext context, String message,
    String buttonName, Function func) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialogMessage(message, buttonName, func);
      });
}
