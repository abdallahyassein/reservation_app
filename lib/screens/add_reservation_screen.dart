import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/add_reservation/reservation_cubit.dart';
import 'package:reservation_app/bloc/add_reservation/reservation_states.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/constants/colors.dart';
import 'package:reservation_app/screens/main_screen.dart';
import 'package:reservation_app/utils/dialog_utils.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/loading_progress.dart';
import 'package:reservation_app/widgets/login_widgets/custom_button.dart';

class AddReservationScreen extends StatefulWidget {
  @override
  _AddReservationScreenState createState() => _AddReservationScreenState();
}

class _AddReservationScreenState extends State<AddReservationScreen> {
  TextEditingController _details = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Reserve",
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
        actions: [],
      ),
      body: BlocConsumer<ReservationCubit, ReservationStates>(
        listener: (context, state) {
          if (state is FailedReservationState) {
            showSimpleMessageDialog(context, state.failedMessage, "Ok", () {});
          }

          if (state is SuccessedReservationState) {
            showSimpleMessageDialog(context, state.successMessage, "Ok", () {})
                .then((value) {
              navigateToWithReplacement(context, MainScreen());
            });
          }
        },
        builder: (context, state) {
          return state is LoadingReservationState
              ? Container(
                  child: Center(
                    child: LoadingProgress(),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _details,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: kHintColor)),
                            hintText:
                                "Please add details about your reservation",
                          ),
                          onChanged: (val) {
                            ReservationCubit.get(context).setDetails(val);
                          },
                          // ignore: missing_return
                          validator: (val) {
                            if (val.isEmpty) {
                              return "please add details about the appointment";
                            }
                          },
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    Center(
                      child: Text(
                        "Upload a clear picture for you please",
                        style: TextStyle(
                          color: kDarkGreyColor,
                          fontSize: getSize(context).width * k20TextSize,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.camera,
                              color: kDarkGreyColor,
                              size: setWidth(context, k60TextSize),
                            ),
                            onPressed: () {
                              ReservationCubit.get(context)
                                  .getImage(context, "camera");
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.image,
                              color: kDarkGreyColor,
                              size: setWidth(context, k60TextSize),
                            ),
                            onPressed: () {
                              ReservationCubit.get(context)
                                  .getImage(context, "gallery");
                            })
                      ],
                    ),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    ReservationCubit.get(context).image != null
                        ? Container(
                            width: setWidth(context, 0.8),
                            height: setHeight(context, 0.5),
                            child: Image.file(
                              File(ReservationCubit.get(context).image.path),
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    Divider(),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    Center(
                      child: Text(
                        "Appointment Time",
                        style: TextStyle(
                          color: kDarkGreyColor,
                          fontSize: getSize(context).width * k20TextSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            ReservationCubit.get(context).selectDate(context);
                          },
                          child: Text(
                            ReservationCubit.get(context).appointmentDate !=
                                    null
                                ? ReservationCubit.get(context)
                                    .appointmentDate
                                    .toDate()
                                    .toString()
                                : 'Select Appointment Date',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                    CustomButton(
                        width: getSize(context).width * 0.3,
                        height: getSize(context).height * 0.06,
                        color: kOrangeColor,
                        buttonText: "Reserve",
                        fontSize: getSize(context).width * k18TextSize,
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            ReservationCubit.get(context).uploadReservation(
                                context, UserCubit.get(context).userModel.id);
                          }
                        }),
                    SizedBox(
                      height: setHeight(context, k12TextSize),
                    ),
                  ],
                ));
        },
      ),
    );
  }
}
