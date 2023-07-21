import 'package:flutter/material.dart';

class ConsumerSignUpScreen extends StatefulWidget {
  const ConsumerSignUpScreen({super.key});

  @override
  State<ConsumerSignUpScreen> createState() => _ConsumerSignUpScreenState();
}

class _ConsumerSignUpScreenState extends State<ConsumerSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello Consumer")),
    );
  }
}
