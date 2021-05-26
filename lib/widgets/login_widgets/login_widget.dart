import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/bloc/user/user_states.dart';
import 'package:reservation_app/screens/main_screen.dart';
import 'package:reservation_app/utils/dialog_utils.dart';
import 'package:reservation_app/utils/dimens.dart';
import 'package:reservation_app/utils/methods_helper.dart';
import 'package:reservation_app/widgets/loading_progress.dart';
import 'package:reservation_app/widgets/login_widgets/custom_button.dart';
import 'package:reservation_app/widgets/login_widgets/custom_password_field.dart';
import 'package:reservation_app/widgets/login_widgets/custom_text_field.dart';

import '../../constants/colors.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if (state is LogFailedState) {
          showSimpleMessageDialog(context, state.failedMessage, "ok", () {});
        }
        if (state is LoggedState) {
          navigateToWithReplacement(context, MainScreen());
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
                      height: setHeight(context, 0.5), child: LoadingProgress())
                  : Column(
                      children: [
                        CustomTextField(
                          controller: _email,
                          hintText: "Enter Email",
                          validator: (val) {
                            if (val.isEmpty) {
                              return "please add email";
                            }
                          },
                        ),
                        SizedBox(
                          height: setHeight(context, k12TextSize),
                        ),
                        CustomPasswordField(
                          controller: _password,
                          hintText: "Enter Password",
                          validator: (val) {
                            if (val.isEmpty) {
                              return "please add password";
                            }
                          },
                        ),
                        SizedBox(
                          height: setHeight(context, k12TextSize),
                        ),
                        SizedBox(
                          height: setHeight(context, k12TextSize),
                        ),
                        CustomButton(
                            width: setWidth(context, 0.3),
                            height: setHeight(context, 0.06),
                            color: Color(0xffdf6e40),
                            buttonText: "Login",
                            fontSize: setWidth(context, k18TextSize),
                            onTap: () {
                              login();
                            }),
                        SizedBox(
                          height: setHeight(context, k12TextSize),
                        ),
                      ],
                    )),
        ));
      },
    );
  }

  login() {
    if (_formKey.currentState.validate()) {
      UserCubit.get(context).loginUser(_email.text, _password.text);
    }
  }
}
