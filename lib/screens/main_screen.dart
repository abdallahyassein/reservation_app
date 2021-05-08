import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<UserCubit>(context).userModel.email);
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserCubit(),
        child: Container(
          child: Text("Main Screen"),
        ),
      ),
    );
  }
}
