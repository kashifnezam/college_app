import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ---------Sign in with Google-------0--------
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

// / -----------Google Signout function-----------

signOutGoogle() async {
  debugPrint("confirm sout");

  await FirebaseAuth.instance.signOut();
  await GoogleSignIn()
      .signOut()
      .then((value) => debugPrint("signout sucess-----"));
}

uploadtoFirebase(
    {required course,
    required sem,
    required sub,
    required String topic,
    required String link,
    required String fileName,
    required bool isAssign,
    required File filePDF}) async {
  User? currUser = FirebaseAuth.instance.currentUser;
  // for Actual PDF File
  final refPDF = FirebaseStorage.instance
      .ref("pdf/$course/$sub/${fileName.split(".")[0]}.pdf");
  await refPDF.putFile(filePDF);
  final downLinkPDF = await refPDF.getDownloadURL();
  await FirebaseFirestore.instance
      .collection(course)
      .doc(DateTime.now().millisecondsSinceEpoch.toString())
      .set({
    "userID": currUser?.uid,
    "URL": downLinkPDF,
    "fileName": fileName,
    "course": course,
    "semester": sem,
    "assignment": isAssign,
    "email": currUser?.email,
    "subject": sub,
    "uploadedTime": DateTime.now(),
    "name": fileName
  }).then((value) => {Get.snackbar(fileName, "Data saved Successfully")});
}

dialogueBox() {
  Get.defaultDialog(
    title: "Video Unavailable",
    middleText: "Contact admin for any Query",
    textConfirm: "Ok",
    onConfirm: () => Get.back(),
  );
}

Future<bool> getAdmin() async {
  bool isAdmin = false;
  if (FirebaseAuth.instance.currentUser == null) return false;
  String currUser = FirebaseAuth.instance.currentUser!.uid.toString();
  final snapShot =
      await FirebaseFirestore.instance.collection('user').doc(currUser).get();
  if (snapShot.exists) {
    isAdmin = snapShot.data()?['isAdmin'] ?? false;
  }

  return isAdmin;
}
