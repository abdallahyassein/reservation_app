import 'package:flutter/material.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/models/UserModel.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/main_screen_widgets/service_card_details.dart';

class ObservationsSection extends StatelessWidget {
  final bool today;
  ObservationsSection({this.today});
  @override
  Widget build(BuildContext context) {
    UserModel user = UserCubit.get(context).userModel;
    return Column(
      children: [
        Container(
          height: setHeight(context, 0.53),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ServiceCardDetails(false);
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
