import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservation_app/bloc/add_reservation/reservation_states.dart';
import 'package:reservation_app/models/ReservationModel.dart';
import 'package:reservation_app/services/ReservationServices.dart';
import 'package:reservation_app/services/pichelper.dart';

class ReservationCubit extends Cubit<ReservationStates> {
  ReservationCubit() : super(InitialState());

  static ReservationCubit get(context) => BlocProvider.of(context);

  Timestamp appointmentDate;
  PickedFile image;
  String details = "";

  selectDate(context) {
    DatePicker.showDateTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');

      appointmentDate = Timestamp.fromDate(date);
      emit(AddedAppointmentDateState());
    }, currentTime: DateTime.now());
  }

  getImage(context, type) {
    PicHelper.getImage(context, type).then((result) {
      if (result['success'] == true) {
        image = result['image'];
        emit(AddedImageState());
      }
    });
  }

  setDetails(resDetails) {
    details = resDetails;
  }

  uploadReservation(context, userId) async {
    if (details.isNotEmpty && appointmentDate != null && image != null) {
      emit(LoadingReservationState());

      var uploadResult =
          await PicHelper.uploadPic(context, image, "reservationImages");
      String fileName = "";
      if (uploadResult['success'] == true) {
        fileName = uploadResult["fileName"];
        var getUrlResult =
            await PicHelper.getImageDownloadURL("reservationImages", fileName);
        String picUrl = "";
        if (getUrlResult["success"] == true) {
          picUrl = getUrlResult["url"];

          await ReservationServices.addReservation(ReservationModel(
                  userId, details, picUrl, Timestamp.now(), appointmentDate))
              .then((result) {
            if (result["success"] == true) {
              emit(SuccessedReservationState(
                  "Reservation Added Successfully we are waiting you"));
              details = "";
              image = null;
              appointmentDate = null;
            } else {
              emit(FailedReservationState(
                  "Error Adding Reservation Please try again in another time"));
            }
          });
        } else {
          emit(FailedReservationState(
              "Error uploading images please check your internet connection and try again"));
        }
      } else {
        emit(FailedReservationState(
            "Error uploading images please check your internet connection and try again"));
      }
    }
  }
}
