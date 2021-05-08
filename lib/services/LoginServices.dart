import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reservation_app/models/UserModel.dart';

class LoginServices {
  static Future<dynamic> loginUser(
    String email,
    String password,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    var result;

    bool success = false;

    UserModel userModel;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // print(user.user.email);

      await firestore
          .collection("users")
          .where("email", isEqualTo: user.user.email)
          .where("id", isEqualTo: user.user.uid)
          .get()
          .then((value) {
        // print(value.docs.first["type"]);
        if (value != null) {
          userModel = UserModel.fromMap(value.docs.first);
          print(userModel.email);
          success = true;
        } else {
          success = false;
        }
      });
    } catch (e) {
      success = false;
    }
    result = {"success": success, "user": userModel};
    return result;
  }
}
