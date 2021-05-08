import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reservation_app/models/UserModel.dart';

class RegisterServices {
  static Future<dynamic> registerUser(UserModel user) async {
    bool success = false;

    var result;
    String userId = "";
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    // print("1");
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      userId = auth.currentUser.uid;

      await firestoreInstance.collection("users").add(user.toMap(userId));
      success = true;
    } catch (e) {
      print(e.message);
      success = false;
    }

    result = {"success": success, "message": "Registered Successfully"};

    return result;
  }
}
