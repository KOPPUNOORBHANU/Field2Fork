import 'package:field_2_fork/consts/colors.dart';
import 'package:field_2_fork/consts/strings.dart';
import 'package:field_2_fork/consts/styles.dart';
import 'package:field_2_fork/views/consumer/consumerCartScreen.dart';
import 'package:field_2_fork/views/consumer/consumerCategoryScreen.dart';
import 'package:field_2_fork/views/consumer/consumerHomeScreen.dart';
import 'package:field_2_fork/views/consumer/consumerProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/images.dart';
import '../../controllers/consumerHomeController.dart';

class ConsumerHome extends StatefulWidget {
  const ConsumerHome({super.key});

  @override
  State<ConsumerHome> createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
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
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account)
    ];

    var navbody = [
      const ConsumerHomeScreen(),
      const ConsumerCategoryScreen(),
      const ConsumerCartScreen(),
      const ConsumerProfileScreen()
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
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
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
