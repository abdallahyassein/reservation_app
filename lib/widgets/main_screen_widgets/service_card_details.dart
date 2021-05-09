import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/models/ReservationModel.dart';
import 'package:reservation_app/screens/reservation_details.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';

class ServiceCardDetails extends StatelessWidget {
  final ReservationModel reservationModel;
  final bool today;

  const ServiceCardDetails(this.reservationModel, this.today);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                      width: setWidth(context, 0.25),
                      height: setHeight(context, 0.1),
                      child: Image.network(
                        reservationModel.userPicUrl,
                        fit: BoxFit.fill,
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: getSize(context).width * 0.65,
                    child: Card(
                      elevation: 0,
                      color: kLightGray,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: getSize(context).width * 0.2,
                              child: Text(
                                reservationModel.details,
                                style: TextStyle(
                                  color: kDarkGreyColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      getSize(context).width * k12TextSize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getSize(context).height * k10TextSize,
                            ),
                            Container(
                              width: getSize(context).width * 0.65,
                              child: Text(
                                "Creation Date : " +
                                    reservationModel.creationDate
                                        .toDate()
                                        .toString()
                                        .substring(0, 16),
                                style: TextStyle(
                                  color: kDarkGreyColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      getSize(context).width * k12TextSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: getSize(context).width * 0.65,
                    child: Card(
                      elevation: 0,
                      color: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Appointment: ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getSize(context).width * k14TextSize,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    reservationModel.appointmentDate
                                        .toDate()
                                        .toString()
                                        .substring(0, 16),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getSize(context).width * k14TextSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1.3,
          )
        ],
      ),
      onTap: () {
        navigateTo(context, ReservationDetailsScreen(reservationModel));
      },
    );
  }
}
