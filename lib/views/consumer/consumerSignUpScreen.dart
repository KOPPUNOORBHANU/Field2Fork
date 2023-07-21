// ignore_for_file: avoid_unnecessary_containers

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:field_2_fork/views/consumer/consumerLoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../services/consumerSignUpService.dart';

class ConsumerSignUpScreen extends StatefulWidget {
  const ConsumerSignUpScreen({super.key});

  @override
  State<ConsumerSignUpScreen> createState() => _ConsumerSignUpScreenState();
}

class _ConsumerSignUpScreenState extends State<ConsumerSignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.lightGreen,
        backgroundColor: Color.fromARGB(255, 9, 154, 19),
        centerTitle: true,
        title: const Text("Consumer SignUp"),
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
                height: 250.0,
                child: Lottie.asset("assets/images/consumerSignUp.json"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 6.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Phone',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 6.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 6.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  var consumerName = userNameController.text.trim();
                  var consumerPhone = phoneController.text.trim();
                  var consumerEmail = emailController.text.trim();
                  var consumerPassword = passwordController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: consumerEmail, password: consumerPassword)
                      .then((value) => {
                            log("User Created"),
                            signUpUser(consumerName, consumerPhone,
                                consumerEmail, consumerPassword),
                          });
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 154, 19)),
              ),
              const SizedBox(height: 4.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ConsumerLoginScreen());
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Already have an account? LogIn"))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
