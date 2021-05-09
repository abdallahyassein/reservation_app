import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservation_app/models/ReservationModel.dart';

class ReservationServices {
  static Future addReservation(ReservationModel reservationModel) async {
    bool success = false;
    String errorMessage = "";
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    //print("1");
    try {
      await firestoreInstance
          .collection("reservations")
          .add(reservationModel.toMap())
          .then((value) {
        success = true;
      });
    } catch (e) {
      errorMessage = e.message;
      success = false;
    }

    var result;
    if (errorMessage.isEmpty) {
      result = {"success": success};
    } else {
      result = {"success": success, "errorMessage": errorMessage};
    }
    print("2asdasd");
    return result;
  }
}
