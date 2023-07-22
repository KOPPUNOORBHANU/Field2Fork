import 'dart:math';

import 'package:field_2_fork/consts/consts.dart';
import 'package:field_2_fork/consts/lists.dart';
import 'package:field_2_fork/widgets_common/categoriesWidget.dart';
import 'package:field_2_fork/widgets_common/itemsWidget.dart';
import 'package:field_2_fork/widgets_common/popularWidget.dart';
import 'package:flutter/material.dart';

class ConsumerHomeScreen extends StatelessWidget {
  const ConsumerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      padding: const EdgeInsets.all(10),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 12, 107, 15),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Acme'),
              ),
              const SizedBox(
                width: 60,
              ),
              Image.asset(
                'assets/images/home_icon.png',
                width: 60,
                height: 60,
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            height: 60,
            alignment: Alignment.center,
            child: TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Search products...",
                    hintStyle: TextStyle(color: textfieldGrey))),
          ),
          VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 210,
              enlargeCenterPage: true,
              itemCount: farmSliderlist.length,
              itemBuilder: (context, index) {
                // ignore: avoid_unnecessary_containers
                return Image.asset(
                  farmSliderlist[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(const EdgeInsets.symmetric(horizontal: 8))
                    .make();
              }),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoriesWidget(),
                PopularWidget(),
                ItemsWidget(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
