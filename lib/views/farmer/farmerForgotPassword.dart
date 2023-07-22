import 'package:field_2_fork/views/farmer/farmerLoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FarmerForgotPassword extends StatefulWidget {
  const FarmerForgotPassword({super.key});

  @override
  State<FarmerForgotPassword> createState() => _FarmerForgotPasswordState();
}

class _FarmerForgotPasswordState extends State<FarmerForgotPassword> {
  TextEditingController farmerForgotPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0),
        backgroundColor: Colors.green[400],
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 500.0,
                child: Lottie.asset("assets/images/farmerforgot.json"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerForgotPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var farmerForgotEmail =
                        farmerForgotPasswordController.text.trim();

                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: farmerForgotEmail)
                          .then((value) => {
                                print("Email Sent"),
                                Get.off(() => FarmerLoginScreen()),
                              });
                    } on FirebaseAuthException catch (e) {
                      print("Error $e");
                    }
                  },
                  child: Text("Forgot Password")),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
