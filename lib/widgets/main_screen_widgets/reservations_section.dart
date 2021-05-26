import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/models/ReservationModel.dart';
import 'package:reservation_app/models/UserModel.dart';
import 'package:reservation_app/services/ReservationServices.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/loading_progress.dart';
import 'package:reservation_app/widgets/main_screen_widgets/service_card_details.dart';

class ReservationsSection extends StatelessWidget {
  final bool today;
  ReservationsSection({this.today});
  @override
  Widget build(BuildContext context) {
    UserModel user = UserCubit.get(context).userModel;
    return Column(
      children: [
        Container(
          height: setHeight(context, 0.53),
          child: FutureBuilder(
            future: ReservationServices.getUserReservations(user.id, today),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Center(
                    child: LoadingProgress(),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<ReservationModel> reservations = snapshot.data;
                  if (reservations.isEmpty) {
                    return Center(
                      child: Text('No reservations right now',
                          style: GoogleFonts.squadaOne(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: setWidth(context, 0.07),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              color: kOrangeColor)),
                    );
                  }
                  return ListView.builder(
                    itemCount: reservations.length,
                    itemBuilder: (context, index) {
                      return ServiceCardDetails(reservations[index], today);
                    },
                  );
                }
              }
              return Container(
                child: Center(
                  child: Text(
                    "No Reservations until now",
                    style: TextStyle(
                      color: kDarkGreyColor,
                      fontSize: getSize(context).width * k20TextSize,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: getSize(context).height * k10TextSize,
        ),
      ],
    );
  }
}
