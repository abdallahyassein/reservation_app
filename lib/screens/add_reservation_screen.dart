import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';

class AddReservationScreen extends StatefulWidget {
  @override
  _AddReservationScreenState createState() => _AddReservationScreenState();
}

class _AddReservationScreenState extends State<AddReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Reservation",
          style: TextStyle(
              color: kDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontSize: setWidth(context, k22TextSize)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: kDarkGreyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_alert,
                size: setWidth(context, 0.08),
                color: Colors.amber,
              ),
              onPressed: () {
                navigateTo(context, AddReservationScreen());
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Add Reservation Screen"),
        ),
      ),
    );
  }
}
