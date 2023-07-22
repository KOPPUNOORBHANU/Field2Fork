import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/farmerSignupService.dart';
import 'farmerLoginScreen.dart';

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
        title: Text("Farmer SignUp Screen"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0),
        backgroundColor: Colors.green[400],
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 230.0,
                  child: SvgPicture.asset("assets/images/farmer.svg"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: farmerUserNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "User Name",
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
                  controller: farmerPhoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone",
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
                  controller: farmerEmailController,
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
                  controller: farmerPasswordController,
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
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400]),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=>FarmerLoginScreen());
                },
                child: Container(
                  child: Card(
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
