import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/bloc/user/user_states.dart';
import 'package:reservation_app/models/UserModel.dart';
import 'package:reservation_app/screens/login_screen.dart';
import 'package:reservation_app/utils/dialog_utils.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/loading_progress.dart';
import 'package:reservation_app/widgets/login_widgets/custom_button.dart';
import 'package:reservation_app/widgets/login_widgets/custom_password_field.dart';
import 'package:reservation_app/widgets/login_widgets/custom_text_field.dart';

import '../../constants/colors.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if (state is RegisterFailedState) {
          showSimpleMessageDialog(context, state.failedMessage, "ok", () {});
        }
        if (state is RegisteredSuccessfullyState) {
          showSimpleMessageDialog(context, state.successMessage, "ok", () {});
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: state is LoadingState
                    ? Container(
                        height: setHeight(context, 0.5),
                        child: LoadingProgress())
                    : Column(
                        children: [
                          CustomTextField(
                            controller: _name,
                            hintText: "Full Name",
                            validator: (val) {},
                          ),
                          SizedBox(
                            height: setHeight(context, k12TextSize),
                          ),
                          CustomTextField(
                            controller: _email,
                            hintText: "Email",
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please enter email";
                              }
                            },
                          ),
                          SizedBox(
                            height: getSize(context).height * k12TextSize,
                          ),
                          CustomPasswordField(
                            controller: _password,
                            hintText: "Password",
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please add password";
                              } else if (val.length < 6) {
                                return "password characters must be at least 6";
                              }
                            },
                          ),
                          SizedBox(
                            height: getSize(context).height * k12TextSize,
                          ),
                          CustomPasswordField(
                            controller: _confirmPassword,
                            hintText: "Confirm Password",
                            validator: (val) {
                              if (val.isEmpty) {
                                return "please add password";
                              } else if (_password.text != val) {
                                return "passwords does not match";
                              }
                            },
                          ),
                          SizedBox(
                            height: setHeight(context, k12TextSize),
                          ),
                          CustomButton(
                              width: getSize(context).width * 0.3,
                              height: getSize(context).height * 0.06,
                              color: kOrangeColor,
                              buttonText: "Register",
                              fontSize: getSize(context).width * k18TextSize,
                              onTap: () {
                                register();
                              }),
                          SizedBox(
                            height: getSize(context).height * k12TextSize,
                          ),
                          SizedBox(
                            height: setHeight(context, k12TextSize),
                          ),
                        ],
                      )),
          ),
        );
      },
    );
  }

  register() {
    if (_formKey.currentState.validate()) {
      UserCubit.get(context).registerUser(UserModel(
          id: "",
          email: _email.text,
          password: _password.text,
          confirmPassword: _confirmPassword.text,
          name: _name.text));
    }
  }
}
