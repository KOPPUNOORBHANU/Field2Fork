import 'package:field_2_fork/consts/consts.dart';
import 'package:field_2_fork/controllers/farmerHomeController.dart';
import 'package:field_2_fork/views/farmer/FarmerAccount/FarmerAccountScreen.dart';
import 'package:field_2_fork/views/farmer/FarmerAddProduct/fameraddproduct.dart';
import 'package:field_2_fork/views/farmer/FarmerMyProducts/farmermyproducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'farmerhome.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FarmerHomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icShop,
            width: 26,
          ),
          label: myproducts),
      BottomNavigationBarItem(
          icon: Image.asset(
            icPlus,
            width: 26,
          ),
          label: addproducts),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account)
    ];

    var navbody = [
      const FarmerHome(),
      const FarmerMyProductsScreen(),
      const FarmerAddProductScreen(),
      const FarmerAccountScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navbody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: green,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
