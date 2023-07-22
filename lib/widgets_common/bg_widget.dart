import 'package:field_2_fork/consts/images.dart';
import 'package:flutter/material.dart';
import 'package:field_2_fork/consts/consts.dart';

Widget bgWidget({required Widget child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/icons/bg.png"), fit: BoxFit.fill)),
    child: child,
  );
}
