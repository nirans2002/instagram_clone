import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // upload post to Firestore
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
  ) async {
    try {
      String res = " Error occured";
      String photourl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
    } catch (e) {
      print(e.toString());
    }
  }
}
