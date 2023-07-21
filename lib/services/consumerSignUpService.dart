import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_2_fork/views/consumer/consumerLoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_fire/views/loginScreen.dart';
import 'package:get/get.dart';

signUpUser(String consumerName, String consumerPhone, String consumerEmail,
    String consumerPassword) async {
  User? consumerid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance
        .collection("Consumers")
        .doc(consumerid!.uid)
        .set({
      'ConsumerName': consumerName,
      'ConsumerPhone': consumerPhone,
      'ConsumerEmail': consumerEmail,
      'createdAt': DateTime.now(),
      'ConsumerId': consumerid.uid,
    }).then((value) => {
              FirebaseAuth.instance.signOut(),
              // ignore: prefer_const_constructors
              Get.to(() => ConsumerLoginScreen()),
            });
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print("Error $e");
  }
}
