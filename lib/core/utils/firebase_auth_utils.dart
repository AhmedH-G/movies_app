import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/user_data_model.dart';
import 'package:toastification/toastification.dart';

abstract class FirebaseAuthUtils {
  static Future<bool> singIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        toastification.show(
          title: Text('invalid-credential'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      } else if (e.code == 'wrong-password') {
        toastification.show(
          title: Text('Wrong password provided for that user.'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      }
      return Future.value(false);
    }
    return Future.value(true);
  }

  // static Future<bool> singUp(String emailAddress, String password) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: emailAddress,
  //           password: password,
  //         );
  //     return Future.value(true);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       toastification.show(
  //         title: Text('The password provided is too weak.'),
  //         type: ToastificationType.error,
  //         autoCloseDuration: Duration(seconds: 5),
  //       );
  //     } else if (e.code == 'email-already-in-use') {
  //       toastification.show(
  //         title: Text('The account already exists for that email.'),
  //         type: ToastificationType.error,
  //         autoCloseDuration: Duration(seconds: 5),
  //       );
  //     }else if (e.code == 'number-already-in-use') {
  //       toastification.show(
  //         title: Text('The account already exists for that number.'),
  //         type: ToastificationType.error,
  //         autoCloseDuration: Duration(seconds: 5),
  //       );
  //     }
  //     return Future.value(false);
  //   } catch (e) {
  //     print(e);
  //     return Future.value(false);
  //   }
  //   return Future.value(true);
  // }

  static Future<bool> signUp({
    required String emailAddress,
    required String password,
    String? displayName, // الاسم
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      if (displayName != null && displayName.isNotEmpty) {
        await credential.user!.updateDisplayName(displayName);
        await credential.user!.reload();
      }

      if (phoneNumber != null && phoneNumber.isNotEmpty) {}

      if (avatarUrl != null && avatarUrl.isNotEmpty) {
        await credential.user!.updatePhotoURL(avatarUrl);
      }

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastification.show(
          title: Text('The password provided is too weak.'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      } else if (e.code == 'email-already-in-use') {
        toastification.show(
          title: Text('The account already exists for that email.'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      } else if (e.code == 'phone-already-in-use') {
        toastification.show(
          title: Text('The account already exists for that number.'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      } else {
        toastification.show(
          title: Text(e.message ?? 'An unknown error occurred.'),
          type: ToastificationType.error,
          autoCloseDuration: Duration(seconds: 5),
        );
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  static Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }

  static Future<bool> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return false;

      await user.delete();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'requires-recent-login') {
        return false;
      }

      return false;
    }
  }

  static CollectionReference<UserDataModel> _getCollectionRef() {
    return FirebaseFirestore.instance
        .collection("UserCollection")
        .withConverter<UserDataModel>(
          fromFirestore: (snapshot, _) =>
              UserDataModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future<void> createUser(UserDataModel user) async {
    var collectionRef = _getCollectionRef();
    var docRef = collectionRef.doc(user.uId);

    return docRef.set(user);
  }

  static Future<UserDataModel?> getUserFromFireStore(String id) async {
    var collectionRef = _getCollectionRef();
    var docSnapshot = await collectionRef.doc(id).get();
    return docSnapshot.data();
  }

  static Future<void> updateUserData(UserDataModel user) async {
    var collectionRef = _getCollectionRef();
    var docRef = collectionRef.doc(user.uId);
    return docRef.update(user.toFireStore());
  }
}
