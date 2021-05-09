import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/models/ReservationModel.dart';
import 'package:reservation_app/models/UserModel.dart';
import 'package:reservation_app/screens/add_reservation_screen.dart';
import 'package:reservation_app/services/ReservationServices.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/main_screen_widgets/observations_section.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabView = 0;

  @override
  Widget build(BuildContext context) {
    UserModel user = UserCubit.get(context).userModel;
    // ReservationServices.addReservation(ReservationModel(
    //     user.id, "details", "userPicUrl", Timestamp.now(), Timestamp.now()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Main Screen",
          style: TextStyle(
              color: kDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontSize: setWidth(context, k22TextSize)),
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_outlined,
        //     color: kDarkGreyColor,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * k12TextSize,
            ),
            Center(
              child: Container(
                width: getSize(context).width * 0.3,
                height: getSize(context).width * 0.3,
                child: Icon(
                  Icons.person_pin,
                  size: setWidth(context, 0.3),
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(
              height: getSize(context).height * k12TextSize,
            ),
            Text(
              user.name,
              style: TextStyle(
                color: kOrangeColor,
                fontWeight: FontWeight.w600,
                fontSize: getSize(context).width * k22TextSize,
              ),
            ),
            Text(
              user.email,
              style: TextStyle(
                color: kDarkGreyColor,
                fontWeight: FontWeight.w600,
                fontSize: getSize(context).width * k22TextSize,
              ),
            ),
            SizedBox(
              height: getSize(context).height * k12TextSize,
            ),
            Container(
              width: getSize(context).width,
              height: getSize(context).height * 0.8,
              child: DefaultTabController(
                length: 2,
                initialIndex: tabView,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      indicatorColor: kDarkGreyColor,
                      indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 4.0, color: kOrangeColor),
                          insets: EdgeInsets.symmetric(horizontal: 16.0)),
                      tabs: [
                        Tab(
                          child: Text(
                            "Today Reservations",
                            style: TextStyle(
                              color: tabView == 0
                                  ? kOrangeColor
                                  : kLightOrangeColor,
                              fontSize: getSize(context).width * k12TextSize,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Before Reservations",
                            style: TextStyle(
                              color: tabView == 1
                                  ? kOrangeColor
                                  : kLightOrangeColor,
                              fontSize: getSize(context).width * k12TextSize,
                            ),
                          ),
                        ),
                      ],
                      onTap: (index) {
                        setState(() {
                          tabView = index;
                        });
                      },
                    ),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ObservationsSection(
                          today: true,
                        ),
                        ObservationsSection(
                          today: false,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
