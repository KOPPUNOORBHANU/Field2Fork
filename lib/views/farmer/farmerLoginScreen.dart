import 'package:flutter/material.dart';

class FarmerLoginScreen extends StatefulWidget {
  const FarmerLoginScreen({super.key});

  @override
  State<FarmerLoginScreen> createState() => _FarmerLoginScreenState();
}

class _FarmerLoginScreenState extends State<FarmerLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farmer Login Screen"),
      ),
    );
  }
}
