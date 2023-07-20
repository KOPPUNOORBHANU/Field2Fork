import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:field_2_fork/views/phoneAuthentication.dart';
import 'package:field_2_fork/views/otpVerification.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Field 2 Fork',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EntryScreen(),
    );
  }
}

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Field 2 Fork"),
          ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 350.0,
              child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Lottie.asset("assets/images/welcome.json")),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "WELCOME",
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Phone());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[
                            400], // Set the button's background color to green
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
