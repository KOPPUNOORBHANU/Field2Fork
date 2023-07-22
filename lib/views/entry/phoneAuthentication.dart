// ignore: file_names
import 'package:field_2_fork/views/entry/otpVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController countryController = TextEditingController();
 
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 350.0,
                child: Lottie.asset("assets/images/phoneVerified.json"),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      //controller: phoneController,
                      onChanged: (value) {
                        phone = value;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Phone"),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber:
                            // ignore: unnecessary_string_interpolations
                            '${countryController.text + phone}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Phone.verify = verificationId;
                          Get.to(() => MyVerify());
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: const Text(
                      "Send the code",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
