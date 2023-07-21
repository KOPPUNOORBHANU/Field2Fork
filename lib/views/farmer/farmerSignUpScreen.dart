import 'package:flutter/material.dart';

class FarmerSignUpScreen extends StatefulWidget {
  const FarmerSignUpScreen({super.key});

  @override
  State<FarmerSignUpScreen> createState() => _FarmerSignUpScreenState();
}

class _FarmerSignUpScreenState extends State<FarmerSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
    );
  }
}
