import 'package:flutter/material.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';

class ServiceCardDetails extends StatelessWidget {
  final bool today;
  const ServiceCardDetails(this.today);

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
                      height: setHeight(context, 0.07),
                      child: Image.asset(
                        'assets/images/logo.png',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getSize(context).width * 0.2,
                                  child: Text(
                                    "order.branchAddress",
                                    style: TextStyle(
                                      color: kDarkGreyColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getSize(context).width * k12TextSize,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getSize(context).width * 0.2,
                                  child: Text(
                                    "order.distance",
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
                            SizedBox(
                              height: getSize(context).height * k10TextSize,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getSize(context).width * 0.2,
                                  child: Text(
                                    "order.orderTime",
                                    style: TextStyle(
                                      color: kDarkGreyColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getSize(context).width * k12TextSize,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: getSize(context).width * 0.2,
                                  child: Text(
                                    "order.orderDay",
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: getSize(context).width * 0.65,
                    child: Card(
                      elevation: 0,
                      color: kOrangeColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "order.orderCode",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getSize(context).width * k10TextSize,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "asdsad",
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
        // navigateTo(context, NumberDetailsScreen(order, today));
      },
    );
  }
}
