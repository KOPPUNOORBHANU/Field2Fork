import 'package:field_2_fork/views/consumer/consumerSignUpScreen.dart';
import 'package:field_2_fork/views/farmer/farmerSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[300],
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => FarmerSignUpScreen());
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset(
                              'assets/images/farmersignup.svg',
                              width: 150,
                              height: 180,
                            ),
                          ),
                        ),
                        Text(
                          'Farmer',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ConsumerSignUpScreen());
              },
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset(
                              'assets/images/consumer.svg',
                              width: 300,
                              height: 250,
                            ),
                          ),
                        ),
                        Text(
                          'Consumer',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
