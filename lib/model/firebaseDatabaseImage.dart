import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBaseImage {
  FireStoreDataBaseImage(this.email);

  final String email;

  String? downloadURL;

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child('profile_picture/${email}')
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
