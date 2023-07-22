import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/farmerSignupService.dart';

class FarmerSignUpScreen extends StatefulWidget {
  const FarmerSignUpScreen({super.key});

  @override
  State<FarmerSignUpScreen> createState() => _FarmerSignUpScreenState();
}

class _FarmerSignUpScreenState extends State<FarmerSignUpScreen> {
  TextEditingController farmerUserNameController = TextEditingController();
  TextEditingController farmerPhoneController = TextEditingController();
  TextEditingController farmerEmailController = TextEditingController();
  TextEditingController farmerPasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Farmer SignUp Screen"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
        backgroundColor: Colors.green[400],
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 230.0,
                  child: SvgPicture.asset("assets/images/farmer.svg"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerUserNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "User Name",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerPhoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerEmailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerPasswordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffix: Icon(Icons.visibility),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  var farmerUserName = farmerUserNameController.text.trim();
                  var farmerPhone = farmerPhoneController.text.trim();
                  var farmerEmail = farmerEmailController.text.trim();
                  var farmerPassword = farmerPasswordController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: farmerEmail, password: farmerPassword)
                      .then((value) => {
                            print("User Created"),
                            signUpFarmer(farmerUserName, farmerPhone,
                                farmerEmail, farmerPassword),
                          });
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Card(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Already Have an Account? LogIn")),
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
