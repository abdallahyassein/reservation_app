import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/login_widgets/login_widget.dart';
import 'package:reservation_app/widgets/login_widgets/top_part_with_logo.dart';
import 'package:reservation_app/widgets/register_widgets/register_widget.dart';

class LoginScreen extends StatefulWidget {
  final int initialIndex;
  LoginScreen({this.initialIndex = 0});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int tabView = 0;

  @override
  void initState() {
    tabView = widget.initialIndex;
    // LoginServices.loginUser("abd@abd.com", "123456");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: setHeight(context, 0.08),
              ),
              TopPartWithLogoWidget(),
              Center(
                child: Text(
                  'Reservation Security App',
                  style: GoogleFonts.squadaOne(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: setWidth(context, 0.07),
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffdf6e40)),
                ),
              ),
              Container(
                width: setWidth(context, 1),
                height: setHeight(context, 0.8),
                color: Colors.white,
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
                                BorderSide(width: 4.0, color: kDarkGreyColor),
                            insets: EdgeInsets.symmetric(horizontal: 16.0)),
                        tabs: [
                          Tab(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: tabView == 0
                                    ? kDarkGreyColor
                                    : kLighGreyColor,
                                fontSize: setWidth(context, k22TextSize),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: tabView == 1
                                    ? kDarkGreyColor
                                    : kLighGreyColor,
                                fontSize: setWidth(context, k22TextSize),
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
                          LoginWidget(),
                          RegisterWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
