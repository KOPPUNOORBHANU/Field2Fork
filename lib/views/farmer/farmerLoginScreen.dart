import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'farmerForgotPassword.dart';
import 'farmerHomeScreen.dart';
import 'farmerSignUpScreen.dart';
import 'package:quickalert/quickalert.dart';

class FarmerLoginScreen extends StatefulWidget {
  const FarmerLoginScreen({super.key});

  @override
  State<FarmerLoginScreen> createState() => _FarmerLoginScreenState();
}

class _FarmerLoginScreenState extends State<FarmerLoginScreen> {
  TextEditingController farmerLoginEmailController = TextEditingController();
  TextEditingController farmerLoginPasswordController = TextEditingController();

  void showAlertPassError(String error) {
    QuickAlert.show(
        context: context,
        title: "Wrong Password",
        // text:
        //     "Please Check Your Password and retype again or forgot Password Option",
        text: error,
        type: QuickAlertType.error);
  }

  void showAlertEmailError() {
    QuickAlert.show(
        context: context,
        title: "User Not Found",
        text: "You dont have a Account with this E-mail Try Signup!",
        type: QuickAlertType.error);
  }

  void showAlertWarn(String e) {
    QuickAlert.show(context: context, text: e, type: QuickAlertType.warning);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("LogIn Screen"),
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
                height: 300.0,
                child: Lottie.asset("assets/images/farmerLogin.json"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerLoginEmailController,
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerLoginPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffix: Icon(Icons.visibility),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var farmerLoginEmail =
                        farmerLoginEmailController.text.trim();
                    var farmerLoginPassword =
                        farmerLoginPasswordController.text.trim();

                    try {
                      final User? firebaseuser = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: farmerLoginEmail,
                                  password: farmerLoginPassword))
                          .user;

                      if (firebaseuser != null) {
                        Get.to(() => FarmerHomeScreen());
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showAlertEmailError();
                      } else if (e.code == 'wrong-password') {
                        showAlertPassError("${e.message}");
                      } else {
                        showAlertWarn("An Error Occurred: ${e.message}");
                      }
                    }
                  },
                  child: Text("Login")),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => FarmerForgotPassword());
                },
                child: Container(
                  child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Forgot Password"))),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => FarmerSignUpScreen());
                },
                child: Container(
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Don't Have an account ? Sign Up")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
