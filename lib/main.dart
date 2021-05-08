import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/bloc_observer.dart';
import 'package:reservation_app/bloc/user/user_cubit.dart';
import 'package:reservation_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: MaterialApp(
          title: 'Reservation App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen()),
    );
  }
}
