import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/login_widgets/custom_button.dart';

class SimpleDialogMessage extends StatelessWidget {
  final String message;
  final String buttonName;
  final Function onTap;
  SimpleDialogMessage(this.message, this.buttonName, this.onTap);
  dialogContent(BuildContext context) {
    return Container(
      width: setWidth(context, 0.8),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 2, left: 2),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kDarkGreyColor,
                      fontSize: setWidth(context, k16TextSize)),
                ),
              ),
              SizedBox(
                height: getSize(context).height * 0.025,
              ),
              CustomButton(
                  width: setWidth(context, 0.3),
                  height: setHeight(context, 0.06),
                  color: kOrangeColor,
                  buttonText: "Ok",
                  fontSize: getSize(context).width * k18TextSize,
                  onTap: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: getSize(context).height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
