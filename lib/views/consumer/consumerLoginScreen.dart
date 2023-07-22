// ignore_for_file: avoid_unnecessary_containers

import 'package:field_2_fork/views/consumer/consumerForgotPassword.dart';
import 'package:field_2_fork/views/consumer/consumerHome.dart';
import 'package:field_2_fork/views/consumer/consumerSignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConsumerLoginScreen extends StatefulWidget {
  const ConsumerLoginScreen({super.key});

  @override
  State<ConsumerLoginScreen> createState() => _ConsumerLoginScreenState();
}

class _ConsumerLoginScreenState extends State<ConsumerLoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  void showAlert() {
    QuickAlert.show(
        context: context,
        title: 'Wrong Password',
        confirmBtnColor: const Color.fromARGB(255, 9, 154, 19),
        text: "Password mismatched!!",
        type: QuickAlertType.error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color.fromARGB(255, 9, 154, 19),
        backgroundColor: const Color.fromARGB(255, 9, 154, 19),
        centerTitle: true,
        title: const Text("Consumer Login"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        // actions: const [Icon(Icons.more_vert)],
      ),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_constructors
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                alignment: Alignment.center,
                height: 300.0,
                child: Lottie.asset("assets/images/consumerLogin.json"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: loginEmailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: loginPasswordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () async {
                  // ignore: unused_local_variable
                  var email = loginEmailController.text.trim();
                  // ignore: unused_local_variable
                  var password = loginPasswordController.text.trim();

                  try {
                    final User? firebaseUser = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password))
                        .user;
                    if (firebaseUser != null) {
                      Get.to(() => const ConsumerHome());
                    } else {
                      // ignore: avoid_print
                      print("Incorrect email or password!!");
                    }
                  } on FirebaseAuthException catch (e) {
                    // ignore: avoid_print
                    if (e.code == 'wrong-password') {
                      // ignore: avoid_print
                      showAlert();
                    } else {
                      print(e);
                    }
                    // print("Error $e");
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 154, 19)),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ConsumerForgotPassword());
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Forgot Password"))),
                ),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ConsumerSignUpScreen());
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Don't have an account? SignUp"))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
