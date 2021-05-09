import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid_enhanced/uuid.dart';
import 'package:uuid_enhanced/uuid_util.dart';

class PicHelper {
  static Future<dynamic> getImage(context, String type) async {
    bool success = false;
    String errorMessage = "";
    PickedFile image;
    var result;
    ImagePicker _picker = ImagePicker();
    try {
      if (type == "camera") {
        image = await _picker.getImage(source: ImageSource.camera);
      } else if (type == "gallery") {
        image = await _picker.getImage(source: ImageSource.gallery);
      }
      success = true;
    } catch (e) {
      errorMessage = e.message;
      success = false;
    }

    if (errorMessage.isEmpty) {
      result = {"success": success, "image": image};
    } else {
      result = {"success": success, "errorMessage": errorMessage};
    }

    print(result);
    return result;

    // uploadPic(context, image).then((value) => print("uploaded!!!!!!"));
  }

  static Future uploadPic(
      BuildContext context, PickedFile image, String path) async {
    bool success = false;
    String errorMessage = "";
    var result;
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = DateTime.now().toString() +
        Uuid.randomUuid(random: UuidUtil.cryptoRNG()).toString();

    try {
      if (image != null) {
        Reference firebaseStorageRef = storage.ref().child("$path/$fileName");
        await firebaseStorageRef.putFile(File(image.path));
        success = true;
      } else {
        errorMessage = "please select image";
        success = false;
      }
    } catch (e) {
      errorMessage = e.message;
      success = false;
    }
    if (errorMessage.isEmpty) {
      result = {"success": success, "fileName": fileName};
    } else {
      result = {"success": success, "errorMessage": errorMessage};
    }

    return result;
  }

  static Future<dynamic> getImageDownloadURL(
      String path, String fileName) async {
    String errorMessage = "";
    String location;

    var url;
    var result;
    try {
      var ref = FirebaseStorage.instance.ref().child("$path/$fileName");
      location = await ref.getDownloadURL();
      url = location.toString();
    } catch (e) {
      errorMessage = e.message;
    }

    if (errorMessage.isEmpty) {
      result = {"success": true, "url": url};
    } else {
      result = {"success": false, "errorMessage": errorMessage};
    }

    return result;
  }
}
