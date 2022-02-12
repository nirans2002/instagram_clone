import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/user_model.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//  get user details

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // sign up with email and password
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          // ignore: unnecessary_null_comparison
          file != null) {
        //reg user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoURL = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user

        model.User _user = model.User(
          username: userName,
          uid: cred.user!.uid,
          profileImage: photoURL,
          email: email,
          bio: bio,
          followers: {},
          following: {},
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      } else {
        res = e.code;
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

// login userName
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some errr occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "succes";
      } else {
        res = "Please enter email and password";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'User with this email not found';
      }
      if (e.code == 'wrong-password') {
        res = 'Wrong password provided for this user';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
//TODO: 2.15