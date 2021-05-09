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

  static Future getUserReservations(String userId, bool today) async {
    List<ReservationModel> reservations = [];
    await FirebaseFirestore.instance
        .collection("reservations")
        .where("userId", isEqualTo: userId)
        .get()
        .then((snapshots) {
      snapshots.docs.forEach((element) {
        ReservationModel reserv = ReservationModel.fromMap(element);
        DateTime dateTime =
            DateTime.parse(reserv.appointmentDate.toDate().toString());
        if (today) {
          if (DateTime.now().day == dateTime.day) {
            reservations.add(reserv);
          }
        } else if (!today) {
          if (DateTime.now().day != dateTime.day) {
            reservations.add(reserv);
          }
        }
      });
    });
    return reservations;
  }
}
