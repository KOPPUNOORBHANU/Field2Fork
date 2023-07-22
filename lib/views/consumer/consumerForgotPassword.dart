// ignore_for_file: avoid_unnecessary_containers

import 'package:field_2_fork/views/consumer/consumerLoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConsumerForgotPassword extends StatefulWidget {
  const ConsumerForgotPassword({super.key});

  @override
  State<ConsumerForgotPassword> createState() => _ConsumerForgotPasswordState();
}

class _ConsumerForgotPasswordState extends State<ConsumerForgotPassword> {
  TextEditingController userEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, foregroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 9, 154, 19),
        backgroundColor: const Color.fromARGB(255, 9, 154, 19),
        centerTitle: true,
        title: const Text("Forgot Password"),
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
                height: 350.0,
                child:
                    Lottie.asset("assets/images/consumerForgotPassword.json"),
              ),
              const SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                    controller: userEmailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter Email for reset password link',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () async {
                  var forgotEmail = userEmailController.text.trim();

                  try {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value) => {
                              print("Email Sent!!"),
                              Get.off(() => const ConsumerLoginScreen()),
                            });
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Send Link",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 154, 19)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
