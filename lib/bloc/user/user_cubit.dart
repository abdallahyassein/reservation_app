import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/bloc/user/user_states.dart';
import 'package:reservation_app/models/UserModel.dart';
import 'package:reservation_app/services/LoginServices.dart';
import 'package:reservation_app/services/RegisterServices.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UnLoggedState());

  static UserCubit get(context) => BlocProvider.of(context);
  UserModel userModel;

  loginUser(email, password) async {
    emit(LoadingState());
    await LoginServices.loginUser(email, password).then((result) {
      if (result["success"] == true) {
        emit(LoggedState());
        userModel = result["user"];
      } else {
        emit(LogFailedState("Wrong email or password"));
      }
    });
  }

  registerUser(UserModel userModel) async {
    emit(LoadingState());
    await RegisterServices.registerUser(userModel).then((result) {
      if (result["success"] == true) {
        emit(RegisteredSuccessfullyState("Registered Successfully"));
      } else {
        emit(RegisterFailedState("Error Please try again"));
      }
    });
  }
}
