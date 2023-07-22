import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_2_fork/views/farmer/Login_and_SignUp/farmerLoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signUpFarmer(String farmerUserName, String farmerPhone, String farmerEmail,
    String farmerPassword) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance
        .collection("farmers")
        .doc(userid!.uid)
        .set({
      "farmerUserName": farmerUserName,
      "farmerPhone": farmerPhone,
      "farmerEmail": farmerEmail,
      "createdAt": DateTime.now(),
      "userId": userid.uid,
    }).then((value) => {
              FirebaseAuth.instance.signOut(),
              Get.to(() => FarmerLoginScreen()),
            });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
