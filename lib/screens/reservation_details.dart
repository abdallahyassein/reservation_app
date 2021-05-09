import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/models/ReservationModel.dart';
import 'package:reservation_app/screens/main_screen.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';

class ReservationDetailsScreen extends StatefulWidget {
  final ReservationModel reservationModel;

  ReservationDetailsScreen(this.reservationModel);
  @override
  _ReservationDetailsScreenState createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getSize(context).height * k50TextSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: kDarkGreyColor,
                      size: getSize(context).width * 0.1,
                    ),
                    onPressed: () {
                      navigateTo(context, MainScreen());
                    })
              ],
            ),
            SizedBox(
              height: getSize(context).height * k12TextSize,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: getSize(context).width,
              child: Card(
                color: kLightHintColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getSize(context).height * k10TextSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: kDarkGreyColor,
                            width: getSize(context).width * 0.4,
                            height: getSize(context).height * 0.2,
                            child: Image.network(
                              widget.reservationModel.userPicUrl,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: getSize(context).height * k10TextSize,
                      ),
                      Center(
                        child: Text(
                          widget.reservationModel.details,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: kDarkGreyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: getSize(context).width * k20TextSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getSize(context).height * k10TextSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Appointment Date : " +
                                widget.reservationModel.appointmentDate
                                    .toDate()
                                    .toString()
                                    .substring(0, 16),
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: getSize(context).width * k18TextSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getSize(context).height * k10TextSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Creation Date : " +
                                widget.reservationModel.creationDate
                                    .toDate()
                                    .toString()
                                    .substring(0, 16),
                            style: TextStyle(
                              color: kDarkGreyColor,
                              fontSize: getSize(context).width * k18TextSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getSize(context).height * k10TextSize,
            ),
            SizedBox(
              height: getSize(context).height * k10TextSize,
            ),
          ],
        ),
      ),
    );
  }
}
